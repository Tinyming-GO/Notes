#!/bin/bash

# if elif else fi

a=10
b=20

if [ $a == $b ] 
then
  echo 'a eq b'
elif [ $a -gt $b ]
then 
  echo 'a gt b'
else
  echo 'a lt b'
fi


# if else语句经常与test命令结合使用
if test $[a] -eq $[b]
then
  echo 'a eq b'
else
  echo 'a neq b'
fi


# for 循环

for str in "This is a string"
do
  echo $str  # 输入 This is a string , 用引号没有效果！  
  break
done

for str in This is a string
do
  echo $str  # This   按空格遍历
  break
done

#或者

for (( i=1; i<=5; i++ ))   # 两个(()), 不能用[]!!!!
do
  echo "这是第 $i 次调用"
done


# while 语句

int=1

while(( $int<=5 ))  # (()) 双小括号！！
do
  echo $int
  let "int++"   # let命令 用于执行一个或多个表达式；  变量计算中不需要加上 $ 来表示变量！！！
done


# 无限循环

#while :
#do
#  command;
#done

#while true
#do
#  command;
#done

# for (( ; ; ))


# until 循环

a=0

until [ ! $a -lt 10 ]
do
  echo $a
  a=`expr $a + 1`
done


# case 

echo '请输入1 到 4 之间的数字：'
read aNum
case $aNum in
  1) echo '你选择了 1'
  ;;
  2) echo '你选择了 2'
  ;;
  3) echo '你选择了 3'
  ;;
  4) echo '你选择了 4'
  ;;
  *) echo '你没有输入 1 到 4 之间的数字'  # 使用星号*匹配余下模式。
esac


# break 跳出全部循环  continue 跳出当前循环









