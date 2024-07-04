#!/bin/bash

# 检查是否有提供文章标题参数
if [ -z "$1" ]; then
    echo "请提供文章标题作为参数."
    exit 1
fi

# 设置文章标题和文件名
post_title="$1"
post_file="content/art/zh/${post_title// /-}.zh.md"

# 创建新文章
hugo new "$post_file"

# 自动填充标题信息
sed -i "" -e "s/^title: .*/title: \"$post_title\"/" "$post_file"

echo "新文章 $post_file 已创建,并自动填充了标题信息."
echo "您可以继续编辑这个文件,然后运行 hugo server 进行预览."