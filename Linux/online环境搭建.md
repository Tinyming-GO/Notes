====== Online环境搭建 ======

===== 前期准备 =====

<code>虚拟化支持: cat /proc/cpuinfo | grep -E 'vmx|svm'</code>

<code>内核验证: lsmod | grep kvm</code>

==== 宿主机配置 ====

<code>CPU信息: cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c</code>

<code>内存: cat /proc/meminfo 或者 free -m</code>

<code>硬盘分区: df -h 或者 fdisk -l</code>

==== 虚拟机划分 ====
|  ^  VCPU  ^  空间  ^  内存  ^  IP  ^
^  web-002  |  1  |  50G  |  2G  |  20.20.20.20  |
^  web-003  |  1  |  50G  |  2G  |  20.20.20.30  |
^  web-004  |  1  |  50G  |  2G  |  20.20.20.40  |
^  db-001  |  1  |  300G  |  2G  |  20.20.20.100  |
^  db-003  |  1  |  300G  |  2G  |  20.20.20.101  |
^  db-002  |  1  |  300G  |  2G  |  20.20.20.110  |
^  cache-001  |  1  |  30G  |  4G  |  20.20.20.150  |

<code>
账号/密码: bozhong/12345678
</code>
----
===== qemu-kvm & libvirt =====

==== 安装 ====

<code>sudo apt-get install qemu-kvm libvirt-bin libvirt-dev virtinst bridge-utils</code>

==== 存储池 ====

<code>定义: sudo virsh pool-define-as {存储池名称} --type dir --target {目录}</code>

<code>创建: sudo virsh pool-build {名称}</code>

<code>激活: sudo virsh pool-start {名称}</code>

<code>自动激活: sudo virsh pool-autostart {名称}</code>

<code>查看存储池: sudo virsh pool-list --all</code>

==== 镜像 ====

<code>
创建初始镜像: 
cd {存储池}
qemu-img create -f raw ubuntu-12-04.raw 5G
</code>
<code>
安装初始系统:
sudo qemu-system-x86_64 -enable-kvm -m 2048 -smp 4 -boot order=dc -hda xxx.raw -cdrom xxx.iso
</code>
<code>
配置初始系统:
sudo qemu-system-x86_64 -enable-kvm -m 2048 -smp 4 -hda xxx.raw
</code>
<code>
派生镜像: 
sudo qemu-img create -f qcow2 {新镜像} -o backing_file={原始镜像} 30G
或
sudo qemu-img create -b {原始镜像} -f qcow2 {新镜像} 30G
</code>
<code>
镜像扩容:

qemu-img resize xxx.qcow2 +10G

qemu-img info xxx.qcow2

ps:这里只是对镜像进行扩容,需要进入虚拟机进行根分区扩容

查看分区情况:
df -h
fdisk -l

进入磁盘操作:
fdisk /dev/xxx
n (add a new partition)
1~5 (partition number)

t (change a partition's system id)
(1~5) partition number  
8e (hex code) 

w(write table to disk and exit)
创建pv
pvcreate /dev/xxx
查看pv:
pvs/pvdisplay
查看vg:
vgdisplay
加载pv:
vgextend vg /dev/xxx
扩展lv:
lvextend -l +100%FREE /dev/root

resize2fs /dev/root
 
</code>

==== libvirt配置 ====
=== 网络 ===
<code>
查看配置列表:
virsh net-list --all
</code>  
<code>
查看配置:
virsh net-dumpxml default
</code> 
<code>
编辑配置: virsh net-edit default
</code>  
<code>
重启: 
virsh net-destroy default  
virsh net-define default.xml  
virsh net-start default
</code>    
<code>
Demo->net.xml: 
  
 <network>
  <name>default</name>
  <uuid>902ff656-f432-4e00-8447-4958a395b00e</uuid>
  <forward mode='nat'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:f0:10:be'/>
  <ip address='20.20.20.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='20.20.20.2' end='20.20.20.254'/>
      <host mac='52:54:00:df:e8:46' ip='20.20.20.10'/>
    </dhcp>
  </ip>
 </network>
</code>
=== 虚拟机xml配置 ===
<code>
cd /etc/libvirt/qemu/
</code>
<code>
Demo->vm.xml

参考: https://libvirt.org/formatdomain.html

<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
  <name>{名称}</name>
  <memory unit='KiB'>{最大内存}</memory>
  <currentMemory unit='KiB'>{可用内存}</currentMemory>
  <vcpu placement='static'>4</vcpu>
  <os>
    <type arch='x86_64' machine='pc-i440fx-2.1'>hvm</type>
    <boot dev='hd'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <pae/>
  </features>
  <clock offset='localtime'/>
  <devices>
    <emulator>/usr/bin/qemu-system-x86_64</emulator>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2'/>
      <source file='{镜像路径}'/>
      <target dev='hda' bus='ide'/>
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
    </disk>
    <controller type='ide' index='0'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x1'/>
    </controller>
    <interface type='network'>
      <mac address='{mac地址}'/>
      <source network='{NAT网络名称}'/>
      <model type='rtl8139'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
    <graphics type='vnc' port='-1' autoport='yes'/>
    <memballoon model='virtio'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>
    </memballoon>
  </devices>
  <qemu:commandline>
    <qemu:arg value='-enable-kvm'/>
  </qemu:commandline>
</domain>
</code>
<code>
加载vm:
virsh define vm.xml
</code>
<code>
vm列表: 
virsh list --all
</code>  
<code>
启动:virsh start {vm}
停止:virsh destroy {vm}
</code>

===== openrestry-1.5.12.1 =====
==== deb包安装 ====
{{ :php:nginx_1.5.12.1-1_amd64.tar.gz |}}
==== 依赖库 ====
<code>
sudo apt-get install perl make build-essential libreadline-dev libncurses5-dev libpcre3-dev libssl-dev libxml2-dev libxml2-utils libxslt1.1 libxslt1-dev libgd2-xpm libgd2-xpm-dev libgeoip1 libgeoip-dev
</code>
==== 模块 ====
<code>
从github下载下列模块:

ngx_devel_kit-0.2.19
echo-nginx-module-0.53
xss-nginx-module-0.04
ngx_coolkit-0.2rc1
set-misc-nginx-module-0.24
form-input-nginx-module-0.08
encrypted-session-nginx-module-0.03
srcache-nginx-module-0.26
ngx_lua-0.9.7
ngx_lua_upstream-0.02
headers-more-nginx-module-0.25
array-var-nginx-module-0.03
memc-nginx-module-0.14
redis2-nginx-module-0.11
auth-request-nginx-module-0.2
rds-json-nginx-module-0.13
rds-csv-nginx-module-0.05
</code>
==== 编译参数 ====
<code>
./configure --prefix=/usr/local/openresty/nginx/nginx --with-debug --with-ld-opt='-Wl,-rpath,/usr/local/openresty/nginx/luajit/lib -Wl,-rpath,/usr/local/openresty/luajit/lib' --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-log-path=/var/log/nginx/access.log --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --with-pcre-jit --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_gzip_static_module --with-http_image_filter_module --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-http_sub_module --with-http_xslt_module --with-ipv6 --with-mail --with-mail_ssl_module
</code>

===== rabbitMQ&Haproxy =====
==== 安装 ====
<code>RabbitMQ安装: 参考->https://www.rabbitmq.com/install-debian.html->Installation on Ubuntu 12.04</code>
<code>
Haproxy安装:
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:vbernat/haproxy-1.7
sudo apt-get udpate
sudo apt-get install haproxy
</code>
==== 配置 ====
<code>
haproxy配置:

sudo vim /etc/haproxy/haproxy.fcg

defaults
        log     global
        #mode   http
        #option httplog
        mode    tcp
        option  tcplog
        option  dontlognull
        timeout connect 5000
        timeout client  50000
        timeout server  50000
        errorfile 400 /etc/haproxy/errors/400.http
        errorfile 403 /etc/haproxy/errors/403.http
        errorfile 408 /etc/haproxy/errors/408.http
        errorfile 500 /etc/haproxy/errors/500.http
        errorfile 502 /etc/haproxy/errors/502.http
        errorfile 503 /etc/haproxy/errors/503.http
        errorfile 504 /etc/haproxy/errors/504.http

listen stats
        bind 10.10.10.10:15678
        mode http
        stats enable
        stats hide-version
        stats realm Haproxy\ Statistics
        stats uri /
        stats auth bzdev:bzdev

listen rabbitmq
        bind :5670
        mode tcp
        balance roundrobin
        server cache-001 10.10.10.193:5672 check inter 5s rise 2 fall 3
        server db-004 10.10.10.195:5672 check inter 5s rise 2 fall 3
</code>
<code>
rabbitmq配置:

sudo vim /etc/rabbitmq/rabbitmq.conf

[
    {rabbitmq_management,
        [{listener,
         [{port,15672},
          {ip,"127.0.0.1"}
         ]}]
    }
].
</code>
<code>
nginx配置:

server {
    listen   80;
    server_name rabbitmq.online.seedit.cc;


    location / {
        client_body_buffer_size 128k;
        proxy_send_timeout   90;
        proxy_read_timeout   90;
        proxy_buffer_size    4k;
        proxy_buffers     16 32k;
        proxy_busy_buffers_size 64k;
        proxy_temp_file_write_size 64k;
        proxy_connect_timeout 30s;
        proxy_pass   http://xxx.xxx.xxx.xx:15672;
        proxy_set_header   Host   $host;
        proxy_set_header   X-Real-IP  $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
</code>
<code>
多台服务器配置:

1.先增加相同的用户

sudo rabbitmqctl add_user bzdev  bzdev

sudo rabbitmqctl set_permissions -p / bzdev ".*" ".*" ".*"

sudo rabbitmqctl set_user_tags bzdev administrator

sudo rabbitmqctl list_users

2 设置相同的cookie(/var/lib/rabbitmq/.erlang.cookie)

3.服务器相互设置host

4.服务器添加

(先设置rabbitslave)

rabbitmqctl stop_app

rabbitmqctl reset

rabbitmqctl start_app

(后设置rabbitmaster):

rabbitmqctl stop_app

rabbitmqctl reset

rabbitmqctl join_cluster rabbit@rabbitslave

rabbitmqctl cluster_status

rabbitmqctl start_app

rabbitmqctl set_policy ha-all "" '{"ha-mode":"all","ha-sync-mode":"automatic"}'

</code>

===== php-fpm 5.3.10 =====
==== 安装 ====
<code>
echo 'deb http://ppa.launchpad.net/brianmercer/php/ubuntu lucid main
deb-src http://ppa.launchpad.net/brianmercer/php/ubuntu lucid main' | sudo tee /etc/apt/sources.list.d/php5.3.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8D0DC64F

sudo apt-get update
sudo apt-get install php5-fpm php5-cli

配置参考:http://wiki.bozhong.com/bozhong/ops/service/fpm

</code>
==== amqp扩展&lua扩展 ====
<code>
amqp:

wget -e "http_proxy=http://127.0.0.1:1080" https://github.com/alanxz/rabbitmq-c/releases/download/v0.5.2/rabbitmq-c-0.5.2.tar.gz
sudo ./configure --prefix=/usr/local/rabbitmq-c

wget http://pecl.php.net/get/amqp-1.2.0.tgz
sudo ./configure --with-php-config=/usr/bin/php-config --with-amqp --with-librabbitmq-dir=/usr/local/rabbitmq-c
</code>
<code>
lua:

sudo apt-get install lua5.2 liblua5.2-dev

sudo ln -s /usr/include/lua*.*/ /usr/include/lua
sudo cp /usr/include/lua5.2/lua.h /usr/include
sudo cp /usr/include/lua5.2/luaconf.h /usr/include/luaconf.h
sudo cp /usr/include/lua5.2/lauxlib.h /usr/include/lauxlib.h
sudo cp /usr/include/lua5.2/lualib.h /usr/include/lualib.h

sudo cp /usr/lib/x86_64-linux-gnu/liblua5.2.a /usr/lib/liblua.a
sudo cp /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so

wget http://pecl.php.net/get/lua-1.0.0.tgz

</code>

===== MongoDB-2.6.9 =====
<code>
安装:

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

the latest stable:
sudo apt-get install -y mongodb-org

specific release:
sudo apt-get install -y mongodb-org=2.6.9 mongodb-org-server=2.6.9 mongodb-org-shell=2.6.9 mongodb-org-mongos=2.6.9 mongodb-org-tools=2.6.9
</code>
<code>
启动:

sudo mkdir /home/databases /home/databases/mongodb

sudo chown -R mongodb:mongodb /home/databases/mongodb

sudo vim /etc/mongod.conf

添加配置:
bind_ip={ip}
dbpath=/home/databases/mongodb
logpath=/home/logs/mongodb/mongod.log
fork=true

sudo service mongod start

shell脚本利用db.copyDatabase远程复制数据库:
db.copyDatabase(fromdb, todb, fromhost, username, password)
</code>
<code>
安装rockmongo-1.1.6
</code>
<code>
账号密码:
admin/admin
</code>

===== Mysql-5.5.54 =====
<code>直接安装: sudo apt-get install mysql-server mysql-client</code>

<code>
安装phpMyAdmin-4.2.0:
https://files.phpmyadmin.net/phpMyAdmin/4.2.0/phpMyAdmin-4.2.0-all-languages.tar.gz

shell脚本利用mysqldump和mysql命令导出导入数据库
</code>
<code>
账号密码:
root/kBWpNc2L66pt
onlinemysql/onlinemysql
</code>

===== 正式配置流程 =====
<code>1.镜像上传(注意:低版本qemu-kvm不能操作高版本创建的qcow2镜像)</code>
<code>2.部署kvm服务(network&domain的xml)</code>
<code>3.主机nginx配置(新建kvmonline.conf)</code>
<code>
4.虚拟机fpm&nginx&service配置
参考:http://wiki.bozhong.com/bozhong/ops/service/fpm
</code>
<code>5.项目部署&测试</code>
<code>6.性能测试</code>
