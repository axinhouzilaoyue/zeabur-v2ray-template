#!/bin/sh

# 创建配置目录
mkdir -p /etc/xray

# 替换配置中的环境变量
sed -i "s|\${SS_PASSWORD}|${SS_PASSWORD}|g" /etc/xray/config.json

# 启动 xray 后台运行
/usr/local/bin/xray -config /etc/xray/config.json &

# 启动 nginx 前台运行
nginx -g 'daemon off;'
