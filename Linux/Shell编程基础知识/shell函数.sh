#!/bin/bash

function funWithReturn(){  # function 不是必须的 反而省去更常见
  echo "这个函数会对输入的两个数字进行相加运算..."
  echo "输入第一个数字: "
  read aNum  #没有$
  echo "输入第二个数字: "
  read anotherNum
  echo "两个数字分别为 $aNum 和 $anotherNum !"
  return $(( $aNum + $anotherNum ))  # return 如果不加，将以最后一条命令运行结果，作为返回值。
}

funWithReturn    # 调用  不需要括号
echo "输入的两个数字之和为 $? !"  #函数返回值在调用该函数后通过 $? 来获得。



# 函数参数

funWithParam(){
  echo "第一个参数为 $1 !"
  echo "第二个参数为 $2 !"  # 特殊 第10个参数 用${10}获取
}

funWithParam  1 2 3 4
