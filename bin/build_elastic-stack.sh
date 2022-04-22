#!/bin/bash

# Get AbPath
PROJECT_PATH=$(dirname $(cd $(dirname $0) && pwd -P))
echo $PROJECT_PATH
cd $PROJECT_PATH

# load .env
source $PROJECT_PATH/bin/loadenv.sh

# Cross-platform CPU(M1 Mac) 대응을 위해 `--platform linux/amd64` 가 필요 합니다
# ElasticSearch
docker build --platform linux/amd64 \
    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
    -t $ELK_PROJECT_NAME-elasticsearch:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./elasticsearch

# Kibana
docker build --platform linux/amd64 \
    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
    -t $ELK_PROJECT_NAME-kibana:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./kibana

# Logstash
#docker build --platform linux/amd64 \
#    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
#    -t $ELK_PROJECT_NAME-logstash:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./logstash
