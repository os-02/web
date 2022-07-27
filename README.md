# homelab-infrastructure
homelab 基建样例，基建测试环境

## 使用

### gateway
整个基建中最基础的部分，提供反向代理和静态文件服务
#### 启用
1. 配置域名的泛解析
2. 编辑 gateway/.env 修改 LAB_DOMAIN 变量为刚配置泛解析的域名
3. 在 gateway 文件夹下执行 ```./init.sh``` 或者 ```sudo ./init.sh```

#### 服务
这一步会启动以下web服务
* 公共静态资源: http://public.lab.example.com
* ariang: http://ariang.lab.example.com
* traefik: Http://traefik.lab.example.com

其中静态资源、ariang是由nginx提供服务

