#!/bin/bash
backup_dir="backup"
mkdir -p "$backup_dir"

file="file.txt"
cp "$file" "$backup_dir/file_$(date +%Y%m%d).txt"
echo "Backup created: $backup_dir/file_$(date +%Y%m%d).txt"
