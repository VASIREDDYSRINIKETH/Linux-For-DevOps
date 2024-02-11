# AWK Command

The `awk` command is a powerful method for processing or analyzing text or data files, which are organized by lines (rows or records) and columns (fields).

We can use `awk` as a Linux command and also as a scripting language like Bash shell scripting.

## Simple AWK Command Syntax

Simple awk command syntax:

- `awk [options] ‘[selection _criteria] {action }' input-file`
- `cat input-file | awk [options] ‘[selection _criteria] {action }' input-file`

Awk can take the following options:

- `-F fs`: To specify a field separator. (Default separator is tab and space)
- `-f file`: To specify a file that contains awk script.
- `-v var=value`: To declare a variable.

Selection criteria: pattern/condition

Action: It is a logic to perform action on each row/record.

Simple awk command syntax:

- `awk ' {action }' input-file`

Action: Action is a logic to perform action on each record.

Example: print $1 print first filed from each line

Some of the default variables for awk:

- $0: Entire file
- $1: First field from each line/record
- $2: Second field from each line/record
- NR: It will print line or record number
- NF: It will print number of filed from each line/record
