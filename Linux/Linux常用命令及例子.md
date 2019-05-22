<!-- GFM-TOC -->
* [文件管理](#文件管理)
* [文件传输](#文件传输)
* [文本处理](#文本处理)
* [备份压缩](#备份压缩)
* [系统管理](#系统管理)
* [系统设置](#系统设置)
* [网络通讯](#网络通讯)
* [磁盘管理](#磁盘管理)
* [磁盘维护](#磁盘维护)
* [设备管理](#设备管理)
* [电子邮件与新闻组](#电子邮件与新闻组)
* [其他命令](#其他命令)
<!-- GFM-TOC -->

# 文件管理

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

## diffstat

Create a histogram from the output of the `diff` command.(从' diff '命令的输出创建一个直方图)

- Display changes in a histogram:(以柱状图显示更改)

  `diff file1 file2 | diffstat`

- Display inserted, deleted and modified changes as a table:(以表的形式显示插入、删除和修改的更改)

  `diff file1 file2 | diffstat -t`

## file

Determine file type.(确定文件类型)

- Give a description of the type of the specified file. Works fine for files with no file extension:(描述指定文件的类型。适用于没有文件扩展名的文件)

  `file filename`

- Look inside a zipped file and determine the file type(s) inside:(查看压缩文件的内部，并确定其中的文件类型)

  `file -z foo.zip`

- Allow file to work with special or device files:(允许文件处理特殊文件或设备文件)

  `file -s filename`

- Don't stop at first file type match; keep going until the end of the file:(不要在第一个文件类型匹配时停止;一直读到文件末尾)

  `file -k filename`

- Determine the mime encoding type of a file:(确定文件的mime编码类型)

  `file -i filename`

## find

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

## git

Distributed version control system.(分布式版本控制系统)
Homepage: <https://git-scm.com/>.

- Check the Git version:(检查Git版本)

  `git --version`

- Call general help:(调用通用帮助)

  `git --help`

- Call help on a command:(用命令呼叫帮助)

  `git help command`

- Execute Git command:(执行Git命令)

  `git command`

## ln

Creates links to files and directories.(创建指向文件和目录的链接)

- Create a symbolic link to a file or directory:(创建到文件或目录的符号链接)

  `ln -s path/to/file_or_directory path/to/symlink`

- Overwrite an existing symbolic to point to a different file:(覆盖现有符号以指向另一个文件)

  `ln -sf path/to/new_file path/to/symlink`

- Create a hard link to a file:(创建到文件的硬链接)

  `ln path/to/file path/to/hardlink`

## locate

Find filenames quickly.（快速找到文件名）

- Look for pattern in the database. Note: the database is recomputed periodically (usually weekly or daily):（在数据库中查找模式。注:数据库定期重新计算(通常每周或每天)）

  `locate pattern`

- Look for a file by its exact filename (a pattern containing no globbing characters is interpreted as `*pattern*`):（据文件名查找文件(不包含通配符的模式被解释为“*pattern*”)）

  `locate */filename`

- Recompute the database. You need to do it if you want to find recently added files:（再计算数据库。如果您想找到最近添加的文件，您需要这样做）

  `sudo updatedb`

## lsattr

List file attributes on a Linux file system.(列出Linux文件系统上的文件属性)

- Display the attributes of the files in the current directory:(显示当前目录中文件的属性)

  `lsattr`

- List the attributes of files in a particular path:(列出特定路径中文件的属性)

  `lsattr path`

- List file attributes recursively in the current and subsequent directories:(递归地列出当前和后续目录中的文件属性)

  `lsattr -R`

- Show attributes of all the files in the current directory, including hidden ones:(显示当前目录中所有文件的属性，包括隐藏的文件)

  `lsattr -a`

- Display attributes of directories in the current directory:(显示当前目录中目录的属性)

  `lsattr -d`

## mc

Midnight Commander, a terminal based file manager.(午夜指挥官，一个基于终端的文件管理器)
Navigate the directory structure using the arrow keys, the mouse or by typing the commands into the terminal.(使用方向键、鼠标或在终端中键入命令来导航目录结构)

- Start mc:(开始mc)

  `mc`

- Start in black and white:(从白纸黑字开始)

  `mc -b`

## mktemp

Create a temporary file or directory.(创建一个临时文件或目录)

- Create an empty temporary file and return the absolute path to it:(创建一个空的临时文件并返回它的绝对路径)

  `mktemp`

- Create a temporary directory and return the absolute path to it:(创建一个临时目录并返回它的绝对路径)

  `mktemp -d`

- Create a temporary file with a specified suffix:(创建具有指定后缀的临时文件)

  `mktemp --suffix ".txt"`

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

## od

Display file contents in octal, decimal or hexadecimal format.（以八进制、十进制或十六进制格式显示文件内容）
Optionally display the byte offsets and/or printable representation for each line.（（可选）显示每行的字节偏移和/或可打印表示）

- Display file using default settings: octal format, 8 bytes per line, byte offsets in octal, and duplicate lines replaced with `*`:（使用默认设置显示文件：八进制格式，每行8个字节，八进制字节偏移，重复行替换为`*`）

  `od path/to/file`

- Display file in verbose mode, i.e. without replacing duplicate lines with `*`:（以详细模式显示文件，即不替换重复的行）

  `od -v path/to/file`

- Display file in hexadecimal format (2-byte units), with byte offsets in decimal format:（以十六进制格式(2字节单位)显示文件，并以十进制格式显示字节偏移量）

  `od --format=x --address-radix=d -v path/to/file`

- Display file in hexadecimal format (1-byte units), and 4 bytes per line:（以十六进制格式(1字节单位)显示文件，每行4个字节）

  `od --format=x1 --width=4 -v path/to/file`

- Display file in hexadecimal format along with its character representation, and do not print byte offsets:（以十六进制格式显示文件及其字符表示形式，并且不打印字节偏移量）

  `od --format=xz --address-radix=n -v path/to/file`

- Read only 100 bytes of a file starting from the 500th byte:（从第500个字节开始，只读取文件的100个字节）

  `od --read-bytes 100 --skip-bytes=500 -v path/to/file`

## paste

Merge lines of files.(合并文件行)

- Join all the lines into a single line, using TAB as delimiter:(使用TAB作为分隔符将所有行连接成一行)

  `paste -s file`

- Join all the lines into a single line, using the specified delimiter:(使用指定的分隔符将所有行连接成一行)

  `paste -s -d delimiter file`

- Merge two files side by side, each in its column, using TAB as delimiter:(使用TAB作为分隔符并排合并两个文件，每个文件在其列中)

  `paste file1 file2`

- Merge two files side by side, each in its column, using the specified delimiter:(使用指定的分隔符并排合并两个文件，每个文件位于其列中)

  `paste -d delimiter file1 file2`

- Merge two files, with lines added alternatively:(合并两个文件，交替添加行)

  `paste -d '\n' file1 file2`

## patch

Patch a file (or files) with a diff file.(用diff文件修补一个或多个文件)
Note that diff files contain both the target filenames and list of changes.(注意，diff文件同时包含目标文件名和更改列表)

- Apply a patch:(应用一个补丁)

  `patch < patch_file.diff`

- Apply a patch to current directory:(将补丁应用于当前目录)

  `patch -p1 < patch_file.diff`

- Apply the reverse of a patch:(应用补丁的反面)

  `patch -R < patch_file.diff`

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

## split

Split a file into pieces.(将文件分割成多个部分)

- Split a file, each split having 10 lines (except the last split):(分割一个文件，每个分割有10行(除了最后一个分割))

  `split -l 10 filename`

- Split a file into 5 files. File is split such that each split has same size (except the last split):(将一个文件分成5个文件。文件被分割，每个分割具有相同的大小(除了最后一个分割))

  `split -n 5 filename`

- Split a file with 512 bytes in each split (except the last split; use 512k for kilobytes and 512m for megabytes):(分割一个文件，每次分割512字节(最后一次分割除外;千字节使用512k，兆字节使用512m))

  `split -b 512 filename`

- Split a file with at most 512 bytes in each split without breaking lines:(在不断行的情况下，分割每个文件，每个文件最多512字节)

  `split -C 512 filename`

## tee

Read from standard input and write to standard output and files (or commands).(从标准输入读取并写入标准输出和文件(或命令))

- Copy standard input to each FILE, and also to standard output:(将标准输入复制到每个文件，也复制到标准输出)

  `echo "example" | tee FILE`

- Append to the given FILEs, do not overwrite:(附加到给定的文件，不要覆盖)

  `echo "example" | tee -a FILE`

- Print standard input to the terminal, and also pipe it into another program for further processing:(将标准输入打印到终端，并将其导入另一个程序进行进一步处理)

  `echo "example" | tee /dev/tty | xargs printf "[%s]"`

- Create a directory called "example", count the number of characters in "example" and write "example" to the terminal:(创建一个名为“example”的目录，计算“example”中的字符数，并将“example”写入终端)

  `echo "example" | tee >(xargs mkdir) >(wc -c)`

## touch

Change a file access and modification times (atime, mtime).(更改文件访问和修改时间(atime, mtime))

- Create a new empty file(s) or change the times for existing file(s) to current time:(创建一个新的空文件或将现有文件的时间更改为当前时间)

  `touch filename`

- Set the times on a file to a specific date and time:(将文件上的时间设置为特定的日期和时间)

  `touch -t YYYYMMDDHHMM.SS filename`

- Use the times from a file to set the times on a second file:(使用文件中的时间设置第二个文件上的时间)

  `touch -r filename filename2`

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

## umask

Manage the read/write/execute permissions that are masked out (i.e. restricted) for newly created files by the user.（
管理用户为新创建的文件屏蔽（即限制）的读/写/执行权限）

- Display the current mask in octal notation:（以八进制符号显示当前掩码）

  `umask`

- Display the current mask in symbolic (human-readable) mode:（以符号(人类可读)模式显示当前掩码）

  `umask -S`

- Change the mask symbolically to allow read permission for all users (the rest of the mask bits are unchanged):（象征性地更改掩码，以允许所有用户都具有读权限(掩码的其余位不变)）

  `umask a+r`

- Set the mask (using octal) to restrict no permissions for the file's owner, and restrict all permissions for everyone else:（设置掩码(使用八进制)来限制文件所有者的任何权限，并限制其他人的所有权限）

  `umask 077`

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

## which

Locate a program in the user's path.(在用户路径中定位程序)

- Search the PATH environment variable and display the location of any matching executables:(搜索PATH环境变量并显示任何匹配的可执行程序的位置)

  `which executable`

- If there are multiple executables which match, display all:(如果有多个可执行程序匹配，则显示全部)

  `which -a executable`

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

## chattr

Change attributes of files or directories.(更改文件或目录的属性)

- Make a file or directory immutable to changes and deletion, even by superuser:(使文件或目录对更改和删除不可变，即使是超级用户)

  `chattr +i path/to/file_or_directory`

- Make a file or directory mutable:(使文件或目录可变)

  `chattr -i path/to/file_or_directory`

- Recursively make an entire directory and contents immutable:(递归地使整个目录和内容不可变)

  `chattr -R +i path/to/directory`

## chgrp

Change group ownership of files and directories.(更改文件和目录的组所有权)

- Change the owner group of a file/directory:(更改文件/目录的所有者组)

  `chgrp group path/to/file_or_directory`

- Recursively change the owner group of a directory and its contents:(递归地更改目录的所有者组及其内容)

  `chgrp -R group path/to/directory`

- Change the owner group of a symbolic link:(更改符号链接的所有者组)

  `chgrp -h group path/to/symlink`

- Change the owner group of a file/directory to match a reference file:(更改文件/目录的所有者组以匹配参考文件)

  `chgrp --reference=path/to/reference_file path/to/file_or_directory`

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

## cksum

Calculates CRC checksums and byte counts of a file.(计算文件的CRC校验和和字节数)
Note, on old UNIX systems the CRC implementation may differ.(注意，在旧的UNIX系统上，CRC实现可能有所不同)

- Display a 32 bit checksum, size in bytes and filename:(显示一个32位校验和，大小以字节和文件名表示)

  `cksum filename`

## cmp

Compare two files.(比较两个文件)

- Find the byte number and line number of the first difference between the files:(查找文件之间第一个差异的字节号和行号)

  `cmp file1 file2`

- Find the byte number and differing bytes of every difference:(找出每个差异的字节数和不同字节)

  `cmp -l file1 file2`

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

## cut

Cut out fields from STDIN or files.(从STDIN或文件中删除字段)

- Cut out the first sixteen characters of each line of STDIN:(剪掉每一行的前16个字符)

  `cut -c 1-16`

- Cut out the first sixteen characters of each line of the given files:(删除给定文件每行的前16个字符)

  `cut -c 1-16 file`

- Cut out everything from the 3rd character to the end of each line:(把从第三个字符到每行末尾的所有内容都剪掉)

  `cut -c 3-`

- Cut out the fifth field of each line, using a colon as a field delimiter (default delimiter is tab):(使用冒号作为字段分隔符(默认分隔符是tab)，删除每行中的第5个字段)

  `cut -d':' -f5`

- Cut out the 2nd and 10th fields of each line, using a semicolon as a delimiter:(使用分号作为分隔符，删除每一行的第2和第10个字段)

  `cut -d';' -f2,10`

- Cut out the fields 3 through to the end of each line, using a space as a delimiter:(使用空格作为分隔符，将字段3切到每一行的末尾)

  `cut -d' ' -f3-`




# 文件传输

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

## scp

Secure copy.Copy files between hosts using Secure Copy Protocol over SSH.(安全的副本。使用SSH上的安全复制协议在主机之间复制文件。)

- Copy a local file to a remote host:(将本地文件复制到远程主机)

  `scp path/to/local_file remote_host:path/to/remote_file`

- Copy a file from a remote host to a local directory:(将文件从远程主机复制到本地目录)

  `scp remote_host:path/to/remote_file path/to/local_directory`

- Recursively copy the contents of a directory from a remote host to a local directory:(递归地将目录的内容从远程主机复制到本地目录)

  `scp -r remote_host:path/to/remote_directory path/to/local_directory`

- Copy a file between two remote hosts transferring through the local host:(复制通过本地主机传输的两个远程主机之间的文件)

  `scp -3 host1:path/to/remote_file host2:path/to/remote_directory`

- Use a specific username when connecting to the remote host:(在连接到远程主机时使用特定的用户名)

  `scp path/to/local_file remote_username@remote_host:path/to/remote_directory`

- Use a specific ssh private key for authentication with the remote host:(使用特定的ssh私钥与远程主机进行身份验证)

  `scp -i ~/.ssh/private_key local_file remote_host:/path/remote_file`

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


# 文本处理

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

## ack

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

## comm

Select or reject lines common to two files. Both files must be sorted.(选择或抛弃两个文件共有的行。两个文件都必须排序)

- Produce three tab-separated columns: lines only in first file, lines only in second file and common lines:(生成三个制表符分隔的列:第一个文件中的行、第二个文件中的行和公共行)

  `comm file1 file2`

- Print only lines common to both files:(只打印两个文件共有的行)

  `comm -12 file1 file2`

- Print only lines common to both files, reading one file from stdin:(只打印两个文件共有的行，从stdin中读取一个文件)

  `cat file1 | comm -12 - file2`

- Get lines only found in first file, saving the result to a third file:(获取只在第一个文件中找到的行，将结果保存到第三个文件中)

  `comm -23 file1 file2 > file1_only`

- Print lines only found in second file, when the files aren't sorted:(当文件未排序时，只在第二个文件中找到打印行)

  `comm -13 <(sort file1) <(sort file2)`

## csplit

Split a file into pieces.(将文件分割成多个部分)
This generates files named "xx00", "xx01", and so on.（这将生成名为“xx00”、“xx01”等文件）

- Split a file at lines 5 and 23:(在第5行和第23行拆分一个文件)

  `csplit file 5 23`

- Split a file every 5 lines (this will fail if the total number of lines is not divisible by 5):(每5行分割一个文件(如果总行数不能被5整除，则此操作将失败))

  `csplit file 5 {*}`

- Split a file every 5 lines, ignoring exact-division error:(每5行分割一个文件，忽略精确的分割错误)

  `csplit -k file 5 {*}`

- Split a file at line 5 and use a custom prefix for the output files:(在第5行拆分一个文件，并为输出文件使用自定义前缀)

  `csplit file 5 -f prefix`

- Split a file at a line matching a regular expression:（在匹配正则表达式的行上拆分文件）

  `csplit file /regex/`

## ed

The original Unix text editor.(原来的Unix文本编辑器)

- Start ed, editing an empty document (which can be saved as a new file in the current directory):(启动ed，编辑一个空文档(可以将其保存为当前目录中的新文件))

  `ed`

- Start ed, editing an empty document, with `:` as a command prompt indicator:(启动ed，编辑一个空文档，使用':'作为命令提示符指示器)

  `ed -p :`

- Start ed editing an existing file (this shows the byte count of the loaded file):（启动ed编辑现有文件(这显示加载文件的字节数)）

  `ed -p : path/to/file`

- Toggle the printing of error explanations. (By default, explanations are not printed and only a `?` appears):（切换打印错误解释。(默认情况下，解释不会打印出来，只有一个“？”显示）

  `H`

- Add text to the current document. Mark completion by entering a period by itself in a new line:（向当前文档添加文本。在新行中单独输入一个句号来标记完成）

  `a<Enter>text_to_insert<Enter>.`

- Print the entire document (`,` is a shortcut to the range `1,$` which covers the start to the end of the document):（打印整个文档（`，`是范围`1，$`的快捷方式，它涵盖了文档的开头到结尾））

  `,p`

- Write the current document to a new file (the filename can be omitted if `ed` was called with an existing file):（将当前文档写入新文件（如果使用现有文件调用`ed`，则可以省略文件名））

  `w filename`

- Quit ed:（退出）

  `q`

## fmt

Reformat a text file by joining its paragraphs and limiting the line width to given number of characters (75 by default).(将文本文件的段落连接起来，并将行宽限制为给定的字符数(默认为75个)，从而重新格式化文本文件)

- Reformat a file:(格式化一个文件)

  `fmt path/to/file`

- Reformat a file producing output lines of (at most) `n` characters:(重新格式化生成(最多)输出行的文件“n”字符)

  `fmt -w n path/to/file`

- Reformat a file without joining lines shorter than the given width together:（重新格式化文件，但不要将小于给定宽度的行连接在一起）

  `fmt -s path/to/file`

- Reformat a file with uniform spacing (1 space between words and 2 spaces between paragraphs):（重新格式化一个具有统一间距的文件(单词之间有1个空格，段落之间有2个空格)）

  `fmt -u path/to/file`

## fold

Wraps each line in an input file to fit a specified width and prints it to the standard output.(将每一行封装在输入文件中以适应指定的宽度，并将其打印到标准输出中)

- Wrap each line to default width (80 characters):(将每行换行到默认宽度(80个字符))

  `fold file`

- Wrap each line to width "30":(将每一行的宽度包起来“30”)

  `fold -w30 file`

- Wrap each line to width "5" and break the line at spaces (puts each space separated word in a new line, words with length > 5 are wrapped):(将每一行的宽度“5”换行，并在空格处换行(将每个空格分隔的单词换行，换行时将长度为> 5的单词换行))

  `fold -w5 -s file`

## grep

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

## join

Join lines of two sorted files on a common field.（在一个公共字段上联接两个排序文件的行）

- Join two files on the first (default) field:（在第一个(默认)字段上联接两个文件）

  `join file1 file2`

- Join field3 of file1 with field1 of file2:（将file1的field3与file2的field1连接起来）

  `join -1 3 -2 1 file1 file2`

- Produce a line for each unpairable line for file1:（为file1的每条不匹配的线生成一条线）

  `join -a 1 file1 file2`

## look

Look for lines in sorted file.(在已排序的文件中查找行)

- Look for lines which begins with the given prefix:(查找以给定前缀开头的行)

  `look prefix file`

- Look for lines ignoring case:(寻找忽略大小写的行)

  `look -f prefix file`

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

## sed

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

## tr

Translate characters: run replacements based on single characters and character sets.（翻译字符:基于单个字符和字符集运行替换）

- Replace all occurrences of a character in a file, and print the result:(替换文件中出现的所有字符，并打印结果)

  `tr find_character replace_character < filename`

- Replace all occurrences of a character from another command's output:(替换其他命令输出中出现的所有字符)

  `echo text | tr find_character replace_character`

- Map each character of the first set to the corresponding character of the second set:(将第一个集合的每个字符映射到第二个集合的对应字符)

  `tr 'abcd' 'jkmn' < filename`

- Delete all occurrences of the specified set of characters from the input:（从输入中删除指定字符集的所有匹配项）

  `tr -d 'input_characters' < filename`

- Compress a series of identical characters to a single character:（将一系列相同的字符压缩为一个字符）

  `tr -s 'input_characters' < filename`

- Translate the contents of a file to upper-case:(将文件内容转换为大写)

  `tr "[:lower:]" "[:upper:]" < filename`

- Strip out non-printable characters from a file:(从文件中删除不可打印的字符)

  `tr -cd "[:print:]" < filename`

## uniq

Output the unique lines from the given input or file.(从给定的输入或文件中输出唯一的行)
Since it does not detect repeated lines unless they are adjacent, we need to sort them first.(因为它不会检测重复的行，除非它们是相邻的，所以我们需要首先对它们进行排序)

- Display each line once:（每一行显示一次）

  `sort file | uniq`

- Display only unique lines:（只显示唯一的行）

  `sort file | uniq -u`

- Display only duplicate lines:(只显示重复的行)

  `sort file | uniq -d`

- Display number of occurrences of each line along with that line:(显示每一行的出现次数)

  `sort file | uniq -c`

- Display number of occurrences of each line, sorted by the most frequent:(显示每行出现的次数，按最频繁的次数排序)

  `sort file | uniq -c | sort -nr`

## vim

Vi IMproved, a programmer's text editor, provides several modes for different kinds of text manipulation.（一个程序员的文本编辑器，为不同类型的文本操作提供了几种模式）

Pressing `i` enters edit mode. `<Esc>` goes back to normal mode, which doesn't allow regular text insertion.（按`i`进入编辑模式。`<Esc>`返回正常模式，不允许常规文本插入）

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

## wc

Count words, bytes, or lines.(计算单词、字节或行数)

- Count lines in file:（计算文件中的行数）

  `wc -l file`

- Count words in file:（计算文件中的单词）

  `wc -w file`

- Count characters (bytes) in file:（计算文件中的字符(字节)）

  `wc -c file`

- Count characters in file (taking multi-byte character sets into account):（计算文件中的字符数(考虑到多字节字符集)）

  `wc -m file`

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




# 备份压缩

## ar

Create, modify, and extract from archives (.a, .so, .o).(创建、修改和从归档)

- Extract all members from an archive:(从存档中提取所有成员)

  `ar -x libfoo.a`

- List the members of an archive:(列出存档的成员)

  `ar -t libfoo.a`

- Replace or add files to an archive:(替换或向存档文件添加文件)

  `ar -r libfoo.a foo.o bar.o baz.o`

- Insert an object file index (equivalent to using `ranlib`):(插入目标文件索引(相当于使用“ranlib”))

  `ar -s libfoo.a`

- Create an archive with files and an accompanying object file index:(创建一个包含文件和附带对象文件索引的归档文件)

  `ar -rs libfoo.a foo.o bar.o baz.o`

## bzip2

A block-sorting file compressor(块排序文件压缩器).

- Compress file(压缩文件):

  `bzip2 path/to/file_to_compress`

- Decompress file(解压缩文件):

  `bzip2 -d path/to/compressed_file.bz2`

- Decompress to console(解压到控制台):

  `bzip2 -dc path/to/compressed_file.bz2`

## cpio

Copies files in and out of archives.(在档案中或档案外复制文件)
Supports the following archive formats: cpio's custom binary, old ASCII, new ASCII, crc, HPUX binary, HPUX old ASCII, old tar, and POSIX.1 tar.(支持以下存档格式:cpio的自定义二进制、旧ASCII、新ASCII、crc、HPUX二进制、HPUX旧ASCII、旧tar和POSIX.1 tar)

- Take a list of file names from standard input and add them [o]nto an archive in cpio's binary format:(从标准输入中获取文件名列表，并将它们以cpio的二进制格式添加到存档中)

  `echo "file1 file2 file3" | cpio -o > archive.cpio`

- Copy all files and directories in a directory and add them [o]nto an archive, in [v]erbose mode:(复制目录中的所有文件和目录，并将它们添加到归档文件的inverbose模式中)

  `find path/to/directory | cpio -ov > archive.cpio`

- P[i]ck all files from an archive, generating [d]irectories where needed, in [v]erbose mode:(从存档中选择所有文件，在需要的地方生成目录inverbose模式)

  `cpio -idv < archive.cpio`

## gunzip

Extract file(s) from a gzip (.gz) archive.(从gzip (.gz)存档文件中提取文件)

- Extract a file from an archive, replacing the original file if it exists:(从归档文件中提取一个文件，如果原始文件存在，则替换它)

  `gunzip archive.tar.gz`

- Extract a file to a target destination:(将文件解压缩到目标目的地)

  `gunzip -c archive.tar.gz > archive.tar`

- List the contents of a compressed file:(列出压缩文件的内容)

  `gunzip -l file.txt.gz`

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


# 系统管理

## adduser

User addition utility.（用户添加工具）

- Create a new user with a default home directory and prompt the user to set a password:（创建一个具有默认主目录的新用户，并提示用户设置密码）

  `adduser username`

- Create a new user without a home directory:（创建没有主目录的新用户）

  `adduser --no-create-home username`

- Create a new user with a home directory at the specified path:（使用指定路径上的主目录创建一个新用户）

  `adduser --home path/to/home username`

- Create a new user with the specified shell set as the login shell:（创建一个新用户，并将指定的shell设置为登录shell）

  `adduser --shell path/to/shell username`

- Create a new user belonging to the specified group:（创建属于指定组的新用户）

  `adduser --ingroup group username`

## chfn

Update `finger` info for a user.（为用户更新“手指”信息）

- Update a user's "Name" field in the output of `finger`:（在“finger”的输出中更新用户的“Name”字段）

  `chfn -f new_display_name username`

- Update a user's "Office Room Number" field for the output of `finger`:（为“finger”的输出更新用户的“Office Room Number”字段）

  `chfn -o new_office_room_number username`

- Update a user's "Office Phone Number" field for the output of `finger`:（为“finger”的输出更新用户的“Office Phone Number”字段）

  `chfn -p new_office_telephone_number username`

- Update a user's "Home Phone Number" field for the output of `finger`:（更新用户的“家庭电话号码”字段，以输出“finger”）

  `chfn -h new_home_telephone_number username`

## chsh

Change user's login shell.（更改用户的登录shell）

- Change shell:（改变shell）

  chsh -s path/to/shell_binary username

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

## exit

Quit the current CMD instance or the current batch file.(退出当前CMD实例或当前批处理文件)

- Quit the current CMD instance:(退出当前CMD实例)

  `exit`

- Quit the current batch script:(退出当前的批处理脚本)

  `exit /b`

- Quit using a specific exit code:(使用特定的退出代码退出)

  `exit exit_code`

## finger

User information lookup program.(用户信息查找程序)

- Display information about currently logged in users:(显示当前登录用户的信息)

  `finger`

- Display information about a specific user:(显示特定用户的信息)

  `finger username`

- Display the user's login name, real name, terminal name, and other information:(显示用户的登录名、实名、终端名等信息)

  `finger -s`

- Produce multi-line output format displaying same information as `-s` as well as user's home directory, home phone number, login shell, mail status, etc.:(生成多行输出格式，显示与“-s”相同的信息，以及用户的主目录、主电话号码、登录shell、邮件状态等。)

  `finger -l`

- Prevent matching against user's names and only use login names:(防止与用户名匹配，只使用登录名)

  `finger -m`

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

## groupdel

Delete existing user groups from the system.(从系统中删除现有的用户组)

- Delete an existing group:(删除现有组)

  `groupdel group_name`

## groupmod

Modify existing user groups in the system.(修改系统中现有的用户组)

- Change the group name:(更改组名称)

  `groupmod -n new_group_name old_group_name`

- Change the group id:(更改组id)

  `groupmod -g new_group_id old_group_name`

## halt

Power off or reboot the machine.(关机或重启机器)

- Power the machine off:(把机器关掉)

  `halt`

- Reboot the machine:(重新启动机器)

  `halt --reboot`

## id

Display current user and group identity.(显示当前用户和组标识)

- Display current user's id (UID), group id (GID) and groups to which they belong:(显示当前用户id (UID)、组id (GID)和它们所属的组)

  `id`

- Display the current user identity as a number:(将当前用户标识显示为数字)

  `id -u`

- Display the current group identity as a number:(将当前组标识显示为数字)

  `id -g`

- Display an arbitrary user's id (UID), group id (GID) and groups to which they belong:(显示任意用户的id (UID)、组id (GID)和它们所属的组)

  `id username`

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

## last

View the last logged in users.(查看最近登录的用户)

- View last logins, their duration and other information as read from /var/log/wtmp:(查看上次登录，其持续时间以及从/ var / log / wtmp中读取的其他信息)

  `last`

- Specify how many of the last logins to show:(指定要显示的最后登录次数)

  `last -n login_count`

- Print the full date and time for entries and then display the hostname column last to prevent truncation:(打印条目的完整日期和时间，然后显示主机名列last，以防止截断)

  `last -F -a`

- View all logins by a specific user and show the ip address instead of the hostname:(查看特定用户的所有登录，并显示ip地址而不是主机名)

  `last user_name -i`

- View all recorded reboots (i.e., the last logins of the pseudo user "reboot"):(查看所有记录的重新引导(即。，伪用户“重启”的最后一次登录))

  `last reboot`

- View all recorded shutdowns (i.e., the last logins of the pseudo user "shutdown"):(查看所有已记录的关机(即，伪用户“shutdown”的最后一次登录))

  `last shutdown`

## lastb

Show a listing of last logged in users.(显示最后登录用户的列表)

- Show a list of all last logged in users:(显示所有最后登录用户的列表)

  `sudo lastb`

- Show a list of all last logged in users since a given time:(显示自给定时间以来所有上次登录用户的列表)

  `sudo lastb --since YYYY-MM-DD`

- Show a list of all last logged in users until a given time:(显示在给定时间之前所有最后登录用户的列表)

  `sudo lastb --until YYYY-MM-DD`

- Show a list of all logged in users at a specific time:(显示在特定时间登录的所有用户的列表)

  `sudo lastb --present hh:mm`

- Show a list of all last logged in users and translate the IP into a hostname:(显示所有最后登录用户的列表，并将IP转换为主机名)

  `sudo lastb --dns`

## logname

Shows the user's login name.(显示用户的登录名)

- Display the currently logged in user's name:(显示当前登录的用户名)

  `logname`

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

## newgrp

Switch primary group membership.(切换主组成员)

- Change user's primary group membership:(更改用户的主组成员)

  `newgrp group_name`

- Reset primary group membership to user's default group in /etc/passwd:(将主要组成员身份重置为/etc/passwd中用户的默认组)

  `newgrp`

## nice

Execute a program with a custom scheduling priority (niceness).(执行具有自定义调度优先级(niceness)的程序)
Niceness values range from -20 (the highest priority) to 19 (the lowest).(Niceness值范围从-20(最高优先级)到19(最低优先级))

- Launch a program with altered priority:(启动一个优先级改变的程序)

  `nice -n niceness_value command`

## notify-send

Uses the current desktop environment's notification system to create a notification.（使用当前桌面环境的通知系统创建通知）

- Show a notification with the title "Test" and the content "This is a test":（显示标题为“Test”和内容为“This is a Test”的通知）

  `notify-send "Test" "This is a test"`

- Show a notification with a custom icon:（显示带有自定义图标的通知）

  `notify-send -i icon.png "Test" "This is a test"`

- Show a notification for 5 seconds:（显示通知5秒）

  `notify-send -t 5000 "Test" "This is a test"`

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

## pstree

A convenient tool to show running processes as a tree.(一个方便的工具，以树的形式显示正在运行的进程)

- Display a tree of processes:(显示进程树)

  `pstree`

- Display a tree of processes with PIDs:(显示带有pid的进程树)

  `pstree -p`

- Display all process trees rooted at processes owned by specified user:(显示位于指定用户拥有的进程上的所有进程树)

  `pstree user`

## reboot

Reboot the system.(重新启动系统)

- Reboot immediately:(立即重新启动)

  `reboot`

- Reboot immediately without gracefully shutdown:(立即重启，而不是优雅地关闭)

  `reboot -f`

## renice

Alters the scheduling priority/nicenesses of one or more running processes.(改变一个或多个正在运行的进程的调度优先级/好处)
Niceness values range from -20 (most favorable to the process) to 19 (least favorable to the process).(良好值范围从-20（最有利于过程）到19（最不利于过程）)

- Change priority of a running process:(更改正在运行的进程的优先级)

  `renice -n niceness_value -p pid`

- Change priority of all processes owned by a user:(更改用户拥有的所有进程的优先级)

  `renice -n niceness_value -u user`

- Change priority of all processes that belong to a process group:(更改属于流程组的所有流程的优先级)

  `renice -n niceness_value --pgrp process_group`

## screen

Hold a session open on a remote server. Manage multiple windows with a single SSH connection.(在远程服务器上保持打开的会话。使用一个SSH连接管理多个窗口)

- Start a new screen session:(启动一个新的屏幕会话)

  `screen`

- Start a new named screen session:(启动一个新的名为screen会话)

  `screen -S session_name`

- Start a new daemon and log the output to screenlog.x:(启动一个新的守护进程，并将输出记录到screen .x)

  `screen -dmLS session_name command`

- Show open screen sessions:(显示打开的屏幕会话)

  `screen -ls`

- Reattach to an open screen:(重新连接到打开的屏幕)

  `screen -r session_name`

- Detach from inside a screen:(从屏幕内部分离)

  `Ctrl + A, D`

- Kill a detached screen:（关闭一个分离的屏幕）

  `screen -X -S session_name quit`

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

## su

Switch shell to another user.（将shell切换到另一个用户）

- Switch to superuser (admin password required):（切换到超级用户(需要管理密码)）

  `su`

- Switch to user username (password required):（切换到用户名(需要密码)）

  `su username`

- Switch to user username and simulate a full login shell:（切换到user username并模拟完整的登录shell）

  `su - username`

## sudo

Executes a single command as the superuser or another user.(以超级用户或其他用户的身份执行单个命令)

- Run a command as the superuser:(以超级用户的身份运行命令)

  `sudo less /var/log/syslog`

- Edit a file as the superuser with your default editor:(使用默认编辑器以超级用户的身份编辑文件)

  `sudo -e /etc/fstab`

- Run a command as another user and/or group:(以另一个用户和/或组的身份运行命令)

  `sudo -u user -g group id -a`

- Repeat the last command prefixed with "sudo" (only in bash, zsh, etc.):(重复前缀为“sudo”的最后一个命令（仅限bash，zsh等)

  `sudo !!`

- Launch the default shell with superuser privileges:(启动具有超级用户特权的默认shell)

  `sudo -i`

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

## useradd

Create a new user.(创建一个新用户)

- Create new user:(创建新用户)

  `useradd name`

- Create new user with a default home directory:(创建具有默认主目录的新用户)

  `useradd --create-home name`

- Create new user with specified shell:(使用指定的shell创建新用户)

  `useradd --shell /path/to/shell name`

- Create new user belonging to additional groups (mind the lack of whitespace):(创建属于其他组的新用户(注意没有空格))

  `useradd --groups group1,group2 name`

- Create new system user without a home directory:(创建没有主目录的新系统用户)

  `useradd --no-create-home --system name`

## userdel

Remove a user.(删除一个用户)

- Remove a user and their home directory:（删除用户及其主目录）

  `userdel -r name`

## usermod

Modifies a user account.(修改用户帐户)

- Change a user's name:(更改用户名)

  `usermod -l newname user`

- Add user to supplementary groups (mind the whitespace):(将用户添加到补充组(注意空格))

  `usermod -a -G group1,group2 user`

- Create a new home directory for a user and move their files to it:(为用户创建一个新的主目录并将其文件移动到其中)

  `usermod -m -d /path/to/home user`

## w

Show who is logged on and what they are doing.(显示谁已登录以及他们正在做什么)
Print user login, TTY, remote host, login time, idle time, current process.(打印用户登录、TTY、远程主机、登录时间、空闲时间、当前进程)

- Show logged-in users info:(显示已登录的用户信息)

  w

- Show logged-in users info without a header:(显示登录的用户信息，没有标题)

  w -h

## who

Display who is logged in and related data (processes, boot time).(显示登录的用户和相关数据(进程、启动时间))

- Display the username, line, and time of all currently logged-in sessions:（显示当前登录的所有会话的用户名、行和时间）

  `who`

- Display information only for the current terminal session:(仅显示当前终端会话的信息)

  `who am i`

- Display all available information:(显示所有可用信息)

  `who -a`

- Display all available information with table headers:(使用表头显示所有可用信息)

  `who -a -H`

## whoami

Print the username associated with the current effective user ID.(打印与当前有效用户ID关联的用户名)

- Display currently logged username:(显示当前登录的用户名)

  `whoami`

- Display the username after a change in the user ID:(在更改用户ID后显示用户名)

  `sudo whoami`

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


# 系统设置

## alias

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

## chkconfig

Manage the runlevel of services on CentOS 6.(管理CentOS 6上的服务运行级别)

- List services with runlevel:(列出带有runlevel的服务)

  `chkconfig --list`

- Show a service's runlevel:(显示服务的运行级别)

  `chkconfig --list ntpd`

- Enable service at boot:(启动时启用服务)

  `chkconfig sshd on`

- Enable service at boot for runlevels 2, 3, 4, and 5:(在启动时为运行级别2、3、4和5启用服务)

  `chkconfig --level 2345 sshd on`

- Disable service at boot:(在启动时禁用服务)

  `chkconfig ntpd off`

- Disable service at boot for runlevel 3:(在启动时禁用运行级别3的服务)

  `chkconfig --level 3 ntpd off`

## chroot

Run command or interactive shell with special root directory.(使用特殊的根目录运行命令或交互式shell)

- Run command as new root directory:(运行命令作为新的根目录)

  `chroot /path/to/new/root command`

- Specify user and group (ID or name) to use:(指定要使用的用户和组(ID或名称))

  `chroot --userspec=user:group`

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

## dircolors

Output commands to set the LS_COLOR environment variable and style `ls`, `dir`, etc.(用于设置LS颜色环境变量和样式' LS '、' dir '等的输出命令)

- Output commands to set LS_COLOR using default colors:(使用默认颜色设置LS颜色的输出命令)

  `dircolors`

- Output commands to set LS_COLOR using colors from a file:(使用文件中的颜色设置LS颜色的输出命令)

  `dircolors file`

- Output commands for Bourne shell:(Bourne shell的输出命令)

  `dircolors --bourne-shell`

- Output commands for C shell:(C shell的输出命令)

  `dircolors --c-shell`

- View the default colors for file types and extensions:(查看文件类型和扩展名的默认颜色)

  `dircolors --print-data`

## dmesg

Write the kernel messages to standard output.(将内核消息写入标准输出)

- Show kernel messages:(显示内核消息)

  `dmesg`

- Show kernel error messages:(显示内核错误消息)

  `dmesg --level err`

- Show kernel messages and keep reading new ones, similar to `tail -f` (available in kernels 3.5.0 and newer):(显示内核消息并不断读取新的消息，类似于“tail -f”(在内核3.5.0或更新版本中可用))

  `dmesg -w`

- Show how much physical memory is available on this system:(显示这个系统上有多少物理内存可用)

  `dmesg | grep -i memory`

- Show kernel messages 1 page at a time:(每次显示内核消息1页)

  `dmesg | less`

- Show kernel messages with a timestamp (available in kernels 3.5.0 and newer):(显示带有时间戳的内核消息(在内核3.5.0及更新版本中可用))

  `dmesg -T`

- Show kernel messages in human-readable form (available in kernels 3.5.0 and newer):(以人类可读的形式显示内核消息(在内核3.5.0及更新版本中可用))

  `dmesg -H`

- Colorize output (available in kernels 3.5.0 and newer):(着色输出(在内核3.5.0及更新版本中可用))

  `dmesg -L`

## eval

Execute arguments as a single command in the current shell and return its result.(在当前shell中作为单个命令执行参数并返回其结果)

- Call `echo` with the "foo" argument:(使用“foo”参数调用“echo”)

  `eval "echo foo"`

- Set a variable in the current shell:(在当前shell中设置一个变量)

  `eval "foo=bar"`

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

## hwclock

Used for reading or changing the hardware clock. Usually requires root.(用于读取或改变硬件时钟。通常需要root权限)

- Display the current time as reported by the hardware clock:（显示硬件时钟报告的当前时间）

  `hwclock`

- Write the current software clock time to the hardware clock (sometimes used during system setup):（将当前软件时钟时间写入硬件时钟(有时在系统设置期间使用)）

  `hwclock --systohc`

- Write the current hardware clock time to the software clock:（将当前硬件时钟时间写入软件时钟）

  `hwclock --hctosys`

## lsmod

Shows the status of linux kernel modules.（显示linux内核模块的状态）
See also `modprobe`, which loads kernel modules.（另见“modprobe”，它加载内核模块）

- List all currently loaded kernel modules:（列出所有当前加载的内核模块）

  `lsmod`

## modinfo

Extract information about a Linux kernel module.（提取关于Linux内核模块的信息）

- List all attributes of a kernel module:（列出内核模块的所有属性）

  `modinfo kernel_module`

- List the specified attribute only:（只列出指定的属性）

  `modinfo -F author|description|license|parm|filename kernel_module`

## modprobe

Add or remove modules from the Linux kernel.（从Linux内核中添加或删除模块）

- Pretend to load a module into the kernel, but don't actually do it:（假装将模块加载到内核中，但实际上并没有这样做）

  `sudo modprobe --dry-run module_name`

- Load a module into the kernel:（将模块加载到内核中）

  `sudo modprobe module_name`

- Remove a module from the kernel:（从内核中删除一个模块）

  `sudo modprobe --remove module_name`

- Remove a module and those that depend on it from the kernel:（从内核中删除模块和依赖模块的模块）

  `sudo modprobe --remove-dependencies module_name`

- Show a kernel module's dependencies:（显示内核模块的依赖项）

  `sudo modprobe --show-depends module_name`

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

## rpm

RPM Package Manager.(RPM包管理器)

- Show version of httpd package:(显示httpd包的版本)

  `rpm -q httpd`

- List versions of all matching packages:(列出所有匹配包的版本)

  `rpm -qa 'mariadb*'`

- Identify owner of a file and show version of the package:(识别文件的所有者并显示包的版本)

  `rpm -qf /etc/postfix/main.cf`

- List package-owned files:(package-owned文件列表)

  `rpm -ql kernel`

- Show scriptlets from an RPM file:(显示RPM文件中的脚本)

  `rpm -qp --scripts some.rpm`

- Show changed, missing and/or incorrectly installed files of matching packages:(显示已更改，缺失和/或错误安装匹配包的文件)

  `rpm -Va 'php-*'`

## set

Display, set or unset values of shell attributes and positional parameters.(显示、设置或未设置shell属性和位置参数的值)

- Display the names and values of shell variables:(显示shell变量的名称和值)

  `set`

- Mark variables that are modified or created for export:(标记为导出而修改或创建的变量)

  `set -a`

- Notify of job termination immediately:(立即通知终止工作)

  `set -b`

- Set various options, e.g. enable `vi` style line editing:(设置各种选项，例如启用“vi”样式的行编辑)

  `set -o vi`

## ulimit

Get and set user limits.(获取并设置用户限制)

- Get the properties of all the user limits:(获取所有用户限制的属性)

  `ulimit -a`

- Get hard limit for the number of simultaneously opened files:(获取同时打开的文件数量的硬限制)

  `ulimit -H -n`

- Get soft limit for the number of simultaneously opened files:(获取同时打开的文件数量的软限制)

  `ulimit -S -n`

- Set max per-user process limit:(设置每个用户的最大进程限制)

  `ulimit -u 30`

## unset

Remove shell variables or functions.(删除外壳变量或函数)

- Remove the variables foo and bar:(删除变量foo和bar)

  `unset foo bar`

- Remove the function my_func:(删除函数my func)

  `unset -f my_func`


# 网络通讯

## ab

Apache Benchmarking tool. The simplest tool to perform a load testing.(Apache基准测试工具,执行负载测试的最简单工具)

- Execute 100 HTTP GET requests to given URL:(对给定URL执行100个HTTP GET请求)

  `ab -n 100 url`

- Execute 100 HTTP GET requests, processing up to 10 requests concurrently, to given URL:(对给定URL执行100个HTTP GET请求，并发处理最多10个请求)

  `ab -n 100 -c 10 url`

- Use keep alive:

  `ab -k url`

- Set the maximum number of seconds to spend for benchmarking:(设置用于基准测试的最大秒数)

  `ab -t 60 url`

## apachectl

Apache HTTP Server control interface for macOS.(macOS的Apache HTTP服务器控制接口)

- Start the org.apache.httpd launchd job:(启动表示。httpd launchd工作)

  `apachectl start`

- Stop the launchd job:（停止启动作业）

  `apachectl stop`

- Stop, then start launchd job:(停止，然后开始启动作业)

  `apachectl restart`

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

## mesg

Check or set a terminal's ability to receive messages from other users, usually from the write command.(检查或设置终端接收来自其他用户(通常是来自write命令)的消息的能力)
See also `write`.(参见`write`)

- Check terminal's openness to write messages:(检查终端写消息的开放性)

  `mesg`

- Disable receiving messages from the write command:(禁用从写命令接收消息)

  `mesg n`

- Enable receiving messages from the write command:(启用从写命令接收消息)

  `mesg y`

## nc

Netcat is a versatile utility for working with TCP or UDP data.（Netcat是一个用于处理TCP或UDP数据的通用实用程序）

- Listen on a specified port and print any data received:(监听指定端口并打印接收到的任何数据)

  `nc -l port`

- Connect to a certain port (you can then write to this port):(连接到某个端口(然后可以写入该端口))

  `nc ip_address port`

- Set a timeout:(设置一个超时)

  `nc -w timeout_in_seconds ipaddress port`

- Serve a file:（提供文件）

  `nc -l port < file`

- Receive a file:(收到一个文件)

  `nc ip_address port > file`

- Server stay up after client detach:(客户端分离后服务器保持不变)

  `nc -k -l port`

- Client stay up after EOF:(客户端在EOF之后保持)

  `nc -q timeout ip_address`

- Scan the open ports of a specified host:（扫描指定主机的打开端口）

  `nc -v -z ip_address port`

- Act as proxy and forward data from a local TCP port to the given remote host:（充当代理并将数据从本地TCP端口转发到给定的远程主机）

  `nc -l local_port | nc hostname remote_port`

## netstat

Displays network-related information such as open connections, open socket ports, etc.(显示与网络相关的信息，如打开的连接、打开的套接字端口等)

- List all ports:(列出所有端口)

  `netstat -a`

- List all listening ports:(列出所有监听端口)

  `netstat -l`

- List listening TCP ports:(列表监听TCP端口)

  `netstat -t`

- Display PID and program names:(显示PID和程序名)

  `netstat -p`

- List information continuously:（列表信息不断）

  `netstat -c`

- List routes and do not resolve IP to hostname:(列出路由，但不将IP解析为主机名)

  `netstat -rn`

- List listening TCP and UDP ports (+ user and process if you're root):(列出监听TCP和UDP端口(如果您是根用户和进程))

  `netstat -lepunt`

- Print the routing table:（打印路由表）

  `netstat -nr`

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

## telnet

Connect to a specified port of a host using the telnet protocol.(使用telnet协议连接到主机的指定端口)

- Telnet to the default port of a host:(Telnet到主机的默认端口)

  `telnet host`

- Telnet to a specific port of a host:(Telnet到主机的特定端口)

  `telnet ip_address port`

- Exit a telnet session:(退出telnet会话)

  `quit`

- Emit the default escape character combination for terminating the session:(发出终止会话的默认转义字符组合)

  `Ctrl + ]`

- Start telnet with "x" as the session termination character:(以“x”作为会话终止字符启动telnet)

  `telnet -e x ip_address port`

## tcpdump

Dump traffic on a network.(在网络上转储流量)
Homepage: <https://www.tcpdump.org>.

- List available network interfaces:(列出可用的网络接口)

  `tcpdump -D`

- Capture the traffic of a specific interface:(捕获特定接口的流量)

  `tcpdump -i eth0`

- Capture all TCP traffic showing contents (ASCII) in console:(捕获控制台中显示内容(ASCII)的所有TCP流量)

  `tcpdump -A tcp`

- Capture the traffic from or to a host:（捕获来自或到主机的流量）

  `tcpdump host www.example.com`

- Capture the traffic from a specific interface, source, destination and destination port:（从特定接口、源、目标和目标端口捕获流量）

  `tcpdump -i eth0 src 192.168.1.1 and dst 192.168.1.2 and dst port 80`

- Capture the traffic of a network:(捕获网络的流量)

  `tcpdump net 192.168.1.0/24`

- Capture all traffic except traffic over port 22 and save to a dump file:(捕获除端口22之外的所有流量，并保存到转储文件中)

  `tcpdump -w dumpfile.pcap not port 22`

- Read from a given dump file:(从给定转储文件读取)

  `tcpdump -r dumpfile.pcap`

## traceroute

Print the route packets trace to network host.(打印路由包跟踪到网络主机)

- Traceroute to a host:(跟踪到主机)

  `traceroute host`

- Disable IP address and host name mapping:（禁用IP地址和主机名映射）

  `traceroute -n host`

- Specify wait time for response:（指定响应的等待时间）

  `traceroute -w 0.5 host`

- Specify number of queries per hop:（指定每跳查询的数量）

  `traceroute -q 5 host`

- Specify size in bytes of probing packet:(指定探测包的大小(以字节为单位))

  `traceroute host 42`

## tty

Returns terminal name.（返回终端名称）

- Print the file name of this terminal:(打印此终端的文件名)

  `tty`

## wall

Write a message on the terminals of users currently logged in.(在当前登录用户的终端上写一条消息)

- Send a message:(发信息)

  `echo "message" | wall`

- Send a message from a file:(从文件中发送消息)

  `wall file`

- Send a message with timeout (default 300):(发送带有超时的消息(默认为300))

  `wall -t seconds file`

## write

Write a message on the terminal of a specified logged in user (ctrl-C to stop writing messages).（在指定登录用户的终端上写一条消息(ctrl-C停止写消息)）
Use the `who` command to find out all terminal_ids of all active users active on the system. See also `mesg`.（使用`who`命令查找系统上所有活动用户的所有终端id。参见`mesg`）

- Send a message to a given user on a given terminal id:（根据给定的终端id向给定的用户发送消息）

  `write username terminal_id`

- Send message to "testuser" on terminal "/dev/tty/5":（在"/dev/tty/5"终端上向"testuser"发送消息）

  `write testuser tty/5`

- Send message to "jhondoe" on pseudo terminal "/dev/pts/5":(在伪终端"/dev/pts/5"上发送消息给"jhondoe")

  `write jhondoe pts/5`

## smbclient

FTP-like client to access SMB/CIFS resources on servers.(类似FTP的客户端，用于访问服务器上的SMB / CIFS资源)

- Connect to a share (user will be prompted for password; `exit` to quit the session):（连接到共享（系统将提示用户输入密码;退出`退出会话））

  `smbclient //server/share`

- Connect with a different username:(使用其他用户名连接)

  `smbclient //server/share --user username`

- Connect with a different workgroup:(连接到不同的工作组)

  `smbclient //server/share --workgroup domain --user username`

- Connect with a username and password:（使用用户名和密码连接）

  `smbclient //server/share --user username%password`

- Download a file from the server:（从服务器下载文件）

  `smbclient //server/share --directory path/to/directory --command "get file.txt"`

- Upload a file to the server:（将文件上传到服务器）

  `smbclient //server/share --directory path/to/directory --command "put file.txt"`

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



# 磁盘管理

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

## df

Gives an overview of the file system disk space usage.(概述文件系统磁盘空间的使用情况)

- Display all file systems and their disk usage:(显示所有文件系统及其磁盘使用情况)

  `df`

- Display all file systems and their disk usage in human readable form:(以人类可读的形式显示所有文件系统及其磁盘使用情况)

  `df -h`

- Display the file system and its disk usage containing the given file or directory:(显示包含给定文件或目录的文件系统及其磁盘使用情况)

  `df path/to/file_or_directory`

## dirs

Displays or manipulates the directory stack.(显示或操作目录堆栈)
The directory stack is a list of recently visited directories that can be manipulated with the `pushd` and `popd` commands.(目录堆栈是一个最近访问过的目录列表，可以使用“pushd”和“popd”命令操纵这些目录)

- Display the directory stack with a space between each entry:(显示每个条目之间有空格的目录堆栈)

  `dirs`

- Display the directory stack with one entry per line:(显示每行包含一个条目的目录堆栈)

  `dirs -p`

- Display only the nth entry in the directory stack, starting at 0:(只显示目录堆栈中的第n项，从0开始)

  `dirs +N`

- Clear the directory stack:(清除目录堆栈)

  `dirs -c`

## du

Disk usage: estimate and summarize file and directory space usage.(磁盘使用情况:估计和总结文件和目录空间使用情况)

- List the sizes of a directory and any subdirectories, in the given unit (B/KB/MB):(以给定单位列出目录和所有子目录的大小（B / KB / MB）)

  `du -b|k|m path/to/directory`

- List the sizes of a directory and any subdirectories, in human-readable form (i.e. auto-selecting the appropriate unit for each size):(以人类可读的形式列出目录和任何子目录的大小（即为每个大小自动选择适当的单位）)

  `du -h path/to/directory`

- Show the size of a single directory, in human readable units:(以人类可读的单位显示单个目录的大小)

  `du -sh path/to/directory`

- List the human-readable sizes of a directory and of all the files and directories within it:(列出一个目录以及其中所有文件和目录的人类可读大小)

  `du -ah path/to/directory`

- List the human-readable sizes of a directory and any subdirectories, up to N levels deep:(列出目录和任何子目录的人类可读大小，深度可达N级)

  `du -h --max-depth=N path/to/directory`

- List the human-readable size of all .jpg files in subdirectories of the current directory, and show a cumulative total at the end:(列出当前目录子目录中所有.jpg文件的人类可读大小，并在最后显示累计大小)

  `du -ch */*.jpg`

## edquota

Edit quotas for a user or group. By default it operates on all file systems with quotas.(编辑用户或组的配额。默认情况下，它对所有带有配额的文件系统进行操作)
Quota information is stored permanently in the `quota.user` and `quota.group` files in the root of the filesystem.(配额信息永久存储在“配额”中。用户”和“配额。在文件系统的根目录中对文件进行分组)

- Edit quota of the current user:(编辑当前用户的配额)

  `edquota --user $(whoami)`

- Edit quota of a specific user:(编辑特定用户的配额)

  `sudo edquota --user username`

- Edit quota for a group:(编辑组的配额)

  `sudo edquota --group group`

- Restrict operations to a given filesystem (by default edquota operates on all filesystems with quotas):(将操作限制在给定的文件系统中(默认情况下，edquota对所有带有配额的文件系统进行操作))

  `sudo edquota --file-system filesystem`

- Edit the default grace period:(编辑默认的宽限期)

  `sudo edquota -t`

- Duplicate a quota to other users:(将配额复制给其他用户)

  `sudo edquota -p reference_user destination_user1 destination_user2`

## eject

Eject cds, floppy disks and tape drives.(弹出cd、软盘和磁带驱动器)

- Display the default device:(显示默认设备)

  `eject -d`

- Eject the default device:(弹出默认设备)

  `eject`

- Eject a specific device (the default order is cd-rom, scsi, floppy and tape):(弹出特定的设备(默认顺序是cd-rom、scsi、软盘和磁带))

  `eject /dev/cdrom`

- Toggle whether a device's tray is open or closed:(切换设备托盘是打开还是关闭)

  `eject -T /dev/cdrom`

- Eject a cd drive:(弹出一个cd驱动器)

  `eject -r /dev/cdrom`

- Eject a floppy drive:(弹出一个软盘驱动器)

  `eject -f /mnt/floppy`

- Eject a tape drive:(弹出磁带驱动器)

  `eject -q /mnt/tape`

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

## mkdir

Creates a directory.（创建一个目录）

- Create a directory in current directory or given path:（在当前目录或给定路径中创建一个目录）

  `mkdir directory`

- Create directories recursively (useful for creating nested dirs):（递归创建目录(用于创建嵌套的目录)）

  `mkdir -p path/to/directory`

## pwd

Print name of current/working directory.（打印当前/工作目录的名称）

- Print the current directory:(打印当前目录)

  `pwd`

- Print the current directory, and resolve all symlinks (i.e. show the "physical" path):(打印当前目录，并解析所有符号链接(即显示“物理”路径))

  `pwd -P`

## quota

Display users' disk space usage and allocated limits.(显示用户的磁盘空间使用情况和分配限制)

- Show disk quotas in human readable units for the current user:(以人类可读的单位显示当前用户的磁盘配额)

  `quota -s`

- Verbose output (also display quotas on filesystems where no storage is allocated):(详细输出(也显示没有分配存储的文件系统上的配额))

  `quota -v`

- Quiet output (only display quotas on filesystems where usage is over quota):(安静输出(仅在使用超过配额的文件系统上显示配额))

  `quota -q`

- Print quotas for the groups of which the current user is a member:(打印当前用户所属组的配额)

  `quota -g`

- Show disk quotas for another user:(显示另一个用户的磁盘配额)

  `sudo quota -u username`

## quotacheck

Scan a filesystem for disk usage; create, check and repair quota files.(扫描文件系统以查看磁盘使用情况;创建、检查和修复配额文件)
It is best to run quota check with quotas turned off to prevent damage or loss to quota files.(最好在关闭配额的情况下运行配额检查，以防止对配额文件的损坏或丢失)

- Check quotas on all mounted non-NFS filesystems:( 检查所有挂载的非nfs文件系统上的配额)

  `sudo quotacheck --all`

- Force check even if quotas are enabled (this can cause damage or loss to quota files):(强制检查，即使启用了配额(这会导致配额文件损坏或丢失))

  `sudo quotacheck --force mountpoint`

- Check quotas on a given filesystem in debug mode:(在调试模式下检查给定文件系统上的配额)

  `sudo quotacheck --debug mountpoint`

- Check quotas on a given filesystem, displaying the progress:(检查给定文件系统上的配额，显示进度)

  `sudo quotacheck --verbose mountpoint`

- Check user quotas:(检查用户配额)

  `sudo quotacheck --user user mountpoint`

- Check group quotas:(检查小组配额)

  `sudo quotacheck --group group mountpoint`

## repquota

Display a summary of existing file quotas for a filesystem.(显示文件系统现有文件配额的摘要)

- Report stats for all quotas in use:(报告所有正在使用的配额的统计数据)

  `sudo repquota -all`

- Report quota stats for all users, even those who aren't using any of their quota:(报告所有用户的配额统计数据，即使是那些没有使用任何配额的用户)

  `sudo repquota -v filesystem`

- Report on quotas for users only:(只报告用户配额)

  `repquota --user filesystem`

- Report on quotas for groups only:(只报告团体配额)

  `sudo repquota --group filesystem`

- Report on used quota and limits in a human-readable format:(以人类可读的格式报告使用的配额和限制)

  `sudo repquota --human-readable filesystem`

- Report on all quotas for users and groups in a human-readable format:(以人类可读的格式报告用户和组的所有配额)

  `sudo repquota -augs`

## rmdir

Removes a directory.(删除一个目录)

- Remove directory, provided it is empty. Use `rm` to remove not empty directories:(删除目录，如果它是空的。使用“rm”删除非空目录)

  `rmdir path/to/directory`

- Remove directories recursively (useful for nested dirs):(递归删除目录(对于嵌套的dirs很有用))

  `rmdir -p path/to/directory`

## stat

Display file and filesystem information.(显示文件和文件系统信息)

- Show file properties such as size, permissions, creation and access dates among others:(显示文件属性，如大小、权限、创建和访问日期等)

  `stat file`

- Same as above but in a more concise way:(和上面一样，但是更简洁)

  `stat -t file`

- Show filesystem information:(显示文件信息)

  `stat -f file`

- Show only octal file permissions:(只显示八进制文件权限)

  `stat -c "%a %n" file`

- Show owner and group of the file:(显示文件的所有者和组)

  `stat -c "%U %G" file`

- Show the size of the file in bytes:(以字节为单位显示文件的大小)

  `stat -c "%s %n" file`

## tree

Show the contents of the current directory as a tree.(以树的形式显示当前目录的内容)

- Show files and directories up to 'num' levels of depth (where 1 means the current directory):(显示深度为“num”级别的文件和目录(其中1表示当前目录))

  `tree -L num`

- Show directories only:(仅显示目录)

  `tree -d`

- Show hidden files too:(也显示隐藏文件)

  `tree -a`

- Print the tree without indentation lines, showing the full path instead (use `-N` to not escape whitespace and special characters):(打印树而不缩进行，而是显示完整的路径(使用' -N '来避免转义空格和特殊字符))

  `tree -i -f`

- Print the size of each node next to it, in human-readable format:(以人类可读的格式打印它旁边每个节点的大小)

  `tree -s -h`

- Filter the tree using a wildcard (glob) pattern:(使用通配符(glob)模式过滤树)

  `tree -P *.txt`

- Ignore entries that match a wildcard (glob) pattern:(忽略匹配通配符(glob)模式的条目)

  `tree -I *.txt`

## umount

Unlink a filesystem from its mount point, making it no longer accessible.(从挂载点断开文件系统的链接，使其不再可访问)
A filesystem cannot be unmounted when it is busy.(文件系统繁忙时无法卸载)

- Unmount a filesystem, by passing the path to the source it is mounted from:(通过将路径传递到挂载文件系统的源，卸载文件系统)

  `umount path/to/device_file`

- Unmount a filesystem, by passing the path to the target where it is mounted:(通过将路径传递到安装文件系统的目标，卸载文件系统)

  `umount path/to/mounted_directory`

- Unmount all mounted filesystems (except the `proc` filesystem):(卸载所有已安装的文件系统(除了“proc”文件系统))

  `umount -a`


# 磁盘维护

## badblocks

Search a device for bad blocks.(搜索设备中的坏块)
Some usages of badblocks can cause destructive actions, such as erasing all the data on a disk, including the partition table.(坏块的一些用法可能会导致破坏性的操作，比如擦除磁盘上的所有数据，包括分区表)

- Search a disk for bad blocks by using a non-destructive read-only test:(使用非破坏性只读测试在磁盘中搜索坏块)

  `sudo badblocks /dev/sda`

- Search an unmounted disk for bad blocks with a non-destructive read-write test:(使用非破坏性读写测试在未挂载的磁盘中搜索坏块)

  `sudo badblocks -n /dev/sda`

- Search an unmounted disk for bad blocks with a destructive write test:(使用破坏性的写测试在未挂载的磁盘中搜索坏块)

  `sudo badblocks -w /dev/sda`

## dd

Convert and copy a file.(转换和复制文件)

- Make a bootable usb drive from an isohybrid file (such like archlinux-xxx.iso) and show the progress:(从一个isohybrid文件(比如archlinux-xxx.iso)中创建一个可引导的usb驱动器，并显示进程)

  `dd if=file.iso of=/dev/usb_drive status=progress`

- Clone a drive to another drive with 4MB block, ignore error and show progress:(克隆一个驱动器到另一个驱动器与4MB块，忽略错误，并显示进展)

  `dd if=/dev/source_drive of=/dev/dest_drive bs=4M conv=noerror status=progress`

- Generate a file of 100 random bytes by using kernel random driver:(使用内核随机驱动程序生成一个100个随机字节的文件)

  `dd if=/dev/urandom of=random_file bs=100 count=1`

- Benchmark the write performance of a disk:(测试磁盘的写性能)

  `dd if=/dev/zero of=file_1GB bs=1024 count=1000000`

- Check progress of an ongoing dd operation (Run this command from another shell):(检查正在进行的dd操作的进度(从另一个shell运行此命令))

  `kill -USR1 $(pgrep ^dd)`

## fdisk

A program for managing partition tables and partitions on a hard disk.(管理硬盘上的分区表和分区的程序)

- List partitions:(表分区)

  `fdisk -l`

- Start the partition manipulator:(启动分区机械手)

  `fdisk /dev/sda`

## fsck

Check the integrity of a filesystem or repair it. The filesystem should be unmounted at the time the command is run.(检查或修复文件系统的完整性。应该在运行命令时卸载文件系统)

- Check filesystem /dev/sda, reporting any damaged blocks:(检查文件系统/ dev / sda，报告任何已损坏的块)

  `fsck /dev/sda`

- Check filesystem /dev/sda, reporting any damaged blocks and interactively letting the user choose to repair each one:(检查文件系统/ dev / sda，报告任何已损坏的块并以交互方式让用户选择修复每个块)

  `fsck -r /dev/sda`

- Check filesystem /dev/sda, reporting any damaged blocks and automatically repairing them:(检查文件系统/ dev / sda，报告任何已损坏的块并自动修复它们)

  `fsck -a /dev/sda`

## losetup

Set up and control loop devices.(设置和控制回路设备)

- List loop devices with detailed info:(列出循环设备的详细信息)

  `losetup -a`

- Attach a file to a given loop device:(将文件附加到给定的循环设备)

  `sudo losetup /dev/loop /path/to/file`

- Detach all loop devices:(断开所有环路设备)

  `sudo losetup -D`

- Detach a given loop device:(分离给定的循环设备)

  `sudo losetup -d /dev/loop`

## mkfs.ext2

Creates a Linux filesystem inside a partition.(在分区内创建一个Linux文件系统)

- Create an ext2 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext2文件系统(' sdb1 '))

  `mkfs.ext2 /dev/sdb1`

- Create an ext3 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext3文件系统(' sdb1 '))

 ` mkfs.ext3 /dev/sdb1`

- Create an ext3 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext3文件系统(' sdb1 '))

  `mkfs.ext3 /dev/sdb1`

## mkfs.minix

Creates a Minix filesystem inside a partition.(在分区内创建一个Minix文件系统)

- Create a Minix filesystem inside partition 1 on device b (`sdb1`):(在设备b的分区1中创建一个Minix文件系统(' sdb1 '))

  `mkfs.minix /dev/sdb1`

## mkisofs

Create ISO files from directories.(从目录创建ISO文件)
Also aliased as `genisoimage`.(也别名为“genisoimage”)

- Create an ISO from a directory:(从目录创建ISO)

  `mkisofs -o filename.iso path/to/source_directory`

- Set the disc label when creating an ISO:(创建ISO时设置光盘标签)

  `mkisofs -o filename.iso -V "label_name" path/to/source_directory`

## mkswap

Sets up a Linux swap area on a device or in a file.(在设备或文件中设置Linux交换区域)

- Setup a given partition as swap area:(将给定的分区设置为交换区)

  `sudo mkswap /dev/sdb7`

- Use a given file as swap area:(使用给定的文件作为交换区域)

  `sudo mkswap path/to/file`

- Check a partition for bad blocks before creating the swap area:(在创建交换区域之前，检查分区是否有坏的块)

  `sudo mkswap -c /dev/sdb7`

- Specify a label for the file (to allow `swapon` to use the label):(为文件指定一个标签(允许“swapon”使用标签))

  `sudo mkswap -L swap1 path/to/file`

## swapoff

Disables device or file for swapping.(禁用用于交换的设备或文件)

- Disable a given swap partition:(禁用给定的交换分区)

  `swapoff /dev/sdb7`

- Disable a given swap file:(禁用给定的交换文件)

  `swapoff path/to/file`

- Disable all swap areas:(禁用所有交换区域)

  `swapoff -a`

- Disable swap by label of a device or file:(通过设备或文件的标签禁用交换)

  `swapoff -L swap1`

## swapon

Enables device or file for swapping.(启用设备或文件交换)

- Get swap information:(获得交换信息)

  `swapon -s`

- Enable a given swap partition:(启用给定的交换分区)

  `swapon /dev/sdb7`

- Enable a given swap file:(启用给定的交换文件)

  `swapon path/to/file`

- Enable all swap areas:(启用所有交换区域)

  `swapon -a`

- Enable swap by label of a device or file:(通过设备或文件的标签启用交换)

  `swapon -L swap1`

## sync

Flushes all pending write operations to the appropriate disks.(将所有挂起的写操作刷新到适当的磁盘)

- Flush all pending write operations on all disks:

  `sync`

- Flush all pending write operations on a single file to disk:(将单个文件上所有挂起的写操作刷新到磁盘)

  `sync path/to/file`


# 设备管理


# 电子邮件与新闻组

## elm

Compile and run Elm source files.（编译并运行Elm源文件）

- Initialize an Elm project, generates an elm.json file:(初始化一个Elm项目，生成一个Elm.json文件)

  `elm init`

- Start interactive Elm shell:(启动交互式Elm shell)

  `elm repl`

- Compile an Elm file, output the result to an index.html file:(编译一个Elm文件，将结果输出到index.html文件)

  `elm make source`

- Compile an Elm file, output the result to a Javascript file:(编译一个Elm文件，将结果输出到一个Javascript文件)

  `elm make source --output=destination.js`

- Start local web server that compiles Elm files on page load:(启动本地web服务器，在页面加载时编译Elm文件)

  `elm reactor`

- Install Elm package from https://package.elm-lang.org:(从https://package.elm-lang.org安装Elm软件包)

  `elm install author/package`

## mutt

Command-line email client.(命令行电子邮件客户端)

- Open the specified mailbox:(打开指定的邮箱)

  `mutt -f mailbox`

- Send an email and specify a subject and a cc recipient:(发送电子邮件并指定主题和cc收件人)

  `mutt -s subject -c cc@example.com recipient@example.com`

- Send an email with files attached:(发送附有文件的电子邮件)

  `mutt -a file1 file2 -- recipient@example.com`

- Specify a file to include as the message body:(指定要包含为邮件正文的文件)

  `mutt -i file recipient@example.com`

- Specify a draft file containing the header and the body of the message, in RFC 5322 format:(以RFC 5322格式指定包含邮件标题和正文的草稿文件)

  `mutt -H file recipient@example.com`


# 其他命令

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


## yes

Output something repeatedly.（反复输出一些东西）

- Repeatedly output "message":(反复输出“消息”)

  `yes message`

- Repeatedly output "y":（反复输出“y”）

  `yes`





