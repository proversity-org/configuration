#!/usr/bin/env bash

IP="$(curl -s icanhazip.com)"

echo "Received IP = $IP, deplying to $1"


if [[ "$1" == "staging" ]]; then
	echo "Adding IP to EC2"
	aws ec2 authorize-security-group-ingress --group-id $STAGING_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
	sleep 2
	echo "Running play to update configuration"
	ssh ubuntu@staging.learn.proversity.io "/edx/bin/update -v configuration proversity/staging"
	ERROR=$?
	sleep 2
	echo "Removing IP from EC2"
	aws ec2 revoke-security-group-ingress --group-id $STAGING_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
elif [[ "$1" == "production" ]]; then
	echo "Adding IP to EC2"
	aws ec2 authorize-security-group-ingress --group-id $PRODUCTION_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
	sleep 2
	echo "Running play to update configuration"
	ssh ubuntu@studio.proversity.org "/edx/bin/update -v configuration proversity/production"
	ERROR=$?
	sleep 2
	echo "Removing IP from EC2"
	aws ec2 revoke-security-group-ingress --group-id $PRODUCTION_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
elif [[ "$1" == "development" ]]; then
	echo "Adding IP to EC2"
	aws ec2 authorize-security-group-ingress --group-id $DEV_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
	sleep 2
	echo "Running play to update configuration"
  ssh ubuntu@development.learn.proversity.io "/edx/bin/update -v configuration proversity/development"
	ERROR=$?
	sleep 2
	echo "Removing IP from EC2"
	aws ec2 revoke-security-group-ingress --group-id $DEV_SEC_GROUP --protocol tcp --port 22 --cidr "$IP/32"
fi


if [ "$ERROR" -eq 0 ];
then
  echo "Updated!"
	exit 0
else
  echo "Update failed!"
	exit 1
fi

