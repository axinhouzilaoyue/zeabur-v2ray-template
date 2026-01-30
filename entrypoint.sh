#!/bin/sh

echo "========================================="
echo "Starting deployment..."
echo "========================================="

# 检查 UUID 是否设置
echo "[1/6] Checking UUID..."
if [ -z "$UUID" ]; then
    echo "ERROR: UUID environment variable is not set!"
    exit 1
fi
echo "UUID is set: ${UUID}"

# 替换配置中的环境变量
echo "[2/6] Replacing config variables..."
sed -i "s|\${UUID}|${UUID}|g" /etc/sing-box/config.json

echo "[3/6] Sing-box config:"
echo "----------------------------------------"
cat /etc/sing-box/config.json
echo "----------------------------------------"

# 验证 sing-box 配置
echo "[4/6] Validating sing-box config..."
/usr/local/bin/sing-box check -c /etc/sing-box/config.json
if [ $? -ne 0 ]; then
    echo "ERROR: sing-box config validation failed!"
    exit 1
fi
echo "Sing-box config is valid."

# 验证 nginx 配置
echo "[5/6] Validating nginx config..."
nginx -t
if [ $? -ne 0 ]; then
    echo "ERROR: nginx config validation failed!"
    exit 1
fi
echo "Nginx config is valid."

echo "[6/6] Nginx config:"
echo "----------------------------------------"
cat /etc/nginx/nginx.conf
echo "----------------------------------------"

# 启动 sing-box
echo "Starting sing-box..."
/usr/local/bin/sing-box run -c /etc/sing-box/config.json &
SINGBOX_PID=$!
echo "Sing-box started with PID: $SINGBOX_PID"

# 等待 sing-box 启动
sleep 2

# 检查 sing-box 是否在运行
if ! kill -0 $SINGBOX_PID 2>/dev/null; then
    echo "ERROR: sing-box failed to start!"
    exit 1
fi
echo "Sing-box is running."

# 检查端口是否监听
echo "Checking if port 1080 is listening..."
netstat -tlnp 2>/dev/null || ss -tlnp 2>/dev/null || echo "netstat/ss not available"

# 启动 nginx
echo "Starting nginx..."
echo "========================================="
echo "All services started successfully!"
echo "========================================="

nginx -g 'daemon off;'
