# 安装composer

- 下载composer

```bash
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

执行完成后会生成一个composer.phar文件

- 局部安装

可以将 composer.phar 文件复制到任意目录（比如项目根目录下），然后通过 `php composer.phar` 指令即可使用 Composer 了！

- 全局安装

  `sudo mv composer.phar /usr/local/bin/composer`

全局安装是将 Composer 安装到系统环境变量 PATH 所包含的路径下面，然后就能够在命令行窗口中直接执行 composer 命令了。

# 设置国内镜像

- 添加国内镜像

  `composer config -g repo.packagist composer https://packagist.phpcomposer.com`

- 解除镜象

  `composer config -g --unset repos.packagist`

- 列出当前配置

  `composer config -g -l`

# 安装包网址

  `https://packagist.org/`

# composer.json 架构

更多：https://docs.phpcomposer.com/04-schema.html

```json
{
// ================================ 配置文件 ================================
    "name":             "kelu/app",
    "description":      "血衫非弧的app",
    "keywords":         ["kelvinblood", "kelu", "app"],
    "homepage":         "http://app.kelu.org ",
    "time":             "2016-12-30",
    "license":          "MIT",	// 包的许可协议(http://www.spdx.org/licenses/)
    "authors": [{
        "name":         "Kelvin Blood",
        "email":        "xxx@xxx.org",
        "homepage":     "http://www.kelu.org",
        "role":         "CEO"
    }],
    "type": "project", // 4中类型 library(默认)、project、metapackage、composer-plugin
    "repositories": [ // 使用自定义的包资源库。只能在“Root包”的 composer.json 中定义。
        {
            "type": "vcs", // 4种类型 composer(（HTTP、FTP、SSH）)、vcs(从 git、svn 和 hg 取得资源)、pear、package。
            "url": "https://git.oschina.net/apkj/phpwebframework.git"
        }
    ],
    "support": {
        "email": "support@example.org",
        "issues": "http://",
        "forum": "http://",
        "wiki": "http://",
        "irc": "irc://irc.freenode.org/composer",
        "source": "http://",
    }
// ================================ 依赖管理 ================================
// === 默认情况下，composer只会获取稳定版本,修改后运行命令 composer install ===
    "require": {
        "php": ">=5.5.9",
        "laravel/framework": "5.1.*",
        "ignited/laravel-omnipay": "2.*",
        "lokielse/omnipay-alipay": "dev-master"
    },
// === 有些包依赖只会在开发过程中使用，正式发布的程序不需要这些包，这个时候，就需要用到另外一个键，即require-dev。例如，我们用phpunit单元测试，那么就可以通过require-dev引入这个开发环境下的依赖包
    "require-dev": {
        "fzaninotto/faker": "~1.4",
        "mockery/mockery": "0.9.*",
        "phpunit/phpunit": "~4.0",
        "phpspec/phpspec": "~2.1"
    },
    
// ================================ 自动加载 ================================
// === 加载文件最简单的方式就是require或者include, autoload,顾名思义，就是自动加载. 
// === 修改后，运行命令： composer dump-autoload, 让composer重建自动加载的信息
// === composer 提供了4种自动加载类型 classmap psr-0 psr-4 files 
// === files,对应的值是一个数组，数组元素是文件的路径，路径是相对于应用的根目录。
// === classmap，会在背后就会读取这个文件夹中所有的文件 然后再 vendor/composer/autoload_classmap.php 中怒将所有的 class 的 namespace + classname 生成成一个 key => value 的 php 数组.缺点是一旦增加了新文件，需要执行dump-autoload命令重新生成映射文件。
// === psr-0 现在这个标准已经过时
// === psr-4 支持将命名空间映射到路径。命名空间结尾的\\不可省略。当执行install或update时，加载信息会写入vendor/composer/autoload_psr4.php文件。如果希望解析指定路径下的所有命名空间，则将命名空间置为空串即可。
    "autoload": {
     "files":["lib/OrderManager.php"],
        "classmap": [
            "database"
        ],
         // FIG组织制定的一组PHP相关规范，简称PSR，其中PSR-0自动加载 PSR-1基本代码规范 PSR-2代码样式 PSR-3日志接口 PSR-4 自动加载
        "psr-4": {
            "App\\": "app/"         // 自动加载命名空间App,文件夹app里的文件
        }
    },
// 和require-dev类似，只在开发过程中自动加载
    "autoload-dev": {
        "psr-4": {
            "Tests\\": "tests" // 自动加载Tests的命名空间
        }
    },
    
// ================================ 脚本 ================================
// === 在安装过程中的各个阶段挂接脚本。
    "scripts": {
        "post-install-cmd": [
            "php artisan clear-compiled",
            "php artisan optimize"
        ],
        "pre-update-cmd": [
            "php artisan clear-compiled"
        ],
        "post-update-cmd": [
            "php artisan clear-compiled",
            "php artisan optimize"
        ],
        "post-root-package-install": [
            "php -r \"copy('.env.example', '.env');\""
        ],
        "post-create-project-cmd": [
            "php artisan key:generate"
        ]
    },
// ===
   pre-install-cmd: 在 install 命令执行前触发。
   post-install-cmd: 在 install 命令执行后触发。
   更多：https://docs.phpcomposer.com/articles/scripts.html
// ================================ 设置 ================================
    "config": {
    	"process-timeout":300, // 默认300，处理进程结束时间，网络差，包大可以调高
        "use-include-path":false, // 默认为 false。如果为 true，Composer autoloader 还将在 PHP include path 中继续查找类文件
        "preferred-install":auto, // 默认为 auto。它的值可以是 source、dist 或 auto。这个选项允许你设置 Composer 的默认安装方法。
		"github-protocols":["git",'https',"ssh"], // 从 github.com 克隆时使用的协议优先级清单
        "github-oauth":{"github.com": "oauthtoken"}, // 将使用 oauthtoken 来访问 github 上的私人仓库
        "vendor-dir":vendor, //默认为 vendor。通过设置你可以安装依赖到不同的目录。
        "bin-dir":vendor/bin, //如果一个项目包含二进制文件，它们将被连接到这个目录。
        "cache-dir":$home/cache, //用于存储 composer 所有的缓存文件。
        "cache-files-dir":$cache-dir/files, //存储包 zip 存档的目录
        "cache-repo-dir":$cache-dir/repo, //存储 composer 类型的 VCS（svn、github、bitbucket） repos 目录。
        "cache-vcs-dir":$cache-dir/vcs, //此目录用于存储 VCS 克隆的 git/hg 类型的元数据，并加快安装速度。
        "cache-files-ttl":15552000, //(6个月)默认情况下 Composer 缓存的所有数据都将在闲置6个月后被删除，这个选项允许你来调整这个时间，你可以将其设置为0以禁用缓存。
        "cache-files-maxsize":300MiB, //Composer 缓存的最大容量，超出后将优先清除旧的缓存数据，直到缓存量低于这个数值。
        "prepend-autoloader":true, // 如果设置为 false，composer autoloader 将不会附加到现有的自动加载机制中。这有时候用来解决与其它自动加载机制产生的冲突。
        "autoloader-suffix":null, //Composer autoloader 的后缀，当设置为空时将会产生一个随机的字符串。
        "optimize-autoloader":false,
        "github-domains":["github.com"], //一个 github mode 下的域名列表。这是用于GitHub的企业设置。
        "notify-on-install":true,//Composer 允许资源仓库定义一个用于通知的 URL，以便有人从其上安装资源包时能够得到一个反馈通知。此选项允许你禁用该行为。
        "discard-changes":false, //它的值可以是 true、false 或 stash。这个选项允许你设置在非交互模式下，当处理失败的更新时采用的处理方式。true 表示永远放弃更改。"stash" 表示继续尝试。
    }
}
```

# 命令行

请看：https://docs.phpcomposer.com/03-cli.html

- 初始化 init `php composer.phar init`
- 安装 install `php composer.phar install`
- 更新 update
- - `php composer.phar update`
- - `php composer.phar update vendor/package vendor/package2` // 如果你只是想更新几个包
- - `php composer.phar update vendor/*` // 使用通配符进行批量更新
- 申明依赖 require
- - `php composer.phar require` // 通过交互来添加或改变以来
- - `php composer.phar require vendor/package:2.* vendor/package2:dev-master` //不通过交互，直接指明依赖包
- 全局执行 global
- 搜索 search（在packagist.org） `php composer.phar search monolog`
- 展示 show 
- - `php composer.phar show` // 列出所有可用的软件包
- - `php composer.phar show monolog/monolog` // 看一个包的详细信息
- - `php composer.phar show monolog/monolog 1.0.2` // 显示版本的详细信息
- 依赖性检测 depends
- - `php composer.phar depends --link-type=require monolog/monolog` // 查出已安装在你项目中的某个包，是否正在被其它的包所依赖，并列出他们
- 有效性检测 validate `php composer.phar validate` // 检测 composer.json 文件是否是有效的
- 依赖包状态检测 status `php composer.phar status` // 经常修改依赖包里的代码,status 命令允许你进行检查
- 自我更新 self-update
- - `php composer.phar self-update` // 将 Composer 自身升级到最新版本
- - `php composer.phar self-update 1.0.0-alpha7` // 升级到一个特定的版本
- - `sudo composer self-update` // 如果你已经为整个系统安装 Composer（参见 全局安装），你可能需要在 root 权限下运行它：
- 更改配置 config
- - `php composer.phar config --list` // 列出可修改的配置
- 修改包来源 `php composer.phar config repositories.foo vcs http://github.com/foo/bar`
- 创建项目 create-project
- - `php composer.phar create-project doctrine/orm path 2.2.*` //创建基于 Composer 的新项目
- 打印自动加载索引 dump-autoload
- - `php composer.phar dump-autoload` // 某些情况下你需要更新 autoloader，例如在你的包中加入了一个新的类。你可以使用 dump-autoload 来完成，而不必执行 install 或 update 命令。
- 查看许可协议 licenses
- - `php composer.phar --format=json` // 列出已安装的每个包的名称、版本、许可协议
- 执行脚本 run-script
- 诊断 diagnose
- - `php composer.phar diagnose` //如果你觉得发现了一个 bug 或是程序行为变得怪异
- 归档 archive
- - `php composer.phar archive vendor/package 2.0.21 --format=zip` // 对指定包的指定版本进行 zip/tar 归档。它也可以用来归档你的整个项目
- 获取帮助信息 help `php composer.phar help install`