### docker 部署 Elasticsearch 容器

下载地址：

```shell
# ik分词器下载链接
https://github.com/infinilabs/analysis-ik/releases
```

创建`docker-compose.yaml`，并写入以下内容

```yaml
version: "3"
# docker pull kibana:8.12.2
services:
  elastic:
    build: .
    image: elasticsearch-ik:8.12.2
    container_name: elasticsearch
    restart: always
    environment:
      - xpack.security.enabled=false
      - discovery.type=single-node
      - ES_JAVA_OPTS=-Xms512m -Xmx512m
      - ELASTIC_USERNAME=elastic
      - ELASTIC_PASSWORD=123456
    volumes:
      - ./data:/usr/share/elasticsearch/data
      - ./logs:/usr/share/elasticsearch/logs
      - ./conf/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
    ports:
      - "9200:9200"
    networks:
      - es-network
  kibana:
    container_name: kibana # 这个是elastic的可视化管理工具，如果不需要，则去掉
    image: kibana:8.12.2
    restart: always
    depends_on:
      - elastic
    ports:
      - "5601:5601"
    volumes:
      - ./conf/kibana.yml:/usr/share/kibana/config/kibana.yml
    networks:
      - es-network
    environment:
      - ELASTICSEARCH_HOSTS=http://elastic:9200

networks:
  es-network:
    driver: bridge
```