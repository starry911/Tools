### docker 部署 mongoDB 容器

先下载mongo镜像

```shell
docker pull mongo:8.0
```

同级目录下创建，`data`和`logs`目录，将容器的数据和日志挂载到宿主机，然后启动容器


以`docker compose` 运行容器，创建`docker-compose.yml`文件，写入以下内容

```yaml
version: "3"

services:
  mongodb:
    image: mongo:8.0
    container_name: mongodb
    restart: always
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: 123456
    volumes:
      - ./data:/data/db
      - ./logs:/var/log/mongodb
    command:
      - "--auth"
      - "--logpath=/var/log/mongodb/mongod.log"
      - "--logappend"
```

最后执行启动命令

```shell
docker compose up -d
```