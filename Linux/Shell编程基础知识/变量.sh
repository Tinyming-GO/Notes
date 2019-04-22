#!/bin/bash

your_name="xiaoming"  #变量名和等号之间不能有空格(=前后都不能有空格)
echo $your_name

myurl="http://localhost"
readonly myurl  #定义为只读变量 修改会报错！  不需要$

unset your_name  #删除变量  unset不能删除只读变量！  不需要$
echo -e "!------------\n"

#拼接字符
your_name="xiaoming"
greeting="hello, $your_name !"
greeting='hello, '$your_name' !'

#获取字符串长度
echo ${#your_name}
echo -e "!------------\n"

#提取字符串
string="runoob is a great site"
echo ${string:1:4}  #输出 unoo  从0开始
echo -e "!------------\n"

#查找子字符串
echo `expr index "$string" o`  #输出4 从1开始
echo -e "!------------\n"

#数组定义
array_1=(1,2,3)  # 小括号
array_1=(
1
2
3
)
#修改元素
array_1[2]=4
#读取数组
echo ${array_1[2]}
echo -e "!------------\n"

#读取所有元素
echo ${array_1[@]}
echo -e "!------------\n"

#取得数组元素的个数
length=${#array_1[@]}
#或者
lenght=${#array_1[*]}
#取得数组单个元素的长度
lenghtn=${#array_1[1]}
echo -e "!------------\n"

#多行注释
:<<EOF
这是注释
这是注释
EOF

