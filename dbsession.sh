#!/bin/bash

curdir=`dirname $0`
source ${curdir}/db.cnf

echo "SHOW STATUS LIKE 'Threads_connected';" | ${MYSQLCMD} --skip-column-names -B >> /home/migu/daycheck/`date +%y.%m.%d-session`
# 获取前一天的日期
previous_date=$(date -d "yesterday" +%y.%m.%d)

# 构建文件路径
file_path="/home/migu/daycheck/${previous_date}-session"

# 检查文件是否存在
if [ -f "$file_path" ]; then
  # 删除文件（不进行确认提示）
  rm -f "$file_path"
  echo "文件已删除: $file_path"
else
  echo "文件不存在: $file_path"
fi
