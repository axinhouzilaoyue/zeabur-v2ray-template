#!/bin/sh
set -e

echo "========================================="
echo "Starting v2ray + nginx service..."
echo "========================================="

# 检查 UUID
if [ -z "$UUID" ]; then
    echo "ERROR: UUID environment variable not set!"
    exit 1
fi

echo "UUID: $UUID"

# 替换配置中的 UUID
sed -i "s/\${UUID}/$UUID/g" /etc/v2ray/config.json

echo "v2ray config:"
cat /etc/v2ray/config.json

# 启动 v2ray
echo "Starting v2ray on port 1080..."
/usr/local/bin/v2ray run -c /etc/v2ray/config.json &

# 等待 v2ray 启动
sleep 2

# 检查 v2ray 是否在运行
if ! pgrep -x "v2ray" > /dev/null; then
    echo "ERROR: v2ray failed to start!"
    exit 1
fi
echo "v2ray is running."

# 启动 nginx
echo "Starting nginx on port 80..."
echo "========================================="
nginx -g 'daemon off;'
