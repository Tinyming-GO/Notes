#!/bin/bash

:<<EOF
command > file	将输出重定向到 file。
command < file	将输入重定向到 file。
command >> file	将输出以追加的方式重定向到 file。
n > file	将文件描述符为 n 的文件重定向到 file
n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
n >& m	将输出文件 m 和 n 合并。
n <& m	将输入文件 m 和 n 合并。
<< tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入。

需要注意的是文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。
EOF

echo `wc -l ./变量.sh`   # 60 ./变量.sh   会输出文件名

echo `wc -l < ./变量.sh`  # 60    不会输出文件名


echo `wc -l ./变量.sh 2 >> file.log`   #将stderr追加到file文件末尾


echo `wc -l ./变量.sh >> file.log 2>&1`   #将stdout和stderr 合并后重定向到 file



# 如果希望执行某个命令  但不希望 在屏幕上显示输出结果  ，那么可以将输出重定向到 /dev/null：
`ls -l > /dev/null`



