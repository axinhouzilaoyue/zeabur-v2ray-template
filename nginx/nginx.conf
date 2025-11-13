server {
    listen 80;
    server_name ${DOMAIN};

    location / {
        proxy_pass http://v2ray.zeabur.internal:1080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}
