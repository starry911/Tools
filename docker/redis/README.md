### docker 部署 Redis 容器

先下载Redis镜像

```shell
docker pull redis:7.2.5
```

同级目录下创建，`./conf`,`./data`目录，将容器的数据和日志挂载到宿主机，然后启动容器


以`docker`命令运行容器
```shell
docker run --name redis7 -p 6379:6379 -v ***/conf/redis.conf:/etc/redis/redis.conf -v ***/data:/data -d redis:7.2.5 redis-server /etc/redis/redis.conf
```

以`docker compose` 运行容器，创建`docker-compose.yml`文件，写入以下内容

```yaml
version: "3"

services:
  redis:
    image: redis:7.2.5
    container_name: redis
    restart: always
    ports:
      - "6379:6379"
    command: redis-server /etc/redis/redis.conf
    volumes:
      - ./data:/data
      - ./conf/redis.conf:/etc/redis/redis.conf
```

这是以配置文件去启动redis