FROM alpine:latest

# 安装 nginx 和 sing-box
RUN apk add --no-cache nginx curl \
    && curl -Lo /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.12.18/sing-box-1.12.18-linux-amd64.tar.gz \
    && tar -xzf /tmp/sing-box.tar.gz -C /tmp \
    && mv /tmp/sing-box-*/sing-box /usr/local/bin/ \
    && rm -rf /tmp/sing-box* \
    && chmod +x /usr/local/bin/sing-box \
    && mkdir -p /etc/sing-box

# 复制配置
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Zeabur 需要这个端口
EXPOSE 80

CMD ["/entrypoint.sh"]
