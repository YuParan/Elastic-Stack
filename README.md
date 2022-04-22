
---

# Elastic-Stack

Docker 환경에서 Docker-Compose 로 오케스트레이션 되어 동작하는 ELK-Stack Template 입니다.

몇가지 파라미터를 바꾸어 프로젝트에 사용 가능하도록 구성해두었습니다.

현재 구성된 ElasticSearch 버전 : 7.17.3

---

## 개요

### 기본적인 구성

- 2개의 ElasticSearch Master node 로 구성된 Cluster

- Kibana

- ( Logstash 는 아직 구성되지 않았습니다 )

---

## 초기 실행

### Dependency

```text
Docker & Docker-Compose 가 동작 가능한 환경
```

### Skeleton

```
└── Elastic-Stack
    ├── /bin
    │   ├── build_elastic-stack.sh
    │   ├── build_elastic-volumes.sh
    │   └── loadenv.sh
    │
    ├── /elasticsearch
    │   ├── /config
    │   │   ├── elasticsearch.yml
    │   │   ├── jvm.options
    │   │   └── README.md
    │   │
    │   ├── /plugins        # 필요시 ElasticSearch Plugin 백업 (ex. nori-tokenizer)
    │   ├── /snapshot       # ElasticSearch 내부의 Indicies 스냅샷 Dump 데이터 Volume Bind Mount 경로
    │   │
    │   ├── Dockerfile      # ElasticSearch 빌드용 Dockerfile
    │   └── userdict_ko.txt     # 사용자 정의 사전
    │
    ├── /kibana
    │   └── Dockerfile      # Kibana 빌드용 Dockerfile
    │
    ├── /logstash
    │   └── Dockerfile      # Logstash 빌드용 Dockerfile
    │
* ! ├── .env
    ├── .env-sample.txt
    ├── .gitignore
!   ├── docker-compose.yml
    └── README.md
```

Repository 에는 다음과 같이 `*` 표시된 경로 & 파일들이 빠져있습니다.
( 미 세팅시 MySQL-Container 가 정상 동작하지 않습니다 )
- `.env-sample.txt` 파일을 참고하여 `.env` 세팅 (DB 구성 및 접속을 위한 및 환경변수 값을 설정)

프로젝트 DB 구성을 위해 `!` 표시된 파일들의 내용 수정이 필요합니다.
- 대부분 시스템 환경 세팅은 `.env` 수정으로 변경됩니다.

- Docker Container 실행 환경 설정은 `docker-compose.yml` 의 내용을 수정해서 적용할 수 있습니다.

---

### Run

1. git clone
   
2. `.env-sample.txt` 파일을 참고하여 프로젝트 최상위 경로에 `.env` 파일 세팅

3. `./bin/build_docker_image.sh` 명령어를 활용해 `.env` 의 설정이 적용된 Docker Image 를 빌드

4. 3에서 구성된 Docker Image 를 기반으로 Container 실행
   
   ```bash
   # 프로젝트 최상위 경로에서
   docker-compose up -d
   ```
   
5. docker-compose 중단

   ```bash
   docker-compose stop
   # docker-compose down 으로도 서버를 중단할 수 있지만 docker-compose stop 으로 중지하는 것을 권장합니다.
   # !주의! docker-compose down -v 명령은 절대 실행하지 않습니다.
   #     ( 볼륨까지 초기화 되어 기존 ES 에서 관리중인 데이터가 모두 소실됩니다 )
   ```

---
