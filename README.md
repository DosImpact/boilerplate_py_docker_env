# python docker 가상환경 보일러 플레이트

## 목적
- 도커환경을 이용해서 python 실행환경을 만들어 보자. 
- conda, virtualenv 없이 docker만으로 해결 해보자. 
- 도커 빌드를 통해 이미지로 만들자

## 선행사항
- docker installed ( 도커 설치 )

## package 관리
- 설치파일은 requirements.txt 에 공통으로 모아두자  
- dev 환경에서도 이를 참조해서 설치하고, prod,test 환경도 마찬가지  

## 기능

```js
create:dev      개발 서버 컨테이너 생성
install:dev     requirements.txt 설치 명령어
start:dev       app.py 파이썬 실행 명령
bash:dev        컨테이너 접속
freeze:dev      requirements.txt 추출
rm:dev          컨테이너 삭제

create:test     --테스트 서버에 대한 명령어(동일)
install:test
start:test
bash:test
freeze:test
rm:test

build           도커 이미지로 빌드
run:prod        빌드한이미지를 컨테이너 실행
log:prod        로그 보기
```

## 명령어

```js
    "create:dev":"docker run -itd --name flask_dev -p 5000:5000 -e PORT=5000 -v \"$PWD\":/usr/src/myapp -w /usr/src/myapp python:3 bash",
    "install:dev":"docker exec -it flask_dev pip install -r requirements.txt",
    "start:dev":"docker exec -it flask_dev python app.py",
    "bash:dev":"docker exec -it flask_dev bash",
    "freeze:dev":"docker exec -it flask_dev pip freeze > requirements.txt",
    "rm:dev":"docker stop flask_dev && docker rm flask_dev",

    "build":"docker build -t flask_server .",
    "run:prod":"docker run -itd --name myflask_server -p 5002:5002 -e PORT=5002 flask_server",
    "log:prod":"docker logs -f myflask_server",
    
    "create:test":"docker run -itd --name flask_test -p 5001:5001 -e PORT=5001 -v \"$PWD\":/usr/src/myapp -w /usr/src/myapp python:3 bash",
    "install:test":"docker exec -it flask_test pip install -r requirements.txt",
    "start:test":"docker exec -it flask_test python app.py",
    "bash:test":"docker exec -it flask_test bash",
    "freeze:test":"docker exec -it flask_test pip freeze > requirements.txt",
    "rm:test":"docker stop flask_test && docker rm flask_test"
```