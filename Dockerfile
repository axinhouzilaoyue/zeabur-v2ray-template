FROM alpine:latest

# 安装 nginx 和 v2ray
RUN apk add --no-cache nginx curl unzip \
    && curl -Lo /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip /tmp/v2ray.zip -d /usr/local/bin \
    && rm /tmp/v2ray.zip \
    && mkdir -p /etc/v2ray /run/nginx /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /etc/v2ray/config.json
COPY index.html /usr/share/nginx/html/index.html
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
