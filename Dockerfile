FROM python:3.9

# 해당 디렉토리에 있는 모든 하위항목들을 '/app/server`로 복사한다
COPY . /app/server

# image의 directory로 이동하고
WORKDIR /app/server

# 필요한 의존성 file들 설치
RUN pip3 install -r requirements.txt

# 환경 설정 세팅
# RUN python setup.py install

# container가 구동되면 실행
CMD ["python", "app.py"]
# CMD ["bash"]