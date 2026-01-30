# Web Service

基于 v2ray + nginx 的 Web 服务。

## 部署

1. 在 Zeabur 创建项目
2. 添加服务 → Docker 容器镜像
3. 镜像：`ghcr.io/axinhouzilaoyue/zeabur-v2ray-template:latest`
4. 环境变量：`UUID` = 你的 UUID
5. 端口：`80` / `HTTP`
6. 绑定域名

## 生成 UUID

```bash
uuidgen
```
