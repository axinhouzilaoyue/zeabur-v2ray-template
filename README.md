# Nginx Web Service

一个 Nginx Web 服务模板，支持自定义域名和自动 HTTPS。

## 部署

1. 点击按钮部署：[![Deploy to Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/new?template=https://github.com/axinhouzilaoyue/zeabur-v2ray-template)
2. 填写域名和密钥
3. 等待部署完成

## 生成密钥

```bash
openssl rand -base64 32
```

## 变量说明

| 变量 | 说明 |
|------|------|
| DOMAIN | 绑定的域名 |
| SS_PASSWORD | Base64 密钥 |
