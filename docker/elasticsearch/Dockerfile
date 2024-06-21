FROM elasticsearch:8.12.2

ADD ./plugins/elasticsearch-analysis-ik-8.12.2.zip /tmp/elasticsearch-analysis-ik-8.12.2.zip

RUN mkdir /usr/share/elasticsearch/plugins/ik && unzip /tmp/elasticsearch-analysis-ik-8.12.2.zip -d /usr/share/elasticsearch/plugins/ik