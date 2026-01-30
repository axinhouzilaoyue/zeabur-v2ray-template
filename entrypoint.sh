#!/bin/sh

# 创建配置目录
mkdir -p /etc/sing-box

# 替换配置中的环境变量
sed -i "s|\${SS_PASSWORD}|${SS_PASSWORD}|g" /etc/sing-box/config.json

# 启动 sing-box 后台运行
/usr/local/bin/sing-box run -c /etc/sing-box/config.json &

# 启动 nginx 前台运行
nginx -g 'daemon off;'
