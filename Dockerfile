# 1. 베이스 이미지 선택
FROM python:3.10-slim

# 2. 작업 디렉토리 설정
WORKDIR /usr/src/app

# 3. 시스템 패키지 업데이트 및 nginx 설치
RUN apt-get update && apt-get install -y nginx

# 4. 파이썬 라이브러리 설치
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 5. 소스코드 및 설정 파일 복사
COPY ./app /usr/src/app/app
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

# 6. entrypoint 스크립트에 실행 권한 부여
RUN chmod +x /usr/src/app/entrypoint.sh

# 7. 외부로 노출할 포트 설정
EXPOSE 80

# 8. 컨테이너 시작 시 실행할 명령어
CMD ["/usr/src/app/entrypoint.sh"]