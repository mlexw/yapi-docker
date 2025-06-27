#!/bin/sh

# 替换 Alpine 软件源为阿里云
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装 nc
apk add --no-cache netcat-openbsd

# 等待 MongoDB 启动
until nc -z mongo 27017; do
  echo "等待 MongoDB 启动..."
  sleep 2
done

cd /opt/yapi/yapi-1.12.0

# 安装依赖（只执行一次）
if [ ! -d node_modules ]; then
  npm install --production --registry https://registry.npmmirror.com/
  echo "依赖安装完毕..."
fi

# 只执行一次安装
if [ ! -f .yapi_installed ]; then
  npm run install-server && touch .yapi_installed
  echo "yapi 安装完毕..."
fi

# 每次都启动 YAPI
node server/app.js
