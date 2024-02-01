# Linux Redirection

Redirection can be defined as changing the way from where commands read input to where commands sends output. You can redirect input and output of a command.

For redirection, meta characters are used. Redirection can be into a file (shell meta characters are angle brackets '<', '>') or a program ( shell meta characters are pipesymbol '|').

## Standard Streams In I/O Redirection

The bash shell has three standard streams in I/O redirection:

- `standard input (stdin)` : The stdin stream is numbered as stdin (0). The bash shell takes input from stdin. By default, keyboard is used as input.
- `standard output (stdout)` : The stdout stream is numbered as stdout (1). The bash shell sends output to stdout. Output goes to display.
- `standard error (stderr)` : The stderr stream is numbered as stderr (2). The bash shell sends error message to stderr. Error message goes to display.

## example

## Standard Output

`echo Sent to the terminal`

```
Output
Sent to the terminal
```

## Standard Error

`ls %`

Since % is not an existing directory, this will send the following text to standard error:

```
Output
ls: cannot access %: No such file or directory
```

Commands with a single bracket overwrite the destination’s existing contents.

**Overwrite**

`> - standard output`

`< - standard input`

`2> - standard error`

Commands with a double bracket do not overwrite the destination’s existing contents.

**Append**

`>> - standard output`

`<< - standard input`

`2>> - standard error`

**Pipes**

Pipes are used to redirect a stream from one program to another. When a program’s standard output is sent to another through a pipe, the first program’s output will be used as input to the second, rather than being printed to the terminal. Only the data returned by the second program will be displayed.

The Linux pipe is represented by a vertical bar:  `|`

Here is an example of a command using a pipe:

`ls | less`

This takes the output of ls, which displays the contents of your current directory, and pipes it to the less program. less displays the data sent to it one line at a time.

ls normally displays directory contents across multiple rows. When you run it through less, each entry is placed on a new line.

Though the functionality of the pipe may appear to be similar to that of > and >>, the distinction is that pipes redirect data from one command to another, while > and >> are used to redirect exclusively to files.


**Filters**

1.find Command:

The find command is used to search for files and directories within a specified directory hierarchy based on various criteria such as name, type, size, permissions, etc.

Example usage:
`
find /path/to/search -name "*.txt"`

This command searches for all files with a .txt extension within the /path/to/search directory and its subdirectories.

2.locate Command:
   
The locate command is used to quickly locate files by name. It searches through a pre-built database of files and directories on the system, providing faster results than find for locating files by name.

Example usage:

`locate myfile.txt
`

This command searches for the file named myfile.txt in the entire filesystem and prints out its path if found.

3.tee Command:

The tee command is used to read from standard input and write to standard output and files simultaneously. It is often used in conjunction with other commands to display output on the terminal while also saving it to a file.

Example usage:

`ls -l | tee directory_listing.txt`

This command lists the contents of the current directory using ls -l and saves the output both to the terminal and to a file named directory_listing.txt.

The pipe | takes the output of ls -l (the file listing) and redirects it as input to the tee command.

The tee command receives the file listing from ls -l. It then does two things simultaneously:

a. Displays the file listing on the terminal screen.

b. Writes the same file listing to a file named directory_listing.txt in the current directory.

4.tr Command:

The tr command stands for "translate" or "transliterate" and is used to translate or delete characters.

Syntax:

`tr [options] set1 [set2]`

Example:

```
$ echo "Hello World" | tr '[:lower:]' '[:upper:]'
HELLO WORLD
```

In this example, tr is used to translate lowercase letters to uppercase.

Let's say you have a string "hello123world456" and you want to delete all the digits from it:

```
$ echo "hello123world456" | tr -d '[:digit:]'

```

Output:

`helloworld`

In this example, the -d option is used to delete characters. '[:digit:]' is a character class representing all digits. So, tr -d '[:digit:]' deletes all digits from the input string.

5.wc Command:

The wc command stands for "word count" and is used to count the number of lines, words, and characters in a file.

Syntax:

`wc [options] [file]`

Example:

```
$ wc myfile.txt
10 20 150 myfile.txt

```
In this example, myfile.txt has 10 lines, 20 words, and 150 characters.

