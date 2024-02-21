-- Demonstrates navigating a MySQL database

-- Starts MySQL server using Docker
docker container run --name mysql -p 3306:3306 -v /workspaces/$RepositoryName:/mnt -e MYSQL_ROOT_PASSWORD=crimson -d mysql

-- Logs in, if using 'crimson' as password
mysql -h 127.0.0.1 -P 3306 -u root -p

-- Lists all databases on server
SHOW DATABASES;
