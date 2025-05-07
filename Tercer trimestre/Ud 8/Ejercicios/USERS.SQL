/*1*/
create user  IF NOT EXISTS 'Gandalf' identified by '112233';
GRANT ALL PRIVILEGES on *.* TO 'gandalf' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'gandalf' IDENTIFIED BY '445566';

/*2*/
CREATE USER IF NOT EXISTS 'frodo'@'localhost' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'sam'@'localhost' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'frodo'@'%' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'gollum'@'%' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'gollum'@'localhost' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'sam'@'%' IDENTIFIED BY '112233';

GRANT SELECT, UPDATE ON *.* TO 'frodo'@'localhost';
GRANT SELECT ON *.* TO 'frodo'@'%';
GRANT SELECT, UPDATE ON *.* TO 'sam'@'localhost';
GRANT SELECT ON *.* TO 'sam'@'%';
GRANT SELECT, UPDATE ON *.* TO 'gollum'@'localhost';
GRANT SELECT ON *.* TO 'gollum'@'%';
REVOKE UPDATE ON *.* FROM 'gollum'@'%';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'frodo'@'localhost';
SHOW GRANTS FOR 'frodo'@'%';
SHOW GRANTS FOR 'sam'@'localhost';
SHOW GRANTS FOR 'sam'@'%';
SHOW GRANTS FOR 'gollum'@'localhost';
SHOW GRANTS FOR 'gollum'@'%';

/*3*/
CREATE USER IF NOT EXISTS 'galadriel'@'localhost' IDENTIFIED BY '112233';
CREATE USER IF NOT EXISTS 'galadriel'@'%' IDENTIFIED BY '112233';
GRANT SELECT, UPDATE, DELETE, INSERT ON musica.* TO 'galadriel'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON biblioteca.llibre TO 'galadriel'@'%';

/*4*/
SELECT user, host FROM mysql.user where user ='frodo' or user ='sam' or user ='gollum' or user
='galadriel';

REVOKE SELECT, UPDATE ON *.* FROM 'frodo'@'localhost';
REVOKE SELECT ON *.* FROM 'frodo'@'%';
REVOKE SELECT, UPDATE ON *.* FROM 'sam'@'localhost';
REVOKE SELECT ON *.* FROM 'sam'@'%';
REVOKE SELECT ON *.* FROM 'gollum'@'localhost';
REVOKE SELECT ON *.* FROM 'gollum'@'%';
FLUSH PRIVILEGES;

DROP USER 'frodo'@'localhost';
DROP USER 'frodo'@'%';
DROP USER 'sam'@'localhost';
DROP USER 'sam'@'%';
DROP USER 'gollum'@'localhost';
DROP USER 'gollum'@'%';
DROP USER 'galadriel'@'localhost';
DROP USER 'galadriel'@'%';