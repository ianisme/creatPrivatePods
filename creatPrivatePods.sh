#!/bin/sh
source ~/.bash_profile

echo '----------------私有库模版生成工具----------------'

basepath=$(cd `dirname $0`;pwd)

read -p "请输入私有库的名称: " name
if [ -z $name ];then
  echo "请输入正确的私有库名称！"
  exit
fi

echo "----------------开始创建私有库----------------"
pod lib create $name --template-url=https://github.com/ianisme/pod-template.git

echo "---------------podspec转为podspec.json-----------------"
cd $basepath/$name
pod ipc spec $name.podspec >> $name.podspec.json
rm $name.podspec


echo "全部完成"

exit 0

