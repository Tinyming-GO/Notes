#!/bin/bash

# test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

num1=2
num2=2

echo $num1
echo ${num1}
echo $[num1]

if test ${num1} -eq $[num2]
then
  echo '两个数相等！'
else
  echo '两个数不相等！'
fi

# 两者是等价的

if [ $num1 -eq $num2 ]
then
  echo '两个数相等！'
else
  echo '两个数不相等！'
fi
