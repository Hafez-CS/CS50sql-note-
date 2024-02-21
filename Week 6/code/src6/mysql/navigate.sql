-- Demonstrates navigating a MySQL database

-- Start docker container
docker start mysql

-- Log in
mysql -u root -h 127.0.0.1 -P 3306 -p

-- List all databases on server
SHOW DATABASES;
