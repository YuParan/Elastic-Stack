# ARG Env-Parameter:
ARG ELASTIC_VERSION=7.17.3

# Base Image
FROM docker.elastic.co/elasticsearch/elasticsearch:$ELASTIC_VERSION

# Move to working directory
WORKDIR /usr/share/elasticsearch

# make snapshot directory & permissions
RUN cd /usr/share/elasticsearch \
    && mkdir -p /usr/share/elasticsearch/snapshot \
    && chmod -R 777 /usr/share/elasticsearch/snapshot

# COPY ./elasticsearch/userdict_ko.txt > /usr/share/elasticsearch/config/userdict_ko.txt
RUN echo "" > /usr/share/elasticsearch/config/userdict_ko.txt \
    && chmod 777 /usr/share/elasticsearch/config/userdict_ko.txt

# Set Nori-Tokenizer
ARG ELASTIC_VERSION=7.17.3
RUN echo $ELASTIC_VERSION \
    && bin/elasticsearch-plugin install \
    https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-nori/analysis-nori-$ELASTIC_VERSION.zip
