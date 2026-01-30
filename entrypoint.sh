#!/bin/sh

set -e

echo "Starting services..."

# 检查 UUID 是否设置
if [ -z "$UUID" ]; then
    echo "ERROR: UUID environment variable is not set!"
    exit 1
fi

# 替换配置中的环境变量
sed -i "s|\${UUID}|${UUID}|g" /etc/sing-box/config.json

echo "Config after substitution:"
cat /etc/sing-box/config.json

# 启动 sing-box 后台运行
echo "Starting sing-box..."
/usr/local/bin/sing-box run -c /etc/sing-box/config.json &

# 等待 sing-box 启动
sleep 2

# 启动 nginx 前台运行
echo "Starting nginx..."
nginx -g 'daemon off;'
