# Web Service

## 部署

1. 在 [Zeabur](https://zeabur.com) 创建项目
2. **Add Service** → **Docker 容器镜像**
3. 镜像：`ghcr.io/axinhouzilaoyue/zeabur-v2ray-template:latest`
4. 环境变量：`UUID` = 生成的 UUID
5. 端口：`80` / `HTTP`
6. 绑定域名

## 生成 UUID

```bash
uuidgen
```

或访问 https://www.uuidgenerator.net/
