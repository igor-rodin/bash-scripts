#!/bin/bash
# Написать скрипт очистки директорий. На вход принимает путь к директории.
# Если директория существует, то удаляет в ней все файлы с расширениями .bak, .tmp, .backup. Если директории нет, то выводит ошибку.

if [ $# -ne 1 ]; then
    echo "Usage: $0 </path/to/dir>"
    exit 1
fi

abs_path=$(realpath $1)

if ! [ -d $abs_path ]; then
    echo "No such directory -> $abs_path"
    exit 1
fi

for file in $(ls $abs_path | grep -E "\.(bak|tmp|backup)$"); do
    path_to_file=$abs_path/$file
    if [ -f $path_to_file ]; then
        echo "removing -> $path_to_file"
        rm $path_to_file
    fi
done
