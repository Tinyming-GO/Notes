<!-- GFM-TOC -->
* [一、文件压缩与解压](#文件压缩与解压)
<!-- GFM-TOC -->



## `ab`

Apache Benchmarking tool. The simplest tool to perform a load testing.(Apache基准测试工具,执行负载测试的最简单工具)

- Execute 100 HTTP GET requests to given URL:(对给定URL执行100个HTTP GET请求)

  `ab -n 100 url`

- Execute 100 HTTP GET requests, processing up to 10 requests concurrently, to given URL:(对给定URL执行100个HTTP GET请求，并发处理最多10个请求)

  `ab -n 100 -c 10 url`

- Use keep alive:

  `ab -k url`

- Set the maximum number of seconds to spend for benchmarking:(设置用于基准测试的最大秒数)

  `ab -t 60 url`

## `ack`

A search tool like grep, optimized for programmers.(像grep这样的搜索工具，为程序员进行了优化)
Homepage: <https://beyondgrep.com/documentation/>.

- Find files containing "foo":(查找包含“foo”的文件)

  `ack foo`

- Find files of a specific type:(查找特定类型的文件)

  `ack --ruby foo`

- Count the total number of matches for the term "foo":(计算匹配项“foo”的总数)

  `ack -ch foo`

- Show the file names containing "foo" and number of matches in each file:(显示包含“foo”的文件名和每个文件中匹配的数目)

  `ack -cl foo`

- List all valid types:(列出所有有效类型)

  `ack --help=types`

## `alias`

Creates aliases -- words that are replaced by a command string.(创建别名——由命令字符串替换的单词)
Aliases expire with the current shell session, unless they're defined in the shell's configuration file, e.g. `~/.bashrc`.(别名将随着当前shell会话过期，除非在shell的配置文件中定义了别名，eg:`~/.bashrc`)

- List all aliases:(列出所有的别名)

  `alias`

- Create a generic alias:(创建通用别名)

  `alias word="command"`

- View the command associated to a given alias:(查看与给定别名关联的命令)

  `alias word`

- Remove an aliased command:(删除别名命令)

  `unalias word`

- Turn `rm` into an interactive command:(将“rm”转换为交互式命令)

  `alias rm="rm -i"`

- Create `la` as a shortcut for `ls -a`:(创建“la”作为“ls -a”的快捷方式)

  `alias la="ls -a"`



# 文件压缩与解压

## `tar`

Archiving utility(归档工具).

Often combined with a compression method, such as gzip or bzip(通常与压缩方法结合使用，如gzip或bzip).

- Create an archive from files(从文件创建归档):

  `tar -cf target.tar file1 file2 file3`

- Create a gzipped archive(创建一个压缩的归档文件):

  `tar -czf target.tar.gz file1 file2 file3`

- Extract an archive in a target folder(在目标文件夹中提取存档):

  `tar -xf source.tar -C folder`

- Extract a gzipped archive in the current directory(在当前目录中解压缩归档文件):

  `tar -xzf source.tar.gz`

- Extract a bzipped archive in the current directory(在当前目录中解压缩存档):

  `tar -xjf source.tar.bz2`

- Create a compressed archive, using archive suffix to determine the compression program(创建压缩存档，使用存档后缀来确定压缩程序):

  `tar -caf target.tar.xz file1 file2 file3`

- List the contents of a tar file(列出tar文件的内容):

  `tar -tvf source.tar`

- Extract files matching a pattern(提取与模式匹配的文件):

  `tar -xf source.tar --wildcards "*.html"`

## gzip

Compress/uncompress files with gzip compression (LZ77)(压缩/解压使用gzip压缩的文件).

- Compress a file, replacing it with a gzipped compressed version(压缩文件，用压缩后的gzip版本替换它):

  `gzip file.ext`

- Decompress a file, replacing it with the original uncompressed version(解压缩文件，用原始的未压缩版本替换它):

  `gzip -d file.ext.gz`

- Compress a file specifying the output filename(压缩指定输出文件名的文件):

  `gzip -c file.ext > compressed_file.ext.gz`

- Decompress a gzipped file specifying the output filename(解压缩指定输出文件名的gzip文件):

  `gzip -c -d file.ext.gz > uncompressed_file.ext`

- Specify the compression level. 1=Fastest (Worst), 9=Slowest (Best), Default level is 6(指定压缩级别。1=最快(最差)，9=最慢(最好)，默认级别为6):

  `gzip -9 -c file.ext > compressed_file.ext.gz`

## bzip2

A block-sorting file compressor(块排序文件压缩器).

- Compress file(压缩文件):

  `bzip2 path/to/file_to_compress`

- Decompress file(解压缩文件):

  `bzip2 -d path/to/compressed_file.bz2`

- Decompress to console(解压到控制台):

  `bzip2 -dc path/to/compressed_file.bz2`

## zip

Package and compress (archive) files into zip file(打包并压缩(归档)文件到zip文件中).

- Package and compress a directory and its contents, [r]ecursively(封装和压缩目录及其内容,[r]递归):

  `zip -r compressed.zip /path/to/dir`

- E[x]clude unwanted files from being added to the compressed archive(排除不需要的文件添加到压缩存档):

  `zip -r compressed.zip path/to/dir -x path/to/exclude`

- Archive a directory and its contents with the highest level [9] of compression(归档压缩级别最高的[9]目录及其内容):

  `zip -r -9 compressed.zip /path/to/dir`

- Package and compress multiple directories and files(打包和压缩多个目录和文件):

  `zip -r compressed.zip /path/to/dir1 /path/to/dir2 /path/to/file`

- Create an encrypted archive (user will be prompted for a password)(创建一个加密的存档(用户将被提示输入密码)):

  `zip -e -r compressed.zip path/to/dir`

- Add files to an existing zip file(将文件添加到现有zip文件中):

  `zip compressed.zip path/to/file`

- Delete files from an existing zip file(从现有zip文件中删除文件):

  `zip -d compressed.zip "foo/*.tmp"`

- Archive a directory and its contents to a multi-part [s]plit zip file (e.g. 3GB parts)(将目录及其内容存档到多部分分割的zip文件中(例如，3GB部分)):

  `zip -r -s 3g compressed.zip path/to/dir`

## unzip

Extract compressed files in a ZIP archive(在ZIP归档文件中提取压缩文件).

- Extract zip file(s) (for multiple files, separate file paths by spaces)(解压zip文件(对于多个文件，按空格分隔文件路径)):

  `unzip file(s)`

- Extract zip files(s) to given path(将zip文件解压缩到指定路径):

  `unzip compressed_file(s) -d /path/to/put/extracted_file(s)`

- List the contents of a zip file without extracting（列出zip文件的内容，但不提取）:

  `unzip -l file.zip`

- Extract the contents of the file(s) to stdout alongside the extracted file names(将文件的内容与提取的文件名一起提取到stdout):

  `unzip -c file.zip`

- Extract a zip file created in windows, containing files with non-ascii (chinese) filenames(提取在windows中创建的zip文件，其中包含具有非ascii(中文)文件名的文件):

  `unzip -O gbk file.zip`



## `dpkg`

Debian package manager(Debian软件包管理器)

- Install a package(安装一个软件包):

  `dpkg -i path/to/file.deb`

- Remove a package(移除一个软件包):

  `dpkg -r package_name`

- List installed packages(列出已安装的包):

  `dpkg -l pattern`

- List package contents(列出包的内容):

  `dpkg -L package_name`

- List contents of a local package file(列出本地包文件的内容):

  `dpkg -c path/to/file.deb`

- Find out which package owns a file(找出哪个包拥有一个文件):

  `dpkg -S file_name`



## `grep`

Matches patterns in input text(匹配输入文本中的模式).

Supports simple patterns and regular expressions(支持简单模式和正则表达式).

- Search for an exact string(搜索一个准确的字符串):

  `grep search_string path/to/file`

- Search in case-insensitive mode(搜索不区分大小写的模式):

  `grep -i search_string path/to/file`

- Search recursively (ignoring non-text files) in current directory for an exact string(在当前目录中递归搜索(忽略非文本文件)以获得确切的字符串):

  `grep -RI search_string .`

- Use extended regular expressions(使用扩展正则表达式) (supporting `?`, `+`, `{}`, `()` and `|`):

  `grep -E ^regex$ path/to/file`

- Print 3 lines of [C]ontext around, [B]efore, or [A]fter each match()(在每个match()前后[C]、之前[B]或之后[A]打印3行上下文):

  `grep -C|B|A 3 search_string path/to/file`

- Print file name with the corresponding line number for each match(为每个匹配打印文件名与对应的行号):

  `grep -Hn search_string path/to/file`

- Use the standard input instead of a file(使用标准输入而不是文件):

  `cat path/to/file | grep search_string`

- Invert match for excluding specific strings(反转匹配用于排除特定字符串):

  `grep -v search_string`

## `find`

Find files or directories under the given directory tree, recursively(递归地查找给定目录树下的文件或目录).

- Find files by extension(按扩展名查找文件):

  `find root_path -name '*.ext'`

- Find files by matching multiple patterns(通过匹配多个模式来查找文件):

  `find root_path -name '*pattern_1*' -or -name '*pattern_2*'`

- Find directories matching a given name(查找与给定名称匹配的目录):

  `find root_path -type d -name *lib*`

- Find files matching path pattern(查找与路径模式匹配的文件):

  `find root_path -path '**/lib/**/*.ext'`

- Run a command for each file, use {} within the command to access the filename(在命令中使用{}访问文件名):

  `find root_path -name '*.ext' -exec wc -l {} \;`

- Find files modified in the last 24-hour period(查找在过去24小时内修改的文件):

  `find root_path -mtime -1`

- Find files using case insensitive name matching, of a certain size(使用不区分大小写的名称匹配来查找具有一定大小的文件):

  `find root_path -size +500k -size -10M -iname '*.TaR.gZ'`

- Delete files by name, older than 180 days(按名称删除超过180天的文件):

  `find root_path -name '*.ext' -mtime +180 -delete`

- Find files matching a given pattern, while excluding specific paths(同时排除特定路径):

  `find root_path -name '*.py' -not -path '*/site-packages/*'`

## ssh

Secure Shell is a protocol used to securely log onto remote systems(Secure Shell是一种用于安全地登录到远程系统的协议).

It can be used for logging or executing commands on a remote server(它可以用于在远程服务器上记录或执行命令).

- Connect to a remote server(连接到远程服务器):

  `ssh username@remote_host`

- Connect to a remote server with a specific identity (private key)(使用特定标识(私钥)连接到远程服务器):

  `ssh -i path/to/key_file username@remote_host`

- Connect to a remote server using a specific port(使用特定端口连接到远程服务器):

  `ssh username@remote_host -p 2222`

- Run a command on a remote server(在远程服务器上运行命令):

  `ssh remote_host command -with -flags`

- SSH tunneling: Dynamic port forwarding (SOCKS proxy on localhost:9999)(SSH隧道:动态端口转发(本地主机上的SOCKS代理:9999)):

  `ssh -D 9999 -C username@remote_host`

- SSH tunneling: Forward a specific port (localhost:9999 to slashdot.org:80) along with disabling pseudo-[t]ty allocation and executio[n] of remote commands(SSH隧道:转发特定端口(localhost:9999到slashdot.org:80)，并禁用远程命令的伪[t]ty分配和执行[n]):

  `ssh -L 9999:slashdot.org:80 -N -T username@remote_host`

- SSH jumping: Connect through a jumphost to a remote server (Multiple jump hops may be specified separated by comma characters)(SSH跳转:通过jumphost连接到远程服务器(可以用逗号分隔多个跳转)):

  `ssh -J username@jump_host username@remote_host`

- Agent forwarding: Forward the authentication information to the remote machine (see `man ssh_config` for available options)(代理转发:将身份验证信息转发到远程机器(有关可用选项，请参见“man ssh config”)):

  `ssh -A username@remote_host`

## `sed`

Edit text in a scriptable manner(以可编写脚本的方式编辑文本).

- Replace the first occurrence of a regular expression in each line of a file(替换文件每行中第一个出现的正则表达式), and print the result:

  `sed 's/regex/replace/' filename`

- Replace all occurrences of an extended regular expression in a file(替换文件中出现的所有扩展正则表达式), and print the result:

  `sed -r 's/regex/replace/g' filename`

- Replace all occurrences of a string in a file, overwriting the file (i.e. in-place)(替换文件中出现的所有字符串，覆盖该文件):

  `sed -i 's/find/replace/g' filename`

- Replace only on lines matching the line pattern(只替换与行模式匹配的行):

  `sed '/line_pattern/s/find/replace/' filename`

- Delete lines matching the line pattern(删除与行模式匹配的行):

  `sed '/line_pattern/d' filename`

- Print only text between n-th line till the next empty line(只打印第n行之间的文本，直到下一个空行):

  `sed -n 'line_number,/^$/p' filename`

- Apply multiple find-replace expressions to a file(对文件应用多个查找-替换表达式):

  `sed -e 's/find/replace/' -e 's/find/replace/' filename`

- Replace separator / by any other character not used in the find or replace patterns, e.g., #(用查找或替换模式中未使用的任何其他字符替换分隔符,例如, #):

  `sed 's#find#replace#' filename`

## awk

A versatile programming language for working on files(一种用于处理文件的通用编程语言).

- Print the fifth column (a.k.a. field) in a space-separated file(在空格分隔的文件中打印第五列(即字段)):

  `awk '{print $5}' filename`

- Print the second column of the lines containing "something" in a space-separated file(在空格分隔的文件中打印包含“something”的行的第二列):

  `awk '/something/ {print $2}' filename`

- Print the last column of each line in a file, using a comma (instead of space) as a field separator(打印文件中每行的最后一列，使用逗号(而不是空格)作为字段分隔符):

  `awk -F ',' '{print $NF}' filename`

- Sum the values in the first column of a file and print the total(将文件第一列中的值相加并打印出总数):

  `awk '{s+=$1} END {print s}' filename`

- Sum the values in the first column and pretty-print the values and then the total(对第一列中的值求和，然后漂亮地打印出这些值，然后是总数):

  `awk '{s+=$1; print $1} END {print "--------"; print s}' filename`

- Print every third line starting from the first line(从第一行开始，每隔三行打印一次):

  `awk 'NR%3==1' filename`



## diff

Compare files and directories.（比较文件和目录）

- Compare files:（比较文件）

  `diff file1 file2`

- Compare files, ignoring white spaces:（比较文件，忽略空白）

  `diff -w file1 file2`

- Compare files, showing the differences side by side:（比较文件，并排显示差异）

  `diff -y file1 file2`

- Compare files, showing the differences in unified format (as used by `git diff`):（比较文件，显示统一格式的差异(如“git diff”所使用的)）

  `diff -u file1 file2`

- Compare directories recursively:（递归地比较目录）

  `diff -r directory1 directory2`

- Compare directories, only showing the names of files that differ:（比较目录，只显示不同文件的名称）

  `diff -rq directory1 directory2`

## sort

Sort lines of text files.（对文本文件行进行排序）

- Sort a file in ascending order:（按升序排列文件）

  `sort filename`

- Sort a file in descending order:（按降序排列文件）

  `sort -r filename`

- Sort a file in case-insensitive way:（以不区分大小写的方式对文件排序）

  `sort --ignore-case filename`

- Sort a file using numeric rather than alphabetic order:（使用数字而不是字母顺序对文件排序）

  `sort -n filename`

- Sort the passwd file by the 3rd field, numerically:（按第三个字段对passwd文件进行数字排序）

  `sort -t: -k 3n /etc/passwd`

- Sort a file preserving only unique lines:（对只保留唯一行的文件进行排序）

  `sort -u filename`

- Sort human-readable numbers (in this case the 5th field of `ls -lh`):（对人类可读的数字排序(在本例中是“ls -lh”的第5个字段)）

  `ls -lh | sort -h -k 5`

## export

Command to mark shell variables in the current environment to be exported with any newly forked child processes.(命令标记当前环境中的shell变量，这些变量将与任何新分叉的子进程一起导出)

- Set a new environment variable:(设置一个新的环境变量)

  `export VARIABLE=value`

- Remove an environment variable:(删除环境变量)

  `export -n VARIABLE`

- Mark a shell function for export:(标记一个用于导出的shell函数)

  `export -f FUNCTION_NAME`

- Append something to the PATH variable:(向PATH变量添加内容)

  `export PATH=$PATH:path/to/append`

## args

## ls

List directory contents.(列出目录内容)

- List files one per line:（每行列出一个文件）

  `ls -1`

- List all files, including hidden files:（列出所有文件，包括隐藏文件）

  `ls -a`

- Long format list (permissions, ownership, size and modification date) of all files:(所有文件的长格式列表(权限、所有权、大小和修改日期))

  `ls -la`

- Long format list with size displayed using human readable units (KB, MB, GB):(使用人类可读单元(KB、MB、GB)显示大小的长格式列表)

  `ls -lh`

- Long format list sorted by size (descending):(按大小排序的长格式列表(降序排列))

  `ls -lS`

- Long format list of all files, sorted by modification date (oldest first):(所有文件的长格式列表，按修改日期排序(最早的))

  `ls -ltr`

## pwd

Print name of current/working directory.（打印当前/工作目录的名称）

- Print the current directory:(打印当前目录)

  `pwd`

- Print the current directory, and resolve all symlinks (i.e. show the "physical" path):(打印当前目录，并解析所有符号链接(即显示“物理”路径))

  `pwd -P`

## cd

Change the current working directory.（更改当前工作目录）

- Go to the given directory:（转到给定的目录）

  `cd path/to/directory`

- Go to home directory of current user:（转到当前用户的主目录）

  `cd`

- Go up to the parent of the current directory:（转到当前目录的父目录）

  `cd ..`

- Go to the previously chosen directory:（ 转到前面选择的目录）

  `cd -`

## shutdown

Shutdown and reboot the system.（关闭并重新启动系统）

- Power off (halt) immediately:（立即断电(停止)）

  `shutdown -h now`

- Reboot immediately:(立即重新启动)

  `shutdown -r now`

- Reboot in 5 minutes:(5分钟后重启)

  `shutdown -r +5 &`

- Shutdown at 1:00 pm (Uses 24h clock):(下午1点关闭(使用24小时时钟))

  `shutdown -h 13:00`

- Cancel a pending shutdown/reboot operation:（取消挂起的关机/重启操作）

  `shutdown -c`

## ftp

Tools to interact with a server via File Transfer Protocol.（通过文件传输协议与服务器交互的工具）

- Connect to an FTP server:（连接到FTP服务器）

  `ftp ftp.example.com`

- Switch to binary transfer mode (graphics, compressed files, etc):(切换到二进制传输模式(图形、压缩文件等))

  `binary`

- Transfer multiple files without prompting for confirmation on every file:(传输多个文件，而不提示对每个文件的确认)

  `prompt off`

- Download multiple files (glob expression):(下载多个文件(glob表达式))

  `mget *.png`

- Upload multiple files (glob expression):（上传多个文件(glob表达式)）

  `mput *.zip`

- Delete multiple files on the remote server:（删除远程服务器上的多个文件）

  `mdelete *.txt`

- Rename a file on the remote server:（在远程服务器上重命名文件）

  `rename original_filename new_filename`

## crontab

Schedule cron jobs to run on a time interval for the current user.（调度cron作业以当前用户的时间间隔运行）

Job definition format: "(min) (hour) (day_of_month) (month) (day_of_week) command_to_execute".（作业定义格式:“(min) (hour) (day of month) (month) (day of week)命令执行。）

- Edit the crontab file for the current user:（编辑当前用户的crontab文件）

  `crontab -e`

- View a list of existing cron jobs for current user:（查看当前用户的现有cron作业列表）

  `crontab -l`

- Remove all cron jobs for the current user:（删除当前用户的所有cron作业）

  `crontab -r`

- Sample job which runs at 10:00 every day. * means any value:（每天10:00运行的示例作业。*表示任何值）

  `0 10 * * * path/to/script.sh`

- Sample job which runs every minute on the 3rd of April:（示例作业在4月3日每分钟运行一次）

  `* * 3 Apr * path/to/script.sh`

- Sample job which runs at 02:30 every Friday:（示例作业，每个星期五02:30运行）

  `30 2 * * Fri path/to/script.sh`

## service

Manage services by running init scripts.（通过运行init脚本管理服务）

The full script path should be omitted (/etc/init.d/ is assumed).（应该省略完整的脚本路径（假设/etc/init.d/））

- Start/Stop/Restart/Reload service (start/stop should always be available):

  `service init_script start|stop|restart|reload`

- Do a full restart (runs script twice with start and stop):（完全重新启动(使用start和stop运行脚本两次)）

  `service init_script --full-restart`

- Show the current status of a service:（显示服务的当前状态）

  `service init_script status`

- List the status of all services:（列出所有服务的状态）

  `service --status-all`

## ps

Information about running processes.（有关正在运行的进程的信息）

- List all running processes:（列出所有正在运行的进程）

  `ps aux`

- List all running processes including the full command string:（列出所有正在运行的进程，包括完整的命令字符串）

  `ps auxww`

- Search for a process that matches a string:（搜索匹配字符串的进程）

  `ps aux | grep string`

- List all processes of the current user in extra full format:（以额外的完整格式列出当前用户的所有进程）

  `ps --user $(id -u) -F`

- List all processes of the current user as a tree:（以树的形式列出当前用户的所有进程）

  `ps --user $(id -u) f`

- Get the parent pid of a process:（获取进程的父pid）

  `ps -o ppid= -p pid`

## free

Display amount of free and used memory in the system.（显示系统中空闲内存和使用内存的数量）

- Display system memory:（显示系统内存）

  `free`

- Display memory in Bytes/KB/MB/GB: 以Bytes/KB/MB/GB为单位显示内存

  `free -b|k|m|g`

- Display memory in human readable units:（以人类可读的单位显示内存）

  `free -h`

- Refresh the output every 2 seconds:（每2秒刷新一次输出）

  `free -s 2`

## top

Display dynamic real-time information about running processes.(显示有关正在运行的进程的动态实时信息)

- Start top:(启动top)

  `top`

- Do not show any idle or zombie processes:(不显示任何空闲或僵尸进程)

  `top -i`

- Show only processes owned by given user:(只显示给定用户拥有的进程)

  `top -u user_name`

- Show only the processes with the given PID(s), passed as a comma-separated list. (Normally you wouldn't know PIDs off hand. This example picks the PIDs from the process name):(只显示具有给定PID(s)的进程，以逗号分隔的列表的形式传递。(通常情况下，你不会马上知道pid。这个例子从进程名中选择pid))

  `top -p $(pgrep -d ',' process_name)`

- Get help about interactive commands:(获得有关交互式命令的帮助)

  `?`

## df

Gives an overview of the file system disk space usage.(概述文件系统磁盘空间的使用情况)

- Display all file systems and their disk usage:(显示所有文件系统及其磁盘使用情况)

  `df`

- Display all file systems and their disk usage in human readable form:(以人类可读的形式显示所有文件系统及其磁盘使用情况)

  `df -h`

- Display the file system and its disk usage containing the given file or directory:(显示包含给定文件或目录的文件系统及其磁盘使用情况)

  `df path/to/file_or_directory`

## kill

Sends a signal to a process, usually related to stopping the process.（向进程发送信号，通常与停止进程相关）

All signals except for SIGKILL and SIGSTOP can be intercepted by the process to perform a clean exit.(进程可以拦截除SIGKILL和SIGSTOP之外的所有信号，以执行干净的退出)

- Terminate a program using the default SIGTERM (terminate) signal:(使用默认的SIGTERM (Terminate)信号终止程序)

  `kill process_id`

- List available signal names (to be used without the `SIG` prefix):(列出可用的信号名称(不使用“SIG”前缀))

  `kill -l`

- Terminate a program using the SIGHUP (hang up) signal. Many daemons will reload instead of terminating:(使用SIGHUP(挂起)信号终止程序。许多守护进程将重新加载而不是终止)

  `kill -1|HUP process_id`

- Terminate a program using the SIGINT (interrupt) signal. This is typically initiated by the user pressing `Ctrl + C`:(使用SIGINT(中断)信号终止程序。这通常是由用户按Ctrl + C启动的)

  `kill -2|INT process_id`

- Signal the operating system to immediately terminate a program (which gets no chance to capture the signal):(通知操作系统立即终止一个程序(该程序没有机会捕获信号))

  `kill -9|KILL process_id`

- Signal the operating system to pause a program until a SIGCONT ("continue") signal is received:(向操作系统发出信号，使程序暂停，直到接收到SIGCONT(“continue”)信号)

  `kill -17|STOP process_id`

- Send a `SIGUSR1` signal to all processes with the given GID (group id):(向所有具有给定GID(组id)的进程发送“SIGUSR1”信号)

  `kill -SIGUSR1 -group_id`

## rm

Remove files or directories.(删除文件或目录)

- Remove files from arbitrary locations:（从任意位置删除文件）

  `rm path/to/file path/to/another/file`

- Recursively remove a directory and all its subdirectories:（递归地删除一个目录及其所有子目录）

  `rm -r path/to/directory`

- Forcibly remove a directory, without prompting for confirmation or showing error messages:（强制删除目录，不提示确认或显示错误消息）

  `rm -rf path/to/directory`

- Interactively remove multiple files, with a prompt before every removal:（交互式地删除多个文件，每次删除之前都有一个提示）

  `rm -i file(s)``

- Remove files in verbose mode, printing a message for each removed file:（以详细模式删除文件，为每个删除的文件打印一条消息）

  `rm -v path/to/directory/*`

## cp

Copy files and directories.（复制文件和目录）

- Copy a file to another location:(将文件复制到另一个位置)

  `cp path/to/file.ext path/to/copy.ext`

- Copy a file into another directory, keeping the filename:(将文件复制到另一个目录中，保留文件名)

  `cp path/to/file.ext path/to/target_parent_directory`

- Copy a directory recursively to another location:(递归地将目录复制到另一个位置)

  `cp -r path/to/directory path/to/copy`

- Copy a directory recursively, in verbose mode (shows files as they are copied):(以详细模式递归复制目录(在复制时显示文件))

  `cp -vr path/to/directory path/to/copy`

- Copy the contents of a directory into another directory:(将目录的内容复制到另一个目录中)

  `cp -r path/to/source_directory/* path/to/target_directory`

- Copy text files to another location, in interactive mode (prompts user before overwriting):(以交互模式将文本文件复制到另一个位置(在覆盖之前提示用户))

  `cp -i *.txt path/to/target_directory`

## mv

Move or rename files and directories.（移动或重命名文件和目录）

- Move files in arbitrary locations:（在任意位置移动文件）

  `mv source target`

- Do not prompt for confirmation before overwriting existing files:（在覆盖现有文件之前不提示确认吗）

  `mv -f source target`

- Prompt for confirmation before overwriting existing files, regardless of file permissions:（在覆盖现有文件之前提示确认，而不管文件权限如何）

  `mv -i source target`

- Do not overwrite existing files at the target:（不覆盖目标上的现有文件）

  `mv -n source target`

- Move files in verbose mode, showing files after they are moved:（以详细模式移动文件，显示移动后的文件）

  `mv -v source target`

## cat

Print and concatenate files.（打印并连接文件）

- Print the contents of a file to the standard output:（将文件的内容打印到标准输出）

  `cat file`

- Concatenate several files into the target file:（将多个文件连接到目标文件中）

  `cat file1 file2 > target_file`

- Append several files into the target file:（在目标文件中添加几个文件）

  `cat file1 file2 >> target_file`

- Number all output lines:（给所有输出行编号）

  `cat -n file`

## mount

Provides access to an entire filesystem in one directory.（提供对一个目录中的整个文件系统的访问）

- Show all mounted filesystems:（显示所有挂载的文件系统）

  `mount`

- Mount a device to a directory:（将设备挂载到目录）

  `mount -t filesystem_type path/to/device_file path/to/target_directory`

- Mount a CD-ROM device (with the filetype ISO9660) to /cdrom (readonly):（使用ISO9660文件型）将CD-ROM设备挂载到/cdrom(只读)

  `mount -t iso9660 -o ro /dev/cdrom /cdrom`

- Mount all the filesystem defined in /etc/fstab:（将所有定义的文件系统挂载到/etc/fstab）

  `mount -a`

- Mount a specific filesystem described in /etc/fstab (e.g. "/dev/sda1 /my_drive ext2 defaults 0 2"):（挂载一个特定的文件系统到/etc/fstab）

  `mount /my_drive`

## chmod

Change the access permissions of a file or directory.（更改文件或目录的访问权限）

- Give the [u]ser who owns a file the right to e[x]ecute it:（给拥有文件的用户执行文件的权利）

  `chmod u+x file`

- Give the user rights to [r]ead and [w]rite to a file/directory:（赋予用户对文件/目录的读写权限）

  `chmod u+rw file_or_directory`

- Remove executable rights from the [g]roup:（从组中删除可执行权限）

  `chmod g-x file`

- Give [a]ll users rights to read and execute:（赋予所有用户读取和执行的权限）

  `chmod a+rx file`

- Give [o]thers (not in the file owner's group) the same rights as the group:（给其他人(不在文件所有者组中)与该组相同的权限）

  `chmod o=g file`

- Change permissions recursively giving [g]roup and [o]thers the abililty to [w]rite:（递归地更改权限，使group和其他人具有编写的能力）

  `chmod -R g+w,o+w directory`

## chown

Change user and group ownership of files and directories.（更改文件和目录的用户和组所有权）

- Change the owner user of a file/directory:（更改文件/目录的所有者用户）

  `chown user path/to/file_or_directory`

- Change the owner user and group of a file/directory:（更改文件/目录的所有者、用户和组）

  `chown user:group path/to/file_or_directory`

- Recursively change the owner of a directory and its contents:（递归地更改目录的所有者及其内容）

  `chown -R user path/to/directory`

- Change the owner of a symbolic link:（更改符号链接的所有者）

  `chown -h user path/to/symlink`

- Change the owner of a file/directory to match a reference file:（更改文件/目录的所有者以匹配引用文件）

  `chown --reference=path/to/reference_file path/to/file_or_directory`

## passwd

Passwd is a tool used to change a user's password.（Passwd是一个用于更改用户密码的工具）

- Change the password of the current user:（更改当前用户的密码）

  `passwd new_password`

- Change the password of the specified user:（更改指定用户的密码）

  `passwd username new_password`

- Get the current status of the user:（获取用户的当前状态）

  `passwd -S`

- Make the password of the account blank (it will set the named account passwordless):（将账户密码设置为空(将指定账户设置为无密码)）

  `passwd -d`

## mkdir

Creates a directory.（创建一个目录）

- Create a directory in current directory or given path:（在当前目录或给定路径中创建一个目录）

  `mkdir directory`

- Create directories recursively (useful for creating nested dirs):（递归创建目录(用于创建嵌套的目录)）

  `mkdir -p path/to/directory`

## ifconfig

Network Interface Configurator.（网络接口配置器）

- View network settings of an ethernet adapter:（查看以太网适配器的网络设置）

  `ifconfig eth0`

- Display details of all interfaces, including disabled interfaces:（显示所有接口的详细信息，包括禁用的接口）

  `ifconfig -a`

- Disable eth0 interface:（禁用eth0接口）

  `ifconfig eth0 down`

- Enable eth0 interface:（开启eth0接口）

  `ifconfig eth0 up`

- Assign IP address to eth0 interface:（将IP地址分配给eth0接口）

  `ifconfig eth0 ip_address`

## uname

Print details about the current machine and the operating system running on it.（打印当前机器及其上运行的操作系统的详细信息）

Note: for additional information about the operating system, try the `lsb_release` command.（注意:有关操作系统的其他信息，请尝试“lsb release”命令）

- Print hardware-related information: machine and processor:（打印硬件相关信息:机器和处理器）

  `uname -mp`

- Print software-related information: operating system, release number, and version:（打印与软件相关的信息:操作系统、发布号和版本）

  `uname -srv`

- Print the nodename (hostname) of the system:（打印系统的节点名(主机名)）

  `uname -n`

- Print all available system information (hardware, software, nodename):（打印所有可用的系统信息(硬件、软件、节点名)）

  `uname -a`

## whereis

Locate the binary, source, and manual page files for a command.（定位命令的二进制、源代码和手动页文件）

- Locate binary, source and man pages for ssh:（找到ssh的二进制文件、源代码和手册页）

  `whereis ssh`

- Locate binary and man pages for ls:（查找ls的二进制和手册页）

  `whereis -bm ls`

- Locate source of gcc and man pages for git:（找到git的gcc源代码和手册页）

  `whereis -s gcc -m git`

- Locate binaries for gcc in /usr/bin/ only:（只在目录/usr/bin/为gcc定位二进制文件）

  `whereis -b -B /usr/bin/ -f gcc`

## whatis

Display one-line descriptions from manual pages.（显示手册页中的一行描述）

- Display a description from a man page:（显示来自手册页的描述）

  `whatis command`

- Don't cut the description off at the end of the line:（不要在一行的末尾删去描述）

  `whatis --long command`

- Display descriptions for all commands matching a glob:（显示与一个通配符匹配的所有命令的描述）

  `whatis --wildcard net*`

- Search man page descriptions with a regular expression:（使用正则表达式搜索手册页描述）

  `whatis --regex 'wish[0-9]\.[0-9]'`

## locate

Find filenames quickly.（快速找到文件名）

- Look for pattern in the database. Note: the database is recomputed periodically (usually weekly or daily):（在数据库中查找模式。注:数据库定期重新计算(通常每周或每天)）

  `locate pattern`

- Look for a file by its exact filename (a pattern containing no globbing characters is interpreted as `*pattern*`):（据文件名查找文件(不包含通配符的模式被解释为“*pattern*”)）

  `locate */filename`

- Recompute the database. You need to do it if you want to find recently added files:（再计算数据库。如果您想找到最近添加的文件，您需要这样做）

  `sudo updatedb`

## man

Format and display manual pages.（格式化和显示手册页）

- Display man page for a command:（显示命令的手册页）

  `man command`

- Display man page for a command from section 7:（显示来自第7节的命令的手册页）

  `man command.7`

- Display path searched for manpages:（搜索手册页的显示路径）

  `man --path`

- Display location of a manpage rather than the manpage itself:（显示手册页的位置，而不是手册页本身）

  `man -w command`

- Do a keyword search for manpages containing a search string:（对包含搜索字符串的手册页进行关键字搜索）

  `man -k keyword`

## tail

Display the last part of a file.（显示文件的最后一部分）

- Show last 'num' lines in file:（显示文件中最后的“num”行）

  `tail -n num file`

- Show all file since line 'num':（显示自行'num'以来的所有文件）

  `tail -n +num file`

- Show last 'num' bytes in file:（显示文件中最后的“num”字节）

  `tail -c num file`

- Keep reading file until `Ctrl + C`:（一直读取文件，直到Ctrl + C）

  `tail -f file`

- Keep reading file until `Ctrl + C`, even if the file is rotated:（即使文件被旋转，也要一直读到Ctrl + C）

  `tail -F file`

## less

Open a file for interactive reading, allowing scrolling and search.（打开一个文件进行交互式阅读，允许滚动和搜索）

- Open a file:（打开一个文件）

  `less source_file`

- Page down / up:

  `<Space> (down), b (up)`

- Go to end / start of file:

  `G (end), g (start)`

- Forward search for a string（向前搜索字符串）(press `n`/`N` to go to next/previous match):

  `/something`

- Backward search for a string（向后搜索字符串） (press `n`/`N` to go to next/previous match):

  `?something`

- Follow the output of the currently opened file:（跟随当前打开的文件的输出）

  `F`

- Open the current file in an editor:（在编辑器中打开当前文件）

  `v`

- Exit:

  `q`

## su

Switch shell to another user.（将shell切换到另一个用户）

- Switch to superuser (admin password required):（切换到超级用户(需要管理密码)）

  `su`

- Switch to user username (password required):（切换到用户名(需要密码)）

  `su username`

- Switch to user username and simulate a full login shell:（切换到user username并模拟完整的登录shell）

  `su - username`

## mysql

The MySQL command-line tool（MySQL命令行工具）. Homepage: <https://www.mysql.com/>.

- Connect to a database:

  `mysql database_name`

- Connect to a database, user will be prompted for a password（连接到数据库时，将提示用户输入密码）:

  `mysql -u user --password database_name`

- Connect to a database on another host（连接到另一台主机上的数据库）:

  `mysql -h database_host database_name`

- Connect to a database through a Unix socket（通过Unix套接字连接到数据库）:

  `mysql --socket path/to/socket.sock`

- Execute SQL statements in a script file (batch file)（在脚本文件(批处理文件)中执行SQL语句）:

  `mysql -e "source filename.sql" database_name`

## yum

## rpm

## ping

Send ICMP ECHO_REQUEST packets to network hosts.（向网络主机发送ICMP回声请求包）

- Ping host:

  `ping host`

- Ping a host only a specific number of times:（只Ping主机特定的次数）

  `ping -c count host`

- Ping host, specifying the interval in seconds between requests (default is 1 second):（Ping host，指定请求之间的间隔(默认为1秒)）

  `ping -i seconds host`

- Ping host without trying to lookup symbolic names for addresses:（Ping主机，而不尝试查找地址的符号名称）

  `ping -n host`

- Ping host and ring the bell when a packet is received (if your terminal supports it):（Ping主机并在收到包时按铃(如果您的终端支持)）

  `ping -a host`

- Also display a message if no response was received:（如果没有收到响应，还显示一条消息）

  `ping -O host`

## date

Set or display the system date.（设置或显示系统日期）

- Display the current date using the default locale's format:（使用默认区域设置的格式显示当前日期）

  `date +"%c"`

- Display the current date in UTC and ISO 8601 format:（以UTC和ISO 8601格式显示当前日期）

  `date -u +"%Y-%m-%dT%H:%M:%SZ"`

- Display the current date as a Unix timestamp (seconds since the Unix epoch):（将当前日期显示为Unix时间戳(从Unix纪元开始的秒)）

  `date +%s`

- Display a specific date (represented as a Unix timestamp) using the default format:（使用默认格式显示特定的日期(表示为Unix时间戳)）

  `date -d @1473305798`

- Convert a specific date to the Unix timestamp format:（将特定日期转换为Unix时间戳格式）

  `date -d "2018-09-01 00:00" +%s --utc`

## wget

Download files from the Web. Supports HTTP, HTTPS, and FTP.(从网上下载文件。支持HTTP、HTTPS和FTP)

- Download the contents of an URL to a file (named "foo" in this case):(将URL的内容下载到文件中(本例中文件名为“foo”))

  `wget https://example.com/foo`

- Download the contents of an URL to a file (named "bar" in this case):(将URL的内容下载到文件中(本例中文件名为“bar”))

  `wget -O bar https://example.com/foo`

- Download a single web page and all its resources with 3-second intervals between requests (scripts, stylesheets, images, etc.):（下载一个web页面及其所有资源，请求之间间隔3秒(脚本、样式表、图像等)。）

  `wget --page-requisites --convert-links --wait=3 https://example.com/somepage.html`

- Download all listed files within a directory and its sub-directories (does not download embedded page elements):（下载目录及其子目录中列出的所有文件(不下载嵌入的页面元素）

  `wget --mirror --no-parent https://example.com/somepath/`

- Limit the download speed and the number of connection retries:（限制下载速度和连接重试次数）

  `wget --limit-rate=300k --tries=100 https://example.com/somepath/`

- Download a file from an HTTP server using Basic Auth (also works for FTP):（使用Basic Auth(也适用于FTP)从HTTP服务器下载文件）

  `wget --user=username --password=password https://example.com`

- Continue an incomplete download:（继续未完成的下载）

  `wget -c https://example.com`

- Download all URLs stored in a text file to a specific directory:（将存储在文本文件中的所有url下载到特定目录）

  `wget -P path/to/directory -i URLs.txt`

## notify-send

Uses the current desktop environment's notification system to create a notification.（使用当前桌面环境的通知系统创建通知）

- Show a notification with the title "Test" and the content "This is a test":（显示标题为“Test”和内容为“This is a Test”的通知）

  `notify-send "Test" "This is a test"`

- Show a notification with a custom icon:（显示带有自定义图标的通知）

  `notify-send -i icon.png "Test" "This is a test"`

- Show a notification for 5 seconds:（显示通知5秒）

  `notify-send -t 5000 "Test" "This is a test"`

## read

BASH builtin for retrieving data from standard input.（BASH内置用于从标准输入检索数据）

- Store data that you type from the keyboard:（存储您从键盘上键入的数据）

  `read variable`

- Store each of the next lines you enter as values of an array:（将您输入的下一行存储为数组的值）

  `read -a array`

- Enable backspace and GNU readline hotkeys when entering input with read:（使用read输入时启用backspace和GNU readline热键）

  `read -e variable`

- Specify the number of maximum characters to be read:（指定要读取的最大字符数）

  `read -n character_count variable`

- Use a specific character as a delimiter instead of a new line:（使用特定字符作为分隔符，而不是新行）

  `read -d new_delimiter variable`

- Do not let backslash (\) act as an escape character:（不要让反斜杠(\)作为转义字符）

  `read -r variable`

- Display a prompt before the input:（在输入之前显示提示）

  `read -p "Enter your input here: " variable`

- Do not echo typed characters (silent mode):（不要重复输入字符(静默模式)）

  `read -s variable`


## xargs

Execute a command with piped arguments coming from another command, a file, etc.（使用来自另一个命令、文件等的管道参数执行命令）
The input is treated as a single block of text and split into separate arguments on spaces, tabs, newlines and end-of-file.（ 输入被视为一个单独的文本块，并在空格、制表符、换行符和文件末尾被分割成单独的参数。）

- Main usage pattern:（主要使用模式）

  `arguments_source | xargs command`

- Delete all files with a `.backup` extension（删除后缀是`.backup`的所有文件）. `-print0` on find uses a null character to split the files, and `-0` changes the delimiter to the null character (useful if there's whitespace in filenames):（find上的' -print0 '使用一个空字符来分割文件，' -0 '将分隔符更改为空字符(如果文件名中有空格，这很有用)）

  `find . -name '*.backup' -print0 | xargs -0 rm -v`

- Execute the command once for each input line, replacing any occurrences of the placeholder (here marked as `_`) with the input line:（ 对每个输入行执行该命令一次，用输入行替换任何出现的占位符(此处标记为'_')）

  `arguments_source | xargs -I _ command _ optional_extra_arguments`

- Parallel runs of up to `max-procs` processes at a time; the default is 1. If `max-procs` is 0, xargs will run as many processes as possible at a time:（一次并行运行最多“max-procs”进程;默认值是1。如果“max-procs”为0,xargs将一次运行尽可能多的进程）

  `arguments_source | xargs -P max-procs command`




## vim

Vi IMproved, a programmer's text editor, provides several modes for different kinds of text manipulation.（一个程序员的文本编辑器，为不同类型的文本操作提供了几种模式）

Pressing `i` enters edit mode. `<Esc>` goes back to normal mode, which doesn't allow regular text insertion.（按“i”进入编辑模式。' <Esc> '返回正常模式，不允许常规文本插入）

- Open a file:（打开一个文件）

  `vim file`

- Enter text editing mode (insert mode):（进入文本编辑模式(插入模式)）

  `<Esc>i`

- Copy ("yank") or cut ("delete") the current line (paste it with `P`):（复制或者剪切当前行(用“P”粘贴)）

  `<Esc>yy|dd`

- Undo the last operation:（撤销最后的操作）

  `<Esc>u`

- Search for a pattern in the file (press `n`/`N` to go to next/previous match):（在文件中搜索模式）

  `<Esc>/search_pattern<Enter>`

- Perform a regex substitution in the whole file:（在整个文件中执行正则替换）

  `<Esc>:%s/pattern/replacement/g<Enter>`

- Save (write) the file, and quit:（保存（写入）文件，然后退出）

  `<Esc>:wq<Enter>`

- Quit without saving:（不保存退出）

  `<Esc>:q!<Enter>`
