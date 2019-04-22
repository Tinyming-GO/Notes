#!/bin/bash

#使用 . 号来引用文件; 或者 source 关键字 

. ./变量.sh

# source ./变量.sh

echo $your_name

printf "我的用户名：%s" $your_name
