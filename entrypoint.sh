#!/bin/sh

# 替换配置中的环境变量
sed -i "s|\${UUID}|${UUID}|g" /etc/sing-box/config.json

# 启动 sing-box 后台运行
/usr/local/bin/sing-box run -c /etc/sing-box/config.json &

# 启动 nginx 前台运行
nginx -g 'daemon off;'
