### docker 部署 MySQL 容器

先下载mysql镜像

```shell
docker pull mysql:8.0.20
```

同级目录下创建，`./conf`,`./data`和`logs`目录，将容器的数据和日志挂载到宿主机，然后启动容器

以`docker`命令运行容器
```shell
docker run --name mysql8 -p 3306:3306 -v ***/conf/my.cnf:/etc/mysql/my.cnf -v ***/data:/var/lib/mysql -v ***/logs/:/var/log/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:8.0.20
```

以`docker compose` 运行容器，创建`docker-compose.yml`文件，写入以下内容

```yaml
version: "3"

services:
  mysql:
    image: mysql:8.0.20
    container_name: mysql8
    restart: always
    ports:
      - "3306:3306"
    entrypoint:
      - MYSQL_ROOT_PASSWORD=123456
      - TZ=Asia/Shanghai
    volumes:
      - ./conf:/etc/mysql/conf.d
      - ./data:/var/lib/mysql
      - ./logs:/var/log/mysql
```

最后执行启动命令

```shell
docker compose up -d
```