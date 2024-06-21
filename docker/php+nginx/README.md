### docker 部署 php8 + nginx

下面这种我是通过`docker compose`部署的

```yaml
version: "3"

services:
  lnp:
    build: ./devops/
    image: php8-nginx:latest
    container_name: php8-nginx
    ports:
        - "9001:80"
    environment:
      TZ: Asia/Shanghai
    command: ./devops/run.sh
    volumes:
      - ./:/data/www
      - ./devops/nginx.conf:/etc/nginx/sites-enabled/default
      - ./devops/php.ini:/usr/local/etc/php/conf.d/php.ini
```

部署正式环境时，需要`devops`目录删除