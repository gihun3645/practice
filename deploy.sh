#!/bin/bash
DEPLOY_PATH="./build/libs/"
# 기존 파일 확인 및 삭제
if [ -f "$DEPLOY_PATH$WAR_NAME" ]; then
  echo "> 기존 파일 삭제: $DEPLOY_PATH$WAR_NAME" >> ./scripts/deploy.log
  rm -f "$DEPLOY_PATH$WAR_NAME"
fi

# 다시 한번 빌드
echo "클린 빌드 "
./gradlew clean build

BUILD_WAR=$(ls ./build/libs/*.war)
WAR_NAME=$(basename $BUILD_WAR)

# 로그 디렉터리 확인 후 생성
LOG_DIR="./scripts"
if [ ! -d "$LOG_DIR" ]; then
  mkdir -p $LOG_DIR
  echo "Creating log directory..." >> ./scripts/deploy.log
fi

echo "> Build 파일명: $WAR_NAME" >> ./scripts/deploy.log


echo "> 현재 실행중인 애플리케이션 pid 확인" >> ./scripts/deploy.log
CURRENT_PID=$(pgrep -f $WAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> ./scripts/deploy.log
else
  echo "> 현재 실행 중인 애플리케이션을 종료합니다. kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> DEPLOY_WAR 배포 배포주소 $DEPLOY_PATH 배포 파일 $DEPLOY_PATH$WAR_NAME" >> ./scripts/deploy.log
nohup java -jar $DEPLOY_PATH$WAR_NAME
