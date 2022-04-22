이곳의 파일들은 ElasticSearch 의 내부 설정을 위한 파일들입니다.

기본적으로 ElasticSearch 의 환경 변수는 Docker-Compose 의 환경 변수 세팅 통해 커스텀 하도록 되어있으나,

파일로서의 명시 or 적용이 필요한 경우 이곳 파일의 내용을 변경하고, Bind-Mount 하여 ES 의 Cluster & Node 를 세팅할 수 있습니다.

기본적으로 원본 저장의 목적이 강하며, 해당 수정에 따른 변경을 이해할 수 없는 상황에서는 수정하지 않는것을 권장합니다.
(전체 시스템이 꼬일 수 있습니다)

```
elasticsearch.yml - ElasticSearch Cluster & Node 세팅을 위한 yml
jvm.options - Java Virtual Machine 세팅을 위한 파일. Heap size 변경이 필요할 때 사용
    ( ElasticSearch 는 환경변수 "ES_JAVA_OPTS=-Xms1g -Xmx1g" 를 통해 힙 사이즈 변경이 가능합니다. 
      필수적인 경우가 아니라면 굳이 상기 파일을 수정해 bind 하지 않아도 수정이 가능합니다 )
```