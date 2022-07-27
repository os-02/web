# homelab-infrastructure
homelab 基建样例，基建测试环境

## 使用
### 启动 gateway
1. 配置域名的泛解析
2. 编辑 gateway/.env 修改 DOMAIN 变量为刚配置泛解析的域名
3. 在 gateway 文件夹下执行 ```./init.sh``` 或者 ```sudo ./init.sh```

## 示例web服务
示例域名: lab.example.com

### gateway
* nginx: http://nginx.lab.example.com
* ariang: http://ariang.lab.example.com
* traefik: Http://traefik.lab.example.com
