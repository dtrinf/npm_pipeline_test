# Readme

https://www.bezkoder.com/node-js-typescript-mysql/


## Docker

MySQL 8.0.20 server
```bash
docker run --platform linux/amd64 --rm -p 3306:3306 --health-cmd="mysqladmin ping" --health-interval=10s --health-timeout=5s --health-retries=3 -e "MYSQL_ROOT_PASSWORD=test-db-password" -e "MYSQL_DATABASE=test-db-name" -e "MYSQL_USER=test-db-user" -e "MYSQL_PASSWORD=test-db-password" mirror.gcr.io/mysql:8.0.20
````

MySQL 8.0.20 client
```bash
docker run --network host --platform linux/amd64 --rm -it --health-cmd="mysqladmin ping" --health-interval=10s --health-timeout=5s --health-retries=3 -e "MYSQL_ROOT_PASSWORD=test-db-password" -e "MYSQL_DATABASE=test-db-name" -e "MYSQL_USER=test-db-user" -e "MYSQL_PASSWORD=test-db-password" --entrypoint bash mirror.gcr.io/mysql:8.0.20
mysql -h 127.0.0.1 -u root -p
```



## Project setup
```bash
npm ci
npm test
```
