#!/bin/bash

:<<EOF
算数运算符
关系运算符
布尔运算符
字符串运算符
文件测试运算符
EOF

#原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。


# 算术运算符  + -  *  /  %  =  ==  !=

a=10
b=20
val=`expr $a + $b`
echo "a+b=$val"

val=`expr $a \* $b`  # * 是特例，必须加 \
echo "a*b=$val"

if [ $a != $b ]
then
  echo "a 不等于 b"
fi


# 关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
# -eq  -ne  -gt  -lt  -ge  -le

if [ $a -eq $b ]
then
  echo "a等于b"
else
  echo "a不等于b"
fi

# 布尔运算符  !  -o  -a

if [ $a -lt 100 -a $b -gt 15 ]
then
  echo "a 小于100 且 b 大于15"
fi

# 逻辑运算符 &&  ||

if [[ $a -lt 100 && $b -gt 100 ]]  # 双[] !!! 
then 
  echo "返回 true"
else
  echo "返回 false"
fi

# 字符串运算符 =  !=  -z  -n  str

a="abc"
b="efg"

if [ $a = $b ]
then
  echo "$a=$b : a等于b"
else
  echo "$a=$b : a不等于b"
fi

if [ $a != $b ]
then
  echo "$a!=$b : a不等于b"
else
  echo "$a!=$b : a等于b"
fi

if [ -z $a ]
then
  echo "-z $a : 字符串长度为0"
else
  echo "-z $a : 字符串长度不为0"
fi

if [ -n $a ]
then
  echo "-n $a : 字符串长度不为0"
else
  echo "-n $a : 字符串长度为0"
fi

if [ $a ]
then 
  echo "$a : 字符串不为空"
else
  echo "$a : 字符串为空"
fi


# 文件测试运算符  -b  -c  -d   -f  -g   -k  -p   -u  -r   -w  -x  -s  -e

file="/home/xiaoming/README.md"

if [ -e $file ]
then
  echo "文件存在！"
else
  echo "文件不存在！"
fi

if [ -s $file ]
then 
  echo "文件不为空！"
else
  echo "文件为空！"
fi

if [ -x $file ]
then
  echo "文件可执行！"
else
  echo "文件不可执行！"
fi

if [ -r $file ]
then
  echo "文件可读！"
else
  echo "文件不可读！"
fi

if [ -w $file ]
then 
  echo "文件可写"
else
  echo "文件不可写"
fi

if [ -f $file ]
then
  echo "文件是普通文件"
else
  echo "文件不是普通文件"
fi

if [ -d $file ]
then
  echo "是目录"
else
  echo "不是目录"
fi
