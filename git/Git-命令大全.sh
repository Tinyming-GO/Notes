#!/bin/bash

## 相关名词
repository  #仓库
track       #跟踪
stage       #暂存
commit      #提交
push        #推送
pull        #拉取

## 获取 Git 仓库

# 在现有目录中初始化仓库
git init   #该命令将创建一个名为 .git 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必须文件，这些文件是 Git 仓库的骨干。
git add *.c
git add LICENSE   #对指定文件的跟踪
git commit -m 'initial project version'

# 克隆现有的仓库
git clone https://github.com/libgit2/libgit2    #克隆 Git 的可链接库 libgit2
git clone https://github.com/libgit2/libgit2 mylibgit   #自定义本地仓库的名字 mylibgit

# 检查当前文件状态
git status
git status -s  # 状态简览
# 状态说明
#  M README                 #出现在右边的 M 表示该文件被修改了但是还没放入暂存区
# MM Rakefile
# A  lib/git.rb             #新添加到暂存区中的文件
# M  lib/simplegit.rb       #出现在靠左边的 M 表示该文件被修改了并放入了暂存区
# ?? LICENSE.txt            #新添加的未跟踪文件

# 跟踪新文件
git add README  #跟踪 README 文件   跟踪后再执行git status会看到文件已经被暂存

# 暂存已修改文件
git add CONTRIBUTING.md   # 这个命令理解为“添加内容到下一次提交中”而不是“将一个文件添加到项目中”

# 忽略文件 参考文档 和 案例：https://github.com/github/gitignore

# 查看已暂存和未暂存的修改
git diff        #比较的是工作目录中当前文件和暂存区域快照之间的差异
git diff --staged       #查看已暂存的将要添加到下次提交里的内容 git diff --cached
git difftool --tool-help    #看你的系统支持哪些 Git Diff 插件
git difftool --tool=meld    #使用meld进行比较


# 提交更新
git commit -m "这里写提交信息"

# 跳过使用暂存区域
git commit -a -m 'added new benchmarks' # 自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤

# 移除文件
git rm PROJECTS.md      # 从暂存区域和工作目录中删除指定的文件
git rm -f PROJECTS.md   # 强制删除！如果工作目录有修改的时候
git rm --cached README  # 只删除暂存区域文件！保留工作目录
git rm log/\*.log       # 此命令删除 log/ 目录下扩展名为 .log 的所有文件

# 移动文件
git mv README.md README #重命名操作

# 查看提交历史 常用选项 https://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E6%9F%A5%E7%9C%8B%E6%8F%90%E4%BA%A4%E5%8E%86%E5%8F%B2#rlog_options
git log     #按提交时间倒序列出所有的更新
git log  -p -2  # -p 用来显示每次提交的内容差异;-2 来仅显示最近两次提交
git log --stat  # 简略的统计信息
git log --pretty=oneline    # 将每个提交放在一行显示,查看的提交数很大时非常有用。
git log --pretty=format:"%h - %an, %ar : %s"    # 定制要显示的记录格式    https://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E6%9F%A5%E7%9C%8B%E6%8F%90%E4%BA%A4%E5%8E%86%E5%8F%B2#rpretty_format
git log --pretty=format:"%h %s" --graph     #这个选项添加了一些ASCII字符串来形象地展示你的分支、合并历史
git log --grep "string"        #搜索相关  搜索提交说明中的关键字。
git log -S "function_name"     #搜索相关  列出那些添加或移除了某些字符串的提交
git log -- "$PATH"     #搜索相关  只关心某些文件或者目录的历史提交
#更多选项   https://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E6%9F%A5%E7%9C%8B%E6%8F%90%E4%BA%A4%E5%8E%86%E5%8F%B2#rlimit_options


#撤消操作
git commit -m 'initial commit'
git add forgotten_file
git commit --amend  # 最终你只会有一个提交 - 第二次提交将代替第一次提交的结果。

git reset HEAD CONTRIBUTING.md  # 取消暂存 CONTRIBUTING.md 文件

git checkout -- CONTRIBUTING.md  # 撤消之前所做的修改！！危险命令！

#查看远程仓库
git remote -v   #显示读写远程仓库使用的 Git 保存的简写与其对应的 URL
git remote show origin  # 查看远程仓库origin的更多信息
#添加远程仓库
git remote add pb https://github.com/paulboone/ticgit  # 使用字符串 pb 来代替整个 URL
git fetch pb  #拉取但不和并 （不常用）
git pull pb   #抓取数据并自动尝试合并到当前所在的分支。
#推送到远程仓库
git push origin master  #将 master 分支推送到 origin 服务器 （会列出分支信息 pull信息 push信息）
#远程仓库的移除与重命名
git remote rename pb paul  #将 pb 重命名为 paul
git remote rm paul  #移除一个远程仓库paul


#标签
git tag     #列出已有的标签
git tag -l 'v1.8.5*'    #只显示1.8.5 系列的标签
git show v1.4   #看到标签信息与对应的提交信息
#附注标签（常用）
git tag -a v1.4 -m 'my version 1.4'  # -a 标签名 -m 存储在标签中的信息
#轻量标签（不常用）
git tag v1.4-lw     # 标签名 v1.4-lw
#给历史记录打标签
git tag -a v1.2 9fceb02   # 9fceb02（部分校验和）
#共享标签 把标签推送到远程仓库服务器
git push origin v1.5    #仅推送标签v1.5到远程仓库origin
git push origin --tags   #一次性推送全部标签
#检出标签 并不能真的检出一个标签 只能在特定的标签上创建一个新分支：
git checkout -b version2 v2.0.0


#Git 别名
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'  # git unstage fileA  <===>  git reset HEAD -- fileA

#分支管理
git branch  #当前所有分支的一个列表    * 字符：它代表现在检出的那一个分支（HEAD指针指向的分支）
git branch -v   #查看每一个分支的最后一次提交
git branch --merged # 查看哪些分支已经合并到当前分支
git branch --no-merged # 查看哪些分支还没有合并到当前分支
#分支创建
git branch testing  #创建了分支testing，但没有自动切换到testing分支
git checkout -b iss53   #创建新分支iss53，并自动切换到iss53分支下
#分支信息查看
git log --oneline --decorate    #查看各个分支当前所指的对象
git log --oneline --decorate --graph --all   #带分叉图查看
#分支切换
git checkout testing    #切换到分支testing
#分支合并
git checkout master  #先切换到主分支
git merge hotfix    #接着合并hotfix到主分支
#删除分支
git branch -d hotfix    #删除分支hotfix
#冲突解决
git mergetool --tool=meld  #用meld图形化工具解决冲突
git status  #合并发生冲突时，用该命令查看冲突发生的位置和文件，然后手动编辑文件
git add index.html  #冲突解决后，用该命令将其标记为冲突已解决。
git status  #最后再运行该命令查看是否合并成功




## git push 每次都需要输入用户名和密码解决方法
git remote rm origin  # 先删除旧的https方式
git remote add origin git@github.com:Tinyming-GO/php_for_life.git  # 使用新的ssh方式











