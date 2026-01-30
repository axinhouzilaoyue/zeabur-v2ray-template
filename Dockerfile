FROM teddysun/xray:latest

# 安装 nginx
RUN apk add --no-cache nginx

# 复制配置
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
