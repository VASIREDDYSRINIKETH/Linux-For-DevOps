# Understanding Wildcards in Linux

In Linux, wildcards are special characters used to represent one or more characters within filenames or text strings. They provide a powerful and flexible way to work with multiple files or directories at once. Here are some of the most commonly used wildcards:


- **`*` (asterisk)**: Represents zero or more characters in a filename or text string. For example, `*.txt` matches all files with a `.txt` extension.  
  Example: `ls *.txt`

- **`?` (question mark)**: Represents exactly one character in a filename or text string. For example, `image?.jpg` matches `image1.jpg`, `image2.jpg`, but not `image10.jpg`.  
  Example: `ls image?.jpg`

- **`[]` (square brackets)**: Represents any single character within the brackets. For example, `file[123].txt` matches `file1.txt`, `file2.txt`, or `file3.txt`.  
  Example: `ls file[123].txt`

- **`[!]` (square brackets with exclamation mark)**: Represents any single character not listed within the brackets. For example, `file[!123].txt` matches any file with `.txt` extension except `file1.txt`, `file2.txt`, or `file3.txt`.  
  Example: `ls file[!123].txt`

- **`{}` (curly braces)**: Represents a comma-separated list of strings. For example, `mv file{1,2}.txt directory/` moves both `file1.txt` and `file2.txt` to the `directory/` directory.  
  Example: `mv file{1,2}.txt directory/`

Wildcards are commonly used with commands like `ls`, `cp`, `mv`, `rm`, etc., to perform operations on multiple files or directories based on a specified pattern.
