# Sed and Regular Expressions (Regex)

## What is `sed`?

`sed`, which stands for **Stream EDitor**, is a powerful command-line utility used for parsing and transforming text files. It is particularly useful for performing search-and-replace operations and other text manipulations in a scriptable manner.

## What are Regular Expressions (Regex)?

Regular expressions, often abbreviated as regex, are sequences of characters that define a search pattern. They are used for pattern matching within strings. Regular expressions are a powerful tool for searching, extracting, and manipulating text based on patterns.

## `sed` Syntax:

`sed` follows the syntax:

```
sed OPTIONS 'COMMAND' INPUT_FILE
```
Where:

- `OPTIONS`: Various options that modify the behavior of `sed`.
- `'COMMAND'`: The `sed` command or script to execute.
- `INPUT_FILE`: The file(s) to process.

## Command Options:

| Option          | Description                                                                          |
|-----------------|--------------------------------------------------------------------------------------|
| `-n`            | Suppress automatic printing of pattern space.                                        |
| `-e script`     | Add the script to the commands to be executed.                                       |
| `-f script-file`| Add the commands contained in the script file to the commands to be executed.        |
| `-i[SUFFIX]`    | Edit files in place (makes changes directly to the file).                             |
| `-r`, `-E`      | Use extended regular expressions (supports additional metacharacters).                |
| `-s`            | Consider files as separate rather than as a single continuous stream.                 |
| `-u`            | Use unbuffered input/output.                                                         |
| `--help`        | Display a help message and exit.                                                     |
| `--version`     | Output version information and exit.        


## Example

