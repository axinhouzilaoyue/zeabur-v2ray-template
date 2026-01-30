# Nginx Web Service

## 一键部署

1. 在 [Zeabur](https://zeabur.com) 创建项目
2. 点击 **Add Service** → **Git** → 选择此仓库
3. 添加环境变量 `SS_PASSWORD`（运行 `openssl rand -base64 32` 生成）
4. 绑定域名
5. 完成

## 生成密钥

```bash
openssl rand -base64 32
```
