* * *
文件目录管理
* * *

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

# 文件编辑

## nano

Simple, easy to use editor. An enhanced, free Pico clone.（简单易用的编辑器。增强的免费Pico克隆）

- Start nano in terminal with {filename}:（使用{filename}在终端启动nano）

  `nano filename`

- Enable smooth scrolling:（启用平滑滚动）

  `nano -S filename`

- Indent new lines to the previous lines' indentation:（将新行缩进到前一行的缩进）

  `nano -i filename`

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

## emacs

The extensible, customizable, self-documenting, real-time display editor.（可扩展，可自定义，自我记录的实时显示编辑器）

- Open emacs in console mode (without X window):（在控制台模式下打开emacs（没有X窗口））

  `emacs -nw`

- Open a file in emacs:（在emacs中打开一个文件）

  `emacs filename`

- Exit emacs:（退出emacs）

  `C-x C-c`

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

# 文件处理

## iconv

Converts text from one encoding to another.（将文本从一种编码转换为另一种编码）

- Convert file to a specific encoding, and print to stdout:(将文件转换为特定编码，然后打印到stdout)

  `iconv -f from_encoding -t to_encoding input_file`

- Convert file to the current locale's encoding, and output to a file:（将文件转换为当前语言环境的编码，并输出到文件）

  `iconv -f from_encoding input_file > output_file`

- List supported encodings:（列出支持的编码）

  `iconv -l`

## nl

A utility for numbering lines, either from a file, or from standard input.(用于从文件或标准输入对行进行编号的实用程序)

- Number non-blank lines in a file:(编号文件中的非空行)

  `nl file`

- Read from standard output:(从标准输出读取)

  `cat file | nl options -`

- Number only the lines with printable text:(仅为具有可打印文本的行编号)

  `nl -t file`

- Number all lines including blank lines:(对所有行进行编号，包括空行)

  `nl -b a file`

- Number only the body lines that match a basic regular expression (BRE) pattern:(仅编号与基本正则表达式（BRE）模式匹配的主体行)

  `nl -b p'FooBar[0-9]' file`

## basename

Returns non-directory portion of a pathname.(返回路径名的非目录部分)

- Show only the file name from a path:(仅显示路径中的文件名)

  `basename path/to/file`

- Show only the file name from a path, with a suffix removed:（仅显示路径中的文件名，并删除后缀）

  `basename path/to/file suffix`

## unlink

Remove a link to a file from the filesystem.（从文件系统中删除文件的链接）

The file contents is lost if the link is the last one to the file.（如果链接是文件的最后一个链接，则文件内容将丢失）

- Remove the specified file if it is the last link:（如果它是最后一个链接，请删除指定的文件）

  `unlink path/to/file`

## pathchk

Check the validity and portability of one or more pathnames.（检查一个或多个路径名的有效性和可移植性）

- Check pathames for validity in the current system:（在当前系统中检查pathames的有效性）

  `pathchk path1 path2 …`

- Check pathnames for validity on a wider range of POSIX compliant systems:（在更广泛的POSIX兼容系统上检查路径名的有效性）

  `pathchk -p path1 path2 …`

- Check pathnames for validity on all POSIX compliant systems:（检查所有POSIX兼容系统上的路径名的有效性）

  `pathchk --portability path1 path2 …`

- Only check for empty pathnames or leading dashes (-):（仅检查空路径名或前导破折号（ - ））

  `pathchk -P path1 path2 …`

## touch

Change a file access and modification times (atime, mtime).(更改文件访问和修改时间(atime, mtime))

- Create a new empty file(s) or change the times for existing file(s) to current time:(创建一个新的空文件或将现有文件的时间更改为当前时间)

  `touch filename`

- Set the times on a file to a specific date and time:(将文件上的时间设置为特定的日期和时间)

  `touch -t YYYYMMDDHHMM.SS filename`

- Use the times from a file to set the times on a second file:(使用文件中的时间设置第二个文件上的时间)

  `touch -r filename filename2`

## rename

Renames multiple files.(重命名多个文件)

- Rename files using a Perl Common Regular Expression (substitute 'foo' with 'bar' wherever found):(使用Perl Common Regular Expression重命名文件（在找到的地方用'bar'替换'foo'）)

  `rename 's/foo/bar/' *`

- Dry-run - display which renames would occur without performing them:（Dry-run  - 显示重命名而不执行它们）

  `rename -n 's/foo/bar/' *`

- Force renaming even if the operation would overwrite existing files:（即使操作会覆盖现有文件，也强制重命名）

  `rename -f 's/foo/bar/' *`

- Convert filenames to lower case (use `-f` in case-insensitive filesystems to prevent "already exists" errors):（将文件名转换为小写（在不区分大小写的文件系统中使用`-f`以防止“已存在”错误））

  `rename 'y/A-Z/a-z/' *`

- Replace whitespace with underscores:（用下划线替换空格）

  `rename 's/\s+/_/g' *`

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

## dirname

Calculates the parent directory of a given file or directory path.（计算给定文件或目录路径的父目录）

- Calculate the parent directory of a given path:（计算给定路径的父目录）

  `dirname path/to/file_or_directory`

- Calculate the parent directory of multiple paths:（计算多个路径的父目录）

  `dirname path/to/file_a path/to/directory_b`

- Delimit output with a NUL character instead of a newline (useful when combining with `xargs`):(使用NUL字符而不是换行符分隔输出（与`xargs`结合使用时很有用）)

  `dirname --zero path/to/directory_a path/to/file_b`

## updatedb

Create or update the database used by `locate`.(创建或更新`locate`使用的数据库)

It is usually run daily by cron.(它通常由cron每天运行)

- Refresh database content:(刷新数据库内容)

  `sudo updatedb`

- Display file names as soon as they are found:(找到文件名后立即显示)

  `sudo updatedb --verbose`

## ln

Creates links to files and directories.(创建指向文件和目录的链接)

- Create a symbolic link to a file or directory:(创建到文件或目录的符号链接)

  `ln -s path/to/file_or_directory path/to/symlink`

- Overwrite an existing symbolic to point to a different file:(覆盖现有符号以指向另一个文件)

  `ln -sf path/to/new_file path/to/symlink`

- Create a hard link to a file:(创建到文件的硬链接)

  `ln path/to/file path/to/hardlink`

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


# 文件内容查看

## hexdump

An ASCII, decimal, hexadecimal, octal dump.（ASCII，十进制，十六进制，八进制转储）

- Print the hexadecimal representation of a file:（打印文件的十六进制表示）

  `hexdump file`

- Display the input offset in hexadecimal and its ASCII representation in two columns:（以十六进制显示输入偏移量，并在两列中显示其ASCII表示形式）

  `hexdump -C file`

- Display the hexadecimal representation of a file, but interpret only n bytes of the input:（显示文件的十六进制表示形式，但仅解释输入的n个字节）

  `hexdump -C -nnumber_of_bytes file`

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

## head

Output the first part of files.(输出文件的第一部分)

- Output the first few lines of a file:(输出文件的前几行)
  head -n count_of_lines filename

- Output the first few bytes of a file:(输出文件的前几个字节)
  head -c size_in_bytes filename

- Output everything but the last few lines of a file:(输出除文件最后几行之外的所有内容)
  head -n -count_of_lines filename

- Output everything but the last few bytes of a file:(输出除文件的最后几个字节之外的所有内容)
  head -c -size_in_bytes filename

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

## more

Open a file for interactive reading, allowing scrolling and search (in forward direction only).(输出除文件的最后几个字节之外的所有内容)

- Open a file:(打开一个文件)

  `more source_file`

- Page down:(向下翻页)

  `<Space>`

- Search for a string (press `n` to go to the next match):(搜索字符串（按“n”转到下一个匹配）)

  `/something`

- Exit:(退出)

  `q`

# 文件查找/比较/过滤/分割与合并

## strings

Find printable strings in an object file or binary.（在目标文件或二进制文件中查找可打印的字符串）

- Print all strings in a binary:（以二进制形式打印所有字符串）

  `strings file`

- Limit results to strings at least *length* characters long:（将结果限制为至少* length *个字符长的字符串）

  `strings -n length file`

- Prefix each result with its offset within the file:（将每个结果的前缀与文件中的偏移量作为前缀）

  `strings -t d file`

- Prefix each result with its offset within the file in hexadecimal:（将每个结果的前缀与文件中的偏移量以十六进制作为前缀）

  `strings -t x file`

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

## cmp

Compare two files.(比较两个文件)

- Find the byte number and line number of the first difference between the files:(查找文件之间第一个差异的字节号和行号)

  `cmp file1 file2`

- Find the byte number and differing bytes of every difference:(找出每个差异的字节数和不同字节)

  `cmp -l file1 file2`

## diff3

Compare three files line by line.(逐行比较三个文件)

- Compare files:(比较文件)

  `diff3 file1 file2 file3`

- Show all changes, outlining conflicts:(显示所有更改，概述冲突)

  `diff3 --show-all file1 file2 file3`

## locate

Find filenames quickly.（快速找到文件名）

- Look for pattern in the database. Note: the database is recomputed periodically (usually weekly or daily):（在数据库中查找模式。注:数据库定期重新计算(通常每周或每天)）

  `locate pattern`

- Look for a file by its exact filename (a pattern containing no globbing characters is interpreted as `*pattern*`):（据文件名查找文件(不包含通配符的模式被解释为“*pattern*”)）

  `locate */filename`

- Recompute the database. You need to do it if you want to find recently added files:（再计算数据库。如果您想找到最近添加的文件，您需要这样做）

  `sudo updatedb`

## which

Locate a program in the user's path.(在用户路径中定位程序)

- Search the PATH environment variable and display the location of any matching executables:(搜索PATH环境变量并显示任何匹配的可执行程序的位置)

  `which executable`

- If there are multiple executables which match, display all:(如果有多个可执行程序匹配，则显示全部)

  `which -a executable`

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

## split

Split a file into pieces.(将文件分割成多个部分)

- Split a file, each split having 10 lines (except the last split):(分割一个文件，每个分割有10行(除了最后一个分割))

  `split -l 10 filename`

- Split a file into 5 files. File is split such that each split has same size (except the last split):(将一个文件分成5个文件。文件被分割，每个分割具有相同的大小(除了最后一个分割))

  `split -n 5 filename`

- Split a file with 512 bytes in each split (except the last split; use 512k for kilobytes and 512m for megabytes):(分割一个文件，每次分割512字节(最后一次分割除外;千字节使用512k，兆字节使用512m))

  `split -b 512 filename`

- Split a file with at most 512 bytes in each split without breaking lines:(在不断行的情况下，分割每个文件，每个文件最多512字节)

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

## printf

Format and print text.(格式化和打印文本)

- Print a text message:(打印短信)

  `printf "%s\n" "Hello world"`

- Print an integer in bold blue:(以粗体蓝色打印整数)

  `printf "\e[1;34m%.3d\e[0m\n" 42`

- Print a float number with the unicode Euro sign:(使用unicode欧元符号打印一个浮点数)

  `printf "\u20AC %.2f\n" 123.4`

- Print a text message composed with environment variables:(打印由环境变量组成的文本消息)

  `printf "var1: %s\tvar2: %s\n" "$VAR1" "$VAR2"`

- Store a formatted message in a variable (does not work on zsh):(将格式化的消息存储在变量中（在zsh上不起作用）)

  `printf -v myvar "This is %s = %d\n" "a year" 2016`

## expand

Convert tabs to spaces.(将制表符转换为空格)

- Convert tabs in each file to spaces, writing to standard output:(将每个文件中的选项卡转换为空格，写入标准输出)

  `expand file`

- Convert tabs to spaces, reading from standard input:(将制表符转换为空格，从标准输入读取)

  `expand`

- Do not convert tabs after non blanks:(非空白后不要转换标签)

  `expand -i file`

- Have tabs a certain number of characters apart, not 8:(标签分开一定数量的字符，而不是8)

  `expand -t=number file`

- Use comma separated list of explicit tab positions:(使用逗号分隔的显式选项卡位置列表)

  `expand -t=list`

## look

Look for lines in sorted file.(在已排序的文件中查找行)

- Look for lines which begins with the given prefix:(查找以给定前缀开头的行)

  `look prefix file`

- Look for lines ignoring case:(寻找忽略大小写的行)

  `look -f prefix file`

## tac

Print and concatenate files in reverse.(反向打印和连接文件)

- Print the contents of *file1* reversed to the standard output:(将*file1*的内容反转为标准输出)

  `tac file1`

- Concatenate several files reversed into the target file:(将几个文件连接到目标文件中)

  `tac file1 file2 > target_file`

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

## rev

Reverse a line of text.(反转一行文字)

- Reverse the text string "hello":(反转文本字符串“hello”)

  `echo "hello" | rev`

- Reverse an entire file and print to stdout:(反转整个文件并打印到标准输出)

  `rev file`

## diffstat

Create a histogram from the output of the `diff` command.(从' diff '命令的输出创建一个直方图)

- Display changes in a histogram:(以柱状图显示更改)

  `diff file1 file2 | diffstat`

- Display inserted, deleted and modified changes as a table:(以表的形式显示插入、删除和修改的更改)

  `diff file1 file2 | diffstat -t`

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

## unexpand

Convert spaces to tabs.(将空格转换为制表符)

- Convert blanks in each file to tabs, writing to standard output:(将每个文件中的空格转换为制表符，写入标准输出)

  `unexpand file`

- Convert blanks to tabs, reading from standard output:(将空格转换为制表符，从标准输出读取)

  `unexpand`

- Convert all blanks, instead of just initial blanks:(转换所有空格，而不仅仅是初始空格)

  `unexpand -a file`

- Convert only leading sequences of blanks (overrides -a):(仅转换空白的前导序列（覆盖-a）)

  `unexpand --first-only file`

- Have tabs a certain number of characters apart, not 8 (enables -a):(标签分开一定数量的字符，而不是8（启用-a）)

  `unexpand -t number file`

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

## fold

Wraps each line in an input file to fit a specified width and prints it to the standard output.(将每一行封装在输入文件中以适应指定的宽度，并将其打印到标准输出中)

- Wrap each line to default width (80 characters):(将每行换行到默认宽度(80个字符))

  `fold file`

- Wrap each line to width "30":(将每一行的宽度包起来“30”)

  `fold -w30 file`

- Wrap each line to width "5" and break the line at spaces (puts each space separated word in a new line, words with length > 5 are wrapped):(将每一行的宽度“5”换行，并在空格处换行(将每个空格分隔的单词换行，换行时将长度为> 5的单词换行))

  `fold -w5 -s file`

## join

Join lines of two sorted files on a common field.（在一个公共字段上联接两个排序文件的行）

- Join two files on the first (default) field:（在第一个(默认)字段上联接两个文件）

  `join file1 file2`

- Join field3 of file1 with field1 of file2:（将file1的field3与file2的field1连接起来）

  `join -1 3 -2 1 file1 file2`

- Produce a line for each unpairable line for file1:（为file1的每条不匹配的线生成一条线）

  `join -a 1 file1 file2`

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

# 文件权限属性设置

## setfacl

Set file access control lists (ACL).(设置文件访问控制列表（ACL）)

- Modify ACL of a file for user with read and write access:(修改具有读写访问权限的用户的文件的ACL)

  `setfacl -m u:username:rw file`

- Modify default ACL of a file for all users:(修改所有用户的文件的默认ACL)

  `setfacl -d -m u::rw file`

- Remove ACL of a file for an user:(删除用户的文件的ACL)

  `setfacl -x u:username file`

- Remove all ACL entries of a file:(删除文件的所有ACL条目)

  `setfacl -b file`

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

## chattr

Change attributes of files or directories.(更改文件或目录的属性)

- Make a file or directory immutable to changes and deletion, even by superuser:(使文件或目录对更改和删除不可变，即使是超级用户)

  `chattr +i path/to/file_or_directory`

- Make a file or directory mutable:(使文件或目录可变)

  `chattr -i path/to/file_or_directory`

- Recursively make an entire directory and contents immutable:(递归地使整个目录和内容不可变)

  `chattr -R +i path/to/directory`

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

# 文件压缩与解压

## zcat

Print data from gzip compressed files.(从gzip压缩文件打印数据)

- Print the uncompressed contents of a gzipped file to the standard output:(将压缩文件的未压缩内容打印到标准输出)

  `zcat file.txt.gz`

- Print compression details of a gzipped file to the standard output:(将压缩文件的压缩详细信息打印到标准输出)

  `zcat -l file.txt.gz`

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

## tar

Archiving utility.(存档实用程序)

Often combined with a compression method, such as gzip or bzip.(通常与压缩方法结合使用，例如gzip或bzip)

Homepage: <https://www.gnu.org/software/tar>.

- Create an archive from files:(从文件创建存档)

  `tar -cf target.tar file1 file2 file3`

- Create a gzipped archive:(创建一个gzip压缩存档)

  `tar -czf target.tar.gz file1 file2 file3`

- Extract an archive in a target directory:(提取目标目录中的存档)

  `tar -xf source.tar -C directory`

- Extract a gzipped archive in the current directory:(解压缩当前目录中的gzip压缩文件)

  `tar -xzf source.tar.gz`

- Extract a bzipped archive in the current directory:(在当前目录中提取bzip压缩文件)

  `tar -xjf source.tar.bz2`

- Create a compressed archive, using archive suffix to determine the compression program:(使用存档后缀创建压缩存档以确定压缩程序)

  `tar -caf target.tar.xz file1 file2 file3`

- List the contents of a tar file:(列出tar文件的内容)

  `tar -tvf source.tar`

- Extract files matching a pattern:(提取与模式匹配的文件)

  `tar -xf source.tar --wildcards "*.html"`

## gunzip

Extract file(s) from a gzip (.gz) archive.(从gzip (.gz)存档文件中提取文件)

- Extract a file from an archive, replacing the original file if it exists:(从归档文件中提取一个文件，如果原始文件存在，则替换它)

  `gunzip archive.tar.gz`

- Extract a file to a target destination:(将文件解压缩到目标目的地)

  `gunzip -c archive.tar.gz > archive.tar`

- List the contents of a compressed file:(列出压缩文件的内容)

  `gunzip -l file.txt.gz`

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

## bzip2

A block-sorting file compressor(块排序文件压缩器).

- Compress file(压缩文件):

  `bzip2 path/to/file_to_compress`

- Decompress file(解压缩文件):

  `bzip2 -d path/to/compressed_file.bz2`

- Decompress to console(解压到控制台):

  `bzip2 -dc path/to/compressed_file.bz2`

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

# 文件备份和恢复

## cpio

Copies files in and out of archives.(在档案中或档案外复制文件)
Supports the following archive formats: cpio's custom binary, old ASCII, new ASCII, crc, HPUX binary, HPUX old ASCII, old tar, and POSIX.1 tar.(支持以下存档格式:cpio的自定义二进制、旧ASCII、新ASCII、crc、HPUX二进制、HPUX旧ASCII、旧tar和POSIX.1 tar)

- Take a list of file names from standard input and add them [o]nto an archive in cpio's binary format:(从标准输入中获取文件名列表，并将它们以cpio的二进制格式添加到存档中)

  `echo "file1 file2 file3" | cpio -o > archive.cpio`

- Copy all files and directories in a directory and add them [o]nto an archive, in [v]erbose mode:(复制目录中的所有文件和目录，并将它们添加到归档文件的inverbose模式中)

  `find path/to/directory | cpio -ov > archive.cpio`

- P[i]ck all files from an archive, generating [d]irectories where needed, in [v]erbose mode:(从存档中选择所有文件，在需要的地方生成目录inverbose模式)

  `cpio -idv < archive.cpio`

# 目录基本操作

## install

Copy files and set attributes.(复制文件和设置属性)

Copy files (often executable) to a system location like `/usr/local/bin`, give them the appropriate permissions/ownership.(将文件（通常是可执行文件）复制到系统位置，如`/usr/local/ bin`，为它们提供适当的权限/所有权)

- Copy files to destination:(将文件复制到目标)

  `install path/to/source path/to/destination`

- Copy files to destination, setting their ownership:(将文件复制到目标，设置其所有权)

  `install -o user path/to/source path/to/destination`

- Copy files to destination, setting their group ownership:(将文件复制到目标，设置其组所有权)

  `install -g user path/to/source path/to/destination`

- Copy files to destination, setting their `mode`:(将文件复制到目标，设置其“模式”)

  `install -m +x path/to/source path/to/destination`

- Copy files and apply access/modification times of source to destination:(复制文件并将源的访问/修改时间应用于目标)

  `install -p path/to/source path/to/destination`

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

## popd

Remove a directory placed on the directory stack by the `pushd` command.(通过`pushd`命令删除目录堆栈上的目录)

- Remove the top directory from the stack and cd to it:(从堆栈中删除顶级目录并cd到它)

  `popd`

- Remove the Nth directory (starting from zero to the left from the list printed with `dirs`):(删除第N个目录（从使用`dirs`打印的列表中从零开始）)

  `popd +N`

- Remove the Nth directory (starting from zero to the right from the list printed with `dirs`):(删除第N个目录（从使用`dirs`打印的列表中从零开始）)

  `popd -N`

## pushd

Place a directory on a stack so it can be accessed later.(将目录放在堆栈上，以便以后访问)

See also `popd` to switch back to original directory.(另请参阅`popd`以切换回原始目录)

- Switch to directory and push it on the stack:(切换到目录并将其推入堆栈)

  `pushd < directory`

- Switch first and second directories on the stack:(切换堆栈上的第一个和第二个目录)

  `pushd`

- Rotate stack by making the 5th element the top of the stack:(通过使第5个元素成为堆栈顶部来旋转堆栈)

  `pushd +4`

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

## rmdir

Removes a directory.(删除一个目录)

- Remove directory, provided it is empty. Use `rm` to remove not empty directories:(删除目录，如果它是空的。使用“rm”删除非空目录)

  `rmdir path/to/directory`

- Remove directories recursively (useful for nested dirs):(递归删除目录(对于嵌套的dirs很有用))

  `rmdir -p path/to/directory`

## mkdir

Creates a directory.（创建一个目录）

- Create a directory in current directory or given path:（在当前目录或给定路径中创建一个目录）

  `mkdir directory`

- Create directories recursively (useful for creating nested dirs):（递归创建目录(用于创建嵌套的目录)）

  `mkdir -p path/to/directory`

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

## pwd

Print name of current/working directory.（打印当前/工作目录的名称）

- Print the current directory:(打印当前目录)

  `pwd`

- Print the current directory, and resolve all symlinks (i.e. show the "physical" path):(打印当前目录，并解析所有符号链接(即显示“物理”路径))

  `pwd -P`

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

# 软件包管理

## factor

Prints the prime factorization of a number.(打印数字的素数因子分解)

- Display the prime-factorization of a number:(显示数字的素数因子分解)

  `factor number`

- Take the input from stdin if no argument is specified:(如果没有指定参数，则从stdin获取输入)

  `echo number | factor`

## dnf

Package management utility for RHEL, Fedora, and CentOS (replaces yum).(RHEL，Fedora和CentOS的软件包管理实用程序（取代yum）)

- Install a new package:(安装新包)

  `sudo dnf install package`

- Install a new package and assume yes to all questions:(安装一个新包，并对所有问题假设为yes)

  `sudo dnf -y install package`

- Remove a package:(删除包)

  `sudo dnf remove package`

- Upgrade installed packages to newest available versions:(将已安装的软件包升级到最新版本)

  `sudo dnf upgrade`

## dpkg

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

## apt-key

Key management utility for the APT Package Manager on Debian and Ubuntu.(Debian和Ubuntu上APT包管理器的密钥管理实用程序)

- List trusted keys:(列出可信密钥)

  `apt-key list`

- Add a key to the trusted keystore:(将密钥添加到可信密钥库)

  `apt-key add public_key_file.asc`

- Delete a key from the trusted keystore:(从受信任的密钥库中删除密钥)

  `apt-key del key_id`

- Add a remote key to the trusted keystore:(将远程密钥添加到受信任的密钥库)

  `wget -qO - https://host.tld/filename.key | apt-key add -`

- Add a key from keyserver with only key id:(从密钥服务器添加一个只有密钥ID的密钥)

  `apt-key adv --keyserver pgp.mit.edu --recv KEYID`

## aptitude

Debian and Ubuntu package management utility.(Debian和Ubuntu包管理实用程序)

- Synchronize list of packages and versions available. This should be run first, before running subsequent aptitude commands:(同步可用的包和版本列表。在运行后续aptitude命令之前，应首先运行此操作)

  `aptitude update`

- Install a new package and its dependencies:(安装新包及其依赖项)

  `aptitude install package`

- Search for a package:(搜索包裹)

  `aptitude search package`

- Remove a package and all packages depending on it:(根据它删除包和所有包)

  `aptitude remove package`

- Upgrade installed packages to newest available versions:(将已安装的软件包升级到最新版本)

  `aptitude upgrade`

- Upgrade installed packages (like `aptitude upgrade`) including removing obsolete packages and installing additional packages to meet new package dependencies:(升级已安装的软件包（如`aptitude upgrade`），包括删除过时的软件包和安装其他软件包以满足新的软件包依赖性)

  `aptitude full-upgrade`

## apt-get

Debian and Ubuntu package management utility.(Debian和Ubuntu包管理实用程序)

Search for packages using `apt-cache`.(使用`apt-cache`搜索包)

- Update the list of available packages and versions (it's recommended to run this before other `apt-get` commands):(更新可用软件包和版本的列表（建议在其他`apt-get`命令之前运行它）)

  `apt-get update`

- Install a package, or update it to the latest available version:(安装软件包，或将其更新到最新的可用版本)

  `apt-get install package`

- Remove a package:(删除包)

  `apt-get remove package`

- Remove a package and its configuration files:(删除包及其配置文件)

  `apt-get purge package`

- Upgrade all installed packages to their newest available versions:(将所有已安装的软件包升级到最新的可用版本)

  `apt-get upgrade`

- Remove all packages that are no longer needed:(删除不再需要的所有包)

  `apt-get autoremove`

- Upgrade installed packages (like `upgrade`), but remove obsolete packages and install additional packages to meet new dependencies:(升级已安装的软件包（如`upgrade`），但删除过时的软件包并安装其他软件包以满足新的依赖项)

  `apt-get dist-upgrade`

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

## yum

Package management utility for RHEL, Feodra, and CentOS (for older versions).(RHEL，Feodra和CentOS的软件包管理实用程序（适用于旧版本）)

- Synchronize list of packages and versions available. This should be run first, before running subsequent yum commands:(同步可用的包和版本列表。在运行后续yum命令之前，应先运行此命令)

  `yum update`

- Install a new package:(安装新包)

  `yum install package`

- Install a new package and assume yes to all questions (also works with update, great for automated updates):(安装一个新软件包并对所有问题假设为yes（也适用于更新，非常适合自动更新）)

  `yum -y install package`

- Find the package that provides a particular command:(找到提供特定命令的包)

  `yum provides command`

- Remove a package:(删除包)

  `yum remove package`

- Upgrade installed packages to newest available versions:(将已安装的软件包升级到最新版本)

  `yum upgrade`

## patch

Patch a file (or files) with a diff file.(用diff文件修补一个或多个文件)
Note that diff files contain both the target filenames and list of changes.(注意，diff文件同时包含目标文件名和更改列表)

- Apply a patch:(应用一个补丁)

  `patch < patch_file.diff`

- Apply a patch to current directory:(将补丁应用于当前目录)

  `patch -p1 < patch_file.diff`

- Apply the reverse of a patch:(应用补丁的反面)

  `patch -R < patch_file.diff`

## dpkg-query

A tool that shows information about installed packages.(显示已安装软件包信息的工具)

- List all installed packages:(列出所有已安装的包)

  `dpkg-query -l`

- List installed packages matching a pattern:(列出与模式匹配的已安装包)

  `dpkg-query -l 'pattern'`

- List all files installed by a package:(列出程序包安装的所有文件)

  `dpkg-query -L package_name`

- Show information about a package:(显示有关包的信息)

  `dpkg-query -s package_name`


* * *
系统管理
* * *

# 系统安全

## openssl

OpenSSL cryptographic toolkit.(OpenSSL加密工具包)

- Generate a 2048bit RSA private key and save it to a file:(生成2048位RSA私钥并将其保存到文件中)

  `openssl genrsa -out filename.key 2048`

- Generate a certificate signing request to be sent to a certificate authority:(生成要发送到证书颁发机构的证书签名请求)

  `openssl req -new -sha256 -key filename.key -out filename.csr`

- Generate a self-signed certificate from a certificate signing request valid for some number of days:(从证书签名请求生成有效期为几天的自签名证书)

  `openssl x509 -req -days days -in filename.csr -signkey filename.key -out filename.crt`

- Display certificate information:(显示证书信息)

  `openssl x509 -in filename.crt -noout -text`

- Display a certificate's expiration date:(显示证书的到期日期)

  `openssl x509 -enddate -noout -in filename.pem`

- Display the start and expiry dates for a domain's certificate:(显示域证书的开始日期和到期日期)

  `openssl s_client -connect host:port 2>/dev/null | openssl x509 -noout -dates`

- Display the certificate presented by an SSL/TLS server:(显示SSL/TLS服务器提供的证书)

  `openssl s_client -connect host:port </dev/null`

- Display the complete certificate chain of an HTTPS server:(显示HTTPS服务器的完整证书链)

  `openssl s_client -connect host:443 -showcerts </dev/null`

## logwatch

Summarizes many different logs for common services (e.g., apache, pam_unix, sshd, etc.) in a single report.(在单个报告中汇总常见服务的许多不同日志（例如，apache，pam_unix，sshd等）)

- Analyze logs for a range of dates at certain level of detail:(在特定详细级别分析日期范围的日志)

  `logwatch --range yesterday|today|all|help --detail low|medium|others'`

- Restrict report to only include information for a selected service:(限制报告仅包括所选服务的信息)

  `logwatch --range all --service apache|pam_unix|etc`

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

## lastlog

Show the most recent login of all users or of a given user.(显示所有用户或给定用户的最新登录信息)

- Display the most recent login of all users:(显示所有用户的最新登录信息)

  `lastlog`

- Display lastlog record of the specified user:(显示指定用户的lastlog记录)

  `lastlog -u username`

- Display records before than 7 days:(显示7天以前的记录)

  `lastlog -b 7`

- Display records more recent than 3 days:(显示最近3天的记录)

  `lastlog -t 3`

## chroot

Run command or interactive shell with special root directory.(使用特殊的根目录运行命令或交互式shell)

- Run command as new root directory:(运行命令作为新的根目录)

  `chroot /path/to/new/root command`

- Specify user and group (ID or name) to use:(指定要使用的用户和组(ID或名称))

  `chroot --userspec=user:group`

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

# 进程和作业管理

## ipcrm

Delete IPC (Inter-process Communication) resources.(删除IPC（进程间通信）资源)

- Delete a shared memory segment by ID:(按ID删除共享内存段)

  `ipcrm --shmem-id shmem_id`

- Delete a shared memory segment by key:(按键删除共享内存段)

  `ipcrm --shmem-key shmem_key`

- Delete an IPC queue by ID:(按ID删除IPC队列)

  `ipcrm --queue-id ipc_queue_id`

- Delete an IPC queue by key:(按键删除IPC队列)

  `ipcrm --queue-key ipc_queue_key`

- Delete a semaphore by ID:(按ID删除信号量)

  `ipcrm --semaphore-id semaphore_id`

- Delete a semaphore by key:(按键删除信号量)

  `ipcrm --semaphore-key semaphore_key`

- Delete all IPC resources:(删除所有IPC资源)

  `ipcrm --all`

## systemctl

Control the systemd system and service manager.(控制systemd系统和服务管理器)

- List failed units:(列出失败的单位)

  `systemctl --failed`

- Start/Stop/Restart/Reload a service:(启动/停止/重新启动/重新加载服务)

  `systemctl start/stop/restart/reload unit`

- Show the status of a unit:(显示单位的状态)

  `systemctl status unit`

- Enable/Disable a unit to be started on bootup:(启用/禁用在启动时启动的单元)

  `systemctl enable/disable unit`

- Mask/Unmask a unit, prevent it to be started on bootup:(屏蔽/取消屏蔽单元，防止它在启动时启动)

  `systemctl mask/unmask unit`

- Reload systemd, scanning for new or changed units:(重新加载系统，扫描新的或更改的单位)

  `systemctl daemon-reload`

## w

Show who is logged on and what they are doing.(显示谁已登录以及他们正在做什么)

Print user login, TTY, remote host, login time, idle time, current process.(打印用户登录、TTY、远程主机、登录时间、空闲时间、当前进程)

- Show logged-in users info:(显示已登录的用户信息)

  w

- Show logged-in users info without a header:(显示登录的用户信息，没有标题)

  w -h

## watch

Execute a command repeatedly, and monitor the output in full-screen mode.(重复执行命令，并以全屏模式监视输出)

- Monitor files in the current directory:(监视当前目录中的文件)

  `watch ls`

- Monitor disk space and highlight the changes:(监视磁盘空间并突出显示更改)

  `watch -d df`

- Monitor "node" processes, refreshing every 3 seconds:(监控“节点”进程，每3秒刷新一次)

  `watch -n 3 "ps aux | grep node"`

## pgrep

Find or signal process by name.(按名称查找或发出信号流程)

- Return PIDs of any running processes with a matching command string:(使用匹配的命令字符串返回任何正在运行的进程的PID)

  `pgrep process_name`

- Search full command line with parameters instead of just the process name:(使用参数而不仅仅是进程名称搜索完整的命令行)

  `pgrep -f "process_name parameter"`

- Search for process run by a specific user:(搜索特定用户运行的进程)

  `pgrep -u root process_name`

## renice

Alters the scheduling priority/nicenesses of one or more running processes.(改变一个或多个正在运行的进程的调度优先级/好处)
Niceness values range from -20 (most favorable to the process) to 19 (least favorable to the process).(良好值范围从-20（最有利于过程）到19（最不利于过程）)

- Change priority of a running process:(更改正在运行的进程的优先级)

  `renice -n niceness_value -p pid`

- Change priority of all processes owned by a user:(更改用户拥有的所有进程的优先级)

  `renice -n niceness_value -u user`

- Change priority of all processes that belong to a process group:(更改属于流程组的所有流程的优先级)

  `renice -n niceness_value --pgrp process_group`

## nohup

Allows for a process to live when the terminal gets killed.(允许进程在终端被杀死时生存)

- Run process that can live beyond the terminal:(运行可以超越终端的进程)

  `nohup command options`

## ipcs

Display information about resources used in IPC (Inter-process Communication).(显示有关IPC（进程间通信）中使用的资源的信息)

- Specific information about the Message Queue which has the id 32768:(有关具有标识32768的Message Queue的特定信息)

  `ipcs -qi 32768`

- General information about all the IPC:(有关所有IPC的一般信息)

  `ipcs -a`

## nice

Execute a program with a custom scheduling priority (niceness).(执行具有自定义调度优先级(niceness)的程序)
Niceness values range from -20 (the highest priority) to 19 (the lowest).(Niceness值范围从-20(最高优先级)到19(最低优先级))

- Launch a program with altered priority:(启动一个优先级改变的程序)

  `nice -n niceness_value command`

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

## pstree

A convenient tool to show running processes as a tree.(一个方便的工具，以树的形式显示正在运行的进程)

- Display a tree of processes:(显示进程树)

  `pstree`

- Display a tree of processes with PIDs:(显示带有pid的进程树)

  `pstree -p`

- Display all process trees rooted at processes owned by specified user:(显示位于指定用户拥有的进程上的所有进程树)

  `pstree user`

## killall

Send kill signal to all instances of a process by name (must be exact name).(按名称向进程的所有实例发送kill信号（必须是确切的名称）)

All signals except SIGKILL and SIGSTOP can be intercepted by the process, allowing a clean exit.(除了SIGKILL和SIGSTOP之外的所有信号都可以被进程拦截，从而允许干净的退出)

- Terminate a process using the default SIGTERM (terminate) signal:(使用默认的SIGTERM（终止）信号终止进程)

  `killall process_name`

- List available signal names (to be used without the 'SIG' prefix):(列出可用的信号名称（在没有'SIG'前缀的情况下使用）)

  `killall --list`

- Interactively ask for confirmation before termination:(在终止前以交互方式要求确认)

  `killall -i process_name`

- Terminate a process using the SIGINT (interrupt) signal, which is the same signal sent by pressing `Ctrl + C`:(使用SIGINT（中断）信号终止进程，这是通过按“Ctrl + C”发送的相同信号)

  `killall -INT process_name`

- Force kill a process:(强制杀死一个进程)

  `killall -KILL process_name`

## batch

Execute commands at a later time when the system load levels permit.(在系统负载级别允许的稍后时间执行命令)

Service atd (or atrun) should be running for the actual executions.(应该为实际执行运行atd（或atrun）服务)

- Execute commands from standard input (press `Ctrl + D` when done):(从标准输入执行命令（完成后按“Ctrl + D”）)

  `batch`

- Execute a command from standard input:(从标准输入执行命令)

  `echo "./make_db_backup.sh" | batch`

- Execute commands from a given file:(执行来自给定文件的命令)

  `batch -f path/to/file`

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

## pkill

Signal process by name.(按姓名信号处理)

Mostly used for stopping processes.(主要用于停止过程)

- Kill all processes which match:(杀死所有匹配的进程)

  `pkill -9 process_name`

- Kill all processes which match their full command instead of just the process name:(终止所有与其完整命令匹配的进程，而不仅仅是进程名称)

  `pkill -9 -f "command_name"`

- Send SIGUSR1 signal to processes which match:(将SIGUSR1信号发送到匹配的进程)

  `pkill -USR1 process_name`

## atrm

Remove jobs scheduled by `at` or `batch` commands.(删除`at`或`batch`命令安排的作业)

To find job numbers use `atq`.(要查找工作号码，请使用`atq`)

- Remove job number 10:(删除职位编号10)

  `atrm 10`

- Remove many jobs, separated by spaces:(删除许多以空格分隔的作业)

  `atrm 15 17 22`

## atq

Show jobs scheduled by `at` or `batch` commands.(显示由`at`或`batch`命令安排的作业)

- Show the current user's scheduled jobs:(显示当前用户的预定作业)

  `atq`

- Show jobs from queue named 'a' (queues have single-character names):(从名为'a'的队列中显示作业（队列具有单字符名称）)

  `atq -q a`

- Show jobs of all users (run as super user):(显示所有用户的作业（以超级用户身份运行）)

  `sudo atq`

## at

Executes commands at a specified time.(在指定时间执行命令)

- Open an `at` prompt to create a new set of scheduled commands, press `Ctrl + D` to save and exit:(打开`at`提示符以创建一组新的预定命令，按`Ctrl + D`保存并退出)

  `at hh:mm:ss`

- Execute the commands and email the result using a local mailing program such as sendmail:(执行命令并使用本地邮件程序（如sendmail）通过电子邮件发送结果)

  `at hh:mm:ss -m`

- Execute a script at the given time:(在给定时间执行脚本)

  `at hh:mm:ss -f path/to/file`

# 用户和工作组管理

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

## nologin

Alternative shell that prevents a user from logging in.(防止用户登录的备用shell)

- Set a user's login shell to `nologin` to prevent the user from logging in:(将用户的登录shell设置为“nologin”以防止用户登录)

  `chsh -s user nologin`

- Customize message for users with the login shell of `nologin`:(使用登录shell“nologin”为用户自定义消息)

  `echo "declined_login_message" > /etc/nologin.txt`

## groupdel

Delete existing user groups from the system.(从系统中删除现有的用户组)

- Delete an existing group:(删除现有组)

  `groupdel group_name`

## chsh

Change user's login shell.（更改用户的登录shell）

- Change shell:（改变shell）

  chsh -s path/to/shell_binary username

## gpasswd

Administer "/etc/group" and "/etc/gshadow".(管理“/etc/group”和“/etc/gshadow”)

- Define group administrators:(定义组管理员)

  `sudo gpasswd -A user1,user2 group`

- Set the list of group members:(设置组成员列表)

  `sudo gpasswd -M user1,user2 group`

- Create a password for the named group:(为命名组创建密码)

  `gpasswd group`

- Add a user to the named group:(将用户添加到命名组)

  `gpasswd -a user group`

- Remove a user from the named group:(从命名组中删除用户)

  `gpasswd -d user group`

## groupmod

Modify existing user groups in the system.(修改系统中现有的用户组)

- Change the group name:(更改组名称)

  `groupmod -n new_group_name old_group_name`

- Change the group id:(更改组id)

  `groupmod -g new_group_id old_group_name`

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

## logname

Shows the user's login name.(显示用户的登录名)

- Display the currently logged in user's name:(显示当前登录的用户名)

  `logname`

## groups

Print group memberships for a user.（打印用户的组成员身份）

- Print group memberships for the current user:（打印当前用户的组成员身份）

  `groups`

- Print group memberships for a specific user:（打印特定用户的组成员身份）

  `groups username`

- Print group memberships for a list of users:（打印用户列表的组成员身份）

  `groups username1 username2 username3`

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

## su

Switch shell to another user.（将shell切换到另一个用户）

- Switch to superuser (admin password required):（切换到超级用户(需要管理密码)）

  `su`

- Switch to user username (password required):（切换到用户名(需要密码)）

  `su username`

- Switch to user username and simulate a full login shell:（切换到user username并模拟完整的登录shell）

  `su - username`

## usermod

Modifies a user account.(修改用户帐户)

- Change a user's name:(更改用户名)

  `usermod -l newname user`

- Add user to supplementary groups (mind the whitespace):(将用户添加到补充组(注意空格))

  `usermod -a -G group1,group2 user`

- Create a new home directory for a user and move their files to it:(为用户创建一个新的主目录并将其文件移动到其中)

  `usermod -m -d /path/to/home user`

## groupadd

Add user groups to the system.(将用户组添加到系统)

- Create a new Linux group:(创建一个新的Linux组)

  `groupadd group_name`

- Create new group with a specific groupid:(使用特定的groupid创建新组)

  `groupadd group_name -g group_id`

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

# X-Windows

## xclip

X11 clipboard manipulation tool, similar to `xsel`.(X11剪贴板操作工具，类似于`xsel`。)

Handles the X primary and secondary selections, plus the system clipboard (`Ctrl + C`/`Ctrl + V`).(处理X主要和次要选择，以及系统剪贴板（`Ctrl + C` /`Ctrl + V`）)

- Copy the output from a command to the X11 primary selection area (clipboard):(将命令的输出复制到X11主选择区域（剪贴板）)

  `echo 123 | xclip`

- Copy the output from a command to a given X11 selection area:(将命令的输出复制到给定的X11选择区域)

  `echo 123 | xclip -selection primary|secondary|clipboard`

- Copy the contents of a file to the system clipboard, using short notation:(使用简短表示法将文件内容复制到系统剪贴板)

  `echo 123 | xclip -sel clip`

- Copy the contents of a file into the system clipboard:(将文件的内容复制到系统剪贴板中)

  `xclip -sel clip input_file.txt`

- Paste the contents of the X11 primary selection area to the console:(将X11主选择区域的内容粘贴到控制台)

  `xclip -o`

- Paste the contents of the system clipboard to the console:(将系统剪贴板的内容粘贴到控制台)

  `xclip -o -sel clip`

- Paste the contents of the system clipboard into a file:(将系统剪贴板的内容粘贴到文件中)

  `xclip -o -sel clip > output_file.txt`

# SELinux

## chcon

Change SELinux security context of a file or files/directories.(更改文件或文件/目录的SELinux安全上下文)

- View security context of a file:(查看文件的安全上下文)

  `ls -lZ path/to/file`

- Change the security context of a target file, using a reference file:(使用参考文件更改目标文件的安全上下文)

  `chcon --reference=reference_file target_file`

- Change the full SELinux security context of a file:(更改文件的完整SELinux安全上下文)

  `chcon user:role:type:range/level filename`

- Change only the user part of SELinux security context:(仅更改SELinux安全上下文的用户部分)

  `chcon -u user filename`

- Change only the role part of SELinux security context:(仅更改SELinux安全上下文的角色部分)

  `chcon -r role filename`

- Change only the type part of SELinux security context:(仅更改SELinux安全上下文的类型部分)

  `chcon -t type filename`

- Change only the range/level part of SELinux security context:(仅更改SELinux安全上下文的范围/级别部分)

  `chcon -l range/level filename`

# 文件系统管理

## repquota

Display a summary of existing file quotas for a filesystem.(显示文件系统的现有文件配额的摘要)

- Report stats for all quotas in use:(报告所有使用配额的统计数据)

  `sudo repquota -all`

- Report quota stats for all users, even those who aren't using any of their quota:(报告所有用户的配额统计信息，即使是那些未使用任何配额的用户)

  `sudo repquota -v filesystem`

- Report on quotas for users only:(仅针对用户报告配额)

  `repquota --user filesystem`

- Report on quotas for groups only:(仅报告组的配额)

  `sudo repquota --group filesystem`

- Report on used quota and limits in a human-readable format:(以人类可读的格式报告使用的配额和限额)

  `sudo repquota --human-readable filesystem`

- Report on all quotas for users and groups in a human-readable format:(以人类可读的格式报告用户和组的所有配额)

  `sudo repquota -augs`

## sync

Flushes all pending write operations to the appropriate disks.(将所有挂起的写操作刷新到适当的磁盘)

- Flush all pending write operations on all disks:

  `sync`

- Flush all pending write operations on a single file to disk:(将单个文件上所有挂起的写操作刷新到磁盘)

  `sync path/to/file`

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

## mountpoint

Test if a directory is a filesystem mountpoint.(测试目录是否为文件系统挂载点)

- Check if a directory is a mountpoint:(检查目录是否为挂载点)

  `mountpoint path/to/directory`

- Check if a directory is a mountpoint without showing any output:(检查目录是否为挂载点而不显示任何输出)

  `mountpoint -q path/to/directory`

- Show major/minor numbers of a mountpoint's filesystem:(显示mountpoint文件系统的主要/次要编号)

  `mountpoint --fs-devno path/to/directory`

## umount

Unlink a filesystem from its mount point, making it no longer accessible.(从挂载点断开文件系统的链接，使其不再可访问)
A filesystem cannot be unmounted when it is busy.(文件系统繁忙时无法卸载)

- Unmount a filesystem, by passing the path to the source it is mounted from:(通过将路径传递到挂载文件系统的源，卸载文件系统)

  `umount path/to/device_file`

- Unmount a filesystem, by passing the path to the target where it is mounted:(通过将路径传递到安装文件系统的目标，卸载文件系统)

  `umount path/to/mounted_directory`

- Unmount all mounted filesystems (except the `proc` filesystem):(卸载所有已安装的文件系统(除了“proc”文件系统))

  `umount -a`

## fsck

Check the integrity of a filesystem or repair it. The filesystem should be unmounted at the time the command is run.(检查或修复文件系统的完整性。应该在运行命令时卸载文件系统)

- Check filesystem /dev/sda, reporting any damaged blocks:(检查文件系统/ dev / sda，报告任何已损坏的块)

  `fsck /dev/sda`

- Check filesystem /dev/sda, reporting any damaged blocks and interactively letting the user choose to repair each one:(检查文件系统/ dev / sda，报告任何已损坏的块并以交互方式让用户选择修复每个块)

  `fsck -r /dev/sda`

- Check filesystem /dev/sda, reporting any damaged blocks and automatically repairing them:(检查文件系统/ dev / sda，报告任何已损坏的块并自动修复它们)

  `fsck -a /dev/sda`

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

## mke2fs/mkfs.ext2

Creates a Linux filesystem inside a partition.(在分区内创建一个Linux文件系统)

- Create an ext2 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext2文件系统(' sdb1 '))

  `mkfs.ext2 /dev/sdb1`

- Create an ext3 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext3文件系统(' sdb1 '))

 ` mkfs.ext3 /dev/sdb1`

- Create an ext3 filesystem in partition 1 of device b (`sdb1`):(在设备b的分区1中创建一个ext3文件系统(' sdb1 '))

  `mkfs.ext3 /dev/sdb1`

# 系统关机和重启

## halt

Power off or reboot the machine.(关闭电源或重启机器)

- Power the machine off:(关闭机器电源)

  `halt`

- Reboot the machine:(重新启动机器)

  `halt --reboot`

## reboot

Reboot the system.(重新启动系统)

- Reboot immediately:(立即重新启动)

  `reboot`

- Reboot immediately without gracefully shutdown:(立即重启，而不是优雅地关闭)

  `reboot -f`

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

## poweroff

Shutdown the system.(关闭系统)

- Poweroff the system:(关闭系统电源)

  `sudo poweroff`


* * *
网络管理
* * *

# 网络应用

## axel

Download accelerator.(下载加速器)

Supports HTTP, HTTPS, and FTP.(支持HTTP，HTTPS和FTP)

Homepage: <https://github.com/axel-download-accelerator/axel>.

- Download a URL to a file:(下载文件的URL)

  `axel url`

- Download and specify filename:(下载并指定文件名)

  `axel url -o filename`

- Download with multiple connections:(下载多个连接)

  `axel -n connections_num url`

- Search for mirrors:(搜索镜像)

  `axel -S mirrors_num url`

- Limit download speed (bytes per second):(限制下载速度（每秒字节数）)

  `axel -s speed url`

## curl

Transfers data from or to a server.(从服务器传输数据或向服务器传输数据)

Supports most protocols, including HTTP, FTP, and POP3.(支持大多数协议，包括HTTP，FTP和POP3)

- Download the contents of an URL to a file:(将URL的内容下载到文件)

  `curl http://example.com -o filename`

- Download a file, saving the output under the filename indicated by the URL:(下载文件，将输出保存在URL指示的文件名下)

  `curl -O http://example.com/filename`

- Download a file, following [L]ocation redirects, and automatically [C]ontinuing (resuming) a previous file transfer:(在[L]ocation重定向后下载文件，并自动[C]继续（恢复）先前的文件传输)

  `curl -O -L -C - http://example.com/filename`

- Send form-encoded data (POST request of type `application/x-www-form-urlencoded`):(发送表单编码数据（类型为`application / x-www-form-urlencoded`的POST请求）)

  `curl -d 'name=bob' http://example.com/form`

- Send a request with an extra header, using a custom HTTP method:(使用自定义HTTP方法发送带有额外标头的请求)

  `curl -H 'X-My-Header: 123' -X PUT http://example.com`

- Send data in JSON format, specifying the appropriate content-type header:(以JSON格式发送数据，指定适当的内容类型标头)

  `curl -d '{"name":"bob"}' -H 'Content-Type: application/json' http://example.com/users/1234`

- Pass a user name and password for server authentication:(传递用于服务器身份验证的用户名和密码)

  `curl -u myusername:mypassword http://example.com`

- Pass client certificate and key for a resource, skipping certificate validation:(传递客户端证书和资源密钥，跳过证书验证)

  `curl --cert client.pem --key key.pem --insecure https://example.com`

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

## elinks

A text based browser similar to lynx.(基于文本的浏览器，类似于lynx)

- Start elinks:(开始)

  `elinks`

- Quit elinks:(退出)

  `Ctrl + C`

- Dump output of webpage to console, colorizing the text with ANSI control codes:（将网页转储到控制台，使用ANSI控制代码对文本着色）

  `elinks -dump -dump-color-mode 1 url`

## ipcalc

Perform simple operations and calculations on IP addresses and networks.（对IP地址和网络执行简单的操作和计算）

- Show information about an address or network with a given subnet mask:（显示有给定子网掩码的地址或网络的信息）

  `ipcalc 1.2.3.4 255.255.255.0`

- Show information about an address or network in CIDR notation:（以CIDR表示法显示有关地址或网络的信息）

  `ipcalc 1.2.3.4/24`

- Show the broadcast address of an address or network:（显示地址或网络的广播地址）

  `ipcalc -b 1.2.3.4/30`

- Show the network address of provided IP address and netmask:（显示提供的IP地址和网络掩码的网络地址）

  `ipcalc -n 1.2.3.4/24`

- Display geographic information about a given IP address:（显示有关给定IP地址的地理信息）

  `ipcalc -g 1.2.3.4`
