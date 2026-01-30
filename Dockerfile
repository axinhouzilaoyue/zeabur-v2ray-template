FROM alpine:latest

# 安装 nginx 和 sing-box
RUN apk add --no-cache nginx curl \
    && curl -Lo /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.10.7/sing-box-1.10.7-linux-amd64.tar.gz \
    && tar -xzf /tmp/sing-box.tar.gz -C /tmp \
    && mv /tmp/sing-box-*/sing-box /usr/local/bin/ \
    && rm -rf /tmp/sing-box* \
    && chmod +x /usr/local/bin/sing-box

# 复制配置
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /etc/sing-box && chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
