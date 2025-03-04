#!/bin/bash

# 递归查找并删除可执行文件
find "." -type f -executable -exec rm -fv {} + 
