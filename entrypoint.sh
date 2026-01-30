#!/bin/sh

echo "========================================="
echo "Starting sing-box proxy service..."
echo "========================================="

# 检查 UUID
if [ -z "$UUID" ]; then
    echo "ERROR: UUID not set!"
    exit 1
fi
echo "UUID: ${UUID}"

# 替换配置
sed -i "s|\${UUID}|${UUID}|g" /etc/sing-box/config.json

echo "Config:"
cat /etc/sing-box/config.json

# 验证配置
echo "Validating config..."
/usr/local/bin/sing-box check -c /etc/sing-box/config.json
if [ $? -ne 0 ]; then
    echo "Config validation failed!"
    exit 1
fi

echo "Starting sing-box on port 443 (TCP)..."
exec /usr/local/bin/sing-box run -c /etc/sing-box/config.json
