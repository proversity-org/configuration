-- Creating databases
CREATE DATABASE IF NOT EXISTS `ecommerce` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `edxapp` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `edxapp_csmh` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `edx_notes_api` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `discovery` CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Creating basic databases users and granting access to them
CREATE USER 'ecomm001'@'%' IDENTIFIED BY 'FyeuXe0htYTYSei9Bz2AZQ6HkEUNZ2bxpNU';
GRANT ALL PRIVILEGES ON `ecommerce`.* TO 'ecomm001'@'%';
CREATE USER 'edxapp001'@'%' IDENTIFIED BY 'KD0K5fEVpeGrTKbD67K1ei6HmuskzfEKFIy';
GRANT ALL PRIVILEGES ON `edxapp`.* TO 'edxapp001'@'%';
CREATE USER 'edxapp001'@'%' IDENTIFIED BY 'KD0K5fEVpeGrTKbD67K1ei6HmuskzfEKFIy';
GRANT ALL PRIVILEGES ON `edxapp_csmh`.* TO 'edxapp001'@'%';
CREATE USER 'discov001'@'%' IDENTIFIED BY 'MtT3OIgSnHpySPbmpCMhz6skRyihpSdmASN';
GRANT ALL PRIVILEGES ON `discovery`.* TO 'discov001'@'%';

-- Creating common migrate user and granting access to him
CREATE USER 'migrate'@'%' IDENTIFIED BY 'q0qDO5vzNfLJrQFy4CVJTErcQ81gfLIlEoN';
CREATE USER 'read_only'@'%' IDENTIFIED BY 'NeWHcrAuE8DUX8JmqLyXdYaQuz9IDWZ451N';
GRANT ALL PRIVILEGES ON `ecommerce`.* TO 'migrate'@'%', 'read_only'@'%';
GRANT ALL PRIVILEGES ON `edxapp`.* TO 'migrate'@'%', 'read_only'@'%';
GRANT ALL PRIVILEGES ON `edxapp_csmh`.* TO 'migrate'@'%', 'read_only'@'%';
GRANT ALL PRIVILEGES ON `edx_notes_api`.* TO 'migrate'@'%', 'read_only'@'%';
GRANT ALL PRIVILEGES ON `discovery`.* TO 'migrate'@'%', 'read_only'@'%';

-- Creating edx notes api user and granting access to him
CREATE USER 'notes001'@'%' IDENTIFIED BY 'B3M8FUIOtMvhUSMFjNY80Byw55orBKcHHix';
GRANT ALL PRIVILEGES ON `edx_notes_api`.* TO 'notes001'@'%';
