#!/bin/bash

# Get AbPath
PROJECT_PATH=$(dirname $(cd $(dirname $0) && pwd -P))
echo $PROJECT_PATH
cd $PROJECT_PATH

# load .env
source $PROJECT_PATH/bin/loadenv.sh

# 보통 Linux(AMD64) 와 시스템 환경 차이를 줄이기 위해, Cross-platform CPU(M1 Mac) 대응이 가능하도록
# `--platform linux/amd64` 환경에서 Docker 이미지를 빌드 하도록 권장합니다.
# 하지만 ElasticSearch 는 Cross-platform 대응을 하지 않아 M1 Mac 환경에서 `--platform linux/amd64` 으로 빌드된 이미지는 동작 불가.
# ElasticSearch 의 소스를 수정하거나 CPU 아키텍처에 따라 동작에 영향을 주는 API 를 사용하는게 아니라면,
# 각 CPU 아키텍처에 따른 자동 빌드 환경을 그대로 사용해도 ELK-Stack 을 활용하는 것에는 문제 없을것으로 보입니다.

# ElasticSearch
docker build \
    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
    -t $ELK_PROJECT_NAME-elasticsearch:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./elasticsearch

# Kibana
docker build \
    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
    -t $ELK_PROJECT_NAME-kibana:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./kibana

# Logstash
#docker build \
#    --build-arg ELASTIC_VERSION=$ELASTIC_VERSION \
#    -t $ELK_PROJECT_NAME-logstash:$ELK_PROJECT_NAME-$ELK_PROJECT_VERSION ./logstash
