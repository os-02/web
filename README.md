# homelab-infrastructure
homelab 基建样例，基建测试环境。快速提供基本的网络反向代理，静态服务，身份认证，鉴权，数据库等基础设施加速应用部署和简化开发。

## 使用
默认域名为：lab.example.com。若想配置为自己的域名，需要在.env 文件中修改 LAB_DOMAIN 变量。另外需要修改auth文件夹下的配置文件，否则无法使用认证功能。
### gateway
整个基建中最基础的部分，提供反向代理和静态文件服务
#### 启用
在 gateway 文件夹下执行 ```./init.sh``` 或者 ```sudo ./init.sh```
#### 服务
这一步会启动以下web服务
* 公共静态资源: http://public.lab.example.com
* ariang: http://ariang.lab.example.com
* traefik: Http://traefik.lab.example.com

其中静态资源、ariang是由nginx提供服务

### app
此文件夹下放置各种提供服务的 docker-compose 配置文件以及相关 docker 的本地映射文件
可以尝试启动 whoami 并访问 http://whoami.lab.example.com 查看效果

### auth
依赖于 gateway。用于对本身没有用户管理、身份认证、权限认证的应用提供相关功能。
此部分由[lldap](https://github.com/nitnelave/lldap)（轻量简单的ldap服务器）和[authelia](https://www.authelia.com/)(认证和鉴权服务器)组成。

web服务地址如下：
lldap: http://lldap.lab.example.com
authelia: http://auth.lab.example.com

启动 auth 后，可以在app文件夹下启动 whoami-auth ，并访问 https://whoami-auth.example.com 查看效果
