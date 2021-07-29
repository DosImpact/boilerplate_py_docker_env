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

create:test     --테스트 서버에 대한 명령어
install:test
start:test
bash:test
freeze:test
rm:test
```