FROM alpine:latest

# 安装 xray 和 nginx
RUN apk add --no-cache nginx curl unzip \
    && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/local/bin \
    && rm /tmp/xray.zip \
    && chmod +x /usr/local/bin/xray

# 复制配置
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
