# Yapi服务

`yapi-1.12.0`目录来自于`git clone --depth=1 git@github.com:YMFE/yapi.git yapi-1.12.0`

## 服务管理

在`docker-compose.yml`所在的目录执行以下操作：

```shell
# 启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
sudo docker-compose stop

# 删除服务
sudo docker-compose down

# 删除服务包括数据库文件
sudo docker-compose down -v
```

## 调整

- 修改数据库管理账户`docker-compose.yml` -> `mongo` -> `environment`
- 修改Yapi对外端口号：`docker-compose.yml` -> `yapi` -> `ports`
- 关闭Yapi注册功能：`yapi/config.json` -> `"closeRegister": true`
- 配置Yapi通知邮箱：`yapi/config.json` -> `mail`

## 数据库管理

可以通过宝塔面板（或其他客户端工具）添加远程数据库，账号密码详见`docker-compose.yml`中`mongo`下的`environment`

## License

本项目基于 [YApi](https://github.com/YMFE/yapi) 的 `yapi-1.12.0` 模块构建，该模块采用 [Apache-2.0 License](./LICENSE) 开源协议。

本仓库整体也采用 [Apache-2.0 License](./LICENSE)，请遵守相关条款。
