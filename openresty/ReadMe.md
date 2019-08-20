# OpenResty（简称OR） 是什么？

## 定义

OpenResty® 是一个强大的 `Web 应用服务器`，Web 开发人员可以使用 Lua 脚本语言调动 Nginx 支持的各种 C 以及 Lua 模块,更主要的是在性能方面，OpenResty可以快速构造出足以胜任 `10K 乃至 1000K以上 并发连接响应`的超高性能 Web 应用系统。

OpenResty® 的目标是让你的 `Web服务直接跑在 Nginx 服务内部`，充分利用 Nginx 的非阻塞 I/O 模型，不仅仅对 HTTP 客户端请求,甚至于对远程后端诸如 MySQL、PostgreSQL、Memcached 以及 Redis 等都进行一致的高性能响应。

## 同类技术有哪些

Nginx/Tengine/Apache Httpd/Tomcat/Jetty

## 对比同类的优缺点是什么？以及应用场景等

- 优点：

1、只需安装 openresty 即可拥有常规LNMP架构等效的能力。 (Nginx + Lua + MySQL + Redis + Memcached + ZeroMQ + WebSocket …)

2、并发能力超强，充分利用 Nginx 的事件模型来进行非阻塞 I/O 通信，(相当于一个Lua版本的NodeJs服务器)

3、业务逻辑代码热更新，在生产环境中完成热加载(代码有变动时，自动加载最新 Lua 代码，本的 Nodejs 服务器)但是 Nginx 本身，不做任何 reload)

4、在请求真正到达上游服务之前，Lua 可以随心所欲的做复杂的访问控制和安全检测 (http请求流转的各个环节都可以用lua介入到nginx，并可以随心所欲的操控响应头里面的信息)

- 缺点：

1、不易调试

2、周边第三方库不太成熟，缺乏成熟Web 框架

3、i/o操作受限于nginx模型

4、OpenResty 选择的是 Test::Nginx 这个测试框架。因为它的语言是 Perl，很多人不熟悉，所以写测试用例难度高。

- 适用场景：

理论上可以使用ngx_lua开发各种复杂的web应用，不过Lua是一种脚本/动态语言，不适合业务逻辑比较重的场景，适合小巧的应用场景，代码行数保持在几十行到几千行。

1、web应用：会进行一些业务逻辑处理，甚至进行耗CPU的模板渲染，一般流程：mysql/redis/http获取数据、业务处理、产生JSON/XML/模板渲染内容，比如京东的列表页/商品详情页；

2、接入网关：实现如数据校验前置、缓存前置、数据过滤、API请求聚合、AB测试、灰度发布、降级、监控等功能，比如京东的交易大Nginx节点、无线部门正在开发的无线网关、单品页统一服务、实时价格、动态服务；

3、Web防火墙：可以进行IP/URL/UserAgent/Referer黑名单、限流等功能；

4、缓存服务器：可以对响应内容进行缓存，减少到后端的请求，从而提升性能；

5、其他：如静态资源服务器、消息推送服务、缩略图裁剪等。

## 架构组成等

# OpenResty 为什么会出现？

## 解决了什么问题？

OpenResty 解决的是高并发的痛点。

Nginx 可以轻松解决几万请求，而且占用极少内存。但之前，Nginx 一直被用作负载均衡，和静态资源服务器，并没有当做一个web服务器来使用。

OpenResty 将Nginx和Lua进行结合。使得开发人员可以使用 Lua 脚本语言调动 Nginx 支持的各种 C 以及 Lua 模块。方便地搭建能够处理超高并发、扩展性极高的动态 Web 应用、Web 服务和动态网关。

## 没有这个技术前怎么做？

# OpenResty 怎么学习？

## 快速上手视频

## 官方示例

- [PHP百科OpenResty](http://wiki.php.net.cn/openresty)
- [OpenResty中文官网](https://openresty.org/cn/)

- [HelloWorld](https://openresty.org/cn/getting-started.html)
- [基于Redis的动态路由](https://openresty.org/cn/dynamic-routing-based-on-redis.html)
- [LuaRocks 是一个部署和管理 Lua 模块的系统](https://openresty.org/cn/using-luarocks.html)

## 写DEMO

## 看开源代码

- [ABTestingGateway(灰度发布系统)](https://github.com/CNSRE/ABTestingGateway)
- [ngx_lua_waf(web应用防火墙)](https://github.com/loveshell/ngx_lua_waf)

## 项目实践

基于Openresty的框架

- Vanilla
- LOR
- SingleLUA
- Lapis
- Gin

# OpenResty 参考资料

- [又拍云叶靖：OpenResty 在又拍云容器平台中的应用(2019/04/10)](https://www.upyun.com/tech/article/388/%E5%8F%88%E6%8B%8D%E4%BA%91%E5%8F%B6%E9%9D%96%EF%BC%9AOpenResty%20%E5%9C%A8%E5%8F%88%E6%8B%8D%E4%BA%91%E5%AE%B9%E5%99%A8%E5%B9%B3%E5%8F%B0%E4%B8%AD%E7%9A%84%E5%BA%94%E7%94%A8.html)
- [《OpenResty 最佳实践》]（https://moonbingbing.gitbooks.io/openresty-best-practices/content/）
- [OpenResty XMind脑图 ](https://naotu.baidu.com/file/e24b5f1e8e5abea8a04312d87b334434?%20token=3bcfeb5ba50491f7)
- [Nginx API for Lua](https://github.com/openresty/lua-nginx-module#nginx-api-for-lua)
- [极客学院OpenResty教程](http://wiki.jikexueyuan.com/project/openresty/openresty/get_req_body.html)
- [跟我学OpenResty(Nginx+Lua)开发目录贴](https://jinnianshilongnian.iteye.com/blog/2190344)
- [Lua Ngx API](https://openresty-reference.readthedocs.io/en/latest/Lua_Nginx_API/#ngxarg)
- [通过Lua解释器来扩展丰富nginx功能，实现复杂业务的处理](https://blog.51cto.com/rfyiamcool/1248825)
- [nginx+lua 实现请求流量上报kafka](https://www.centos.bz/2017/09/nginxlua-%E5%AE%9E%E7%8E%B0%E8%AF%B7%E6%B1%82%E6%B5%81%E9%87%8F%E4%B8%8A%E6%8A%A5kafka/)
- [浅谈 ngx_lua 在 UPYUN 的应用](http://io.upyun.com/2015/04/14/using-ngxlua-in-upyun/)
