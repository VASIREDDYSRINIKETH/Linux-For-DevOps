# Grep command

Grep is a useful command to search for matching patterns in a file. grep is short for "global regular expression print".

## Syntax of the grep Command

The syntax of the grep command is as follows:

```
grep [OPTION...] PATTERNS [FILE...]

```

- grep – the command instruction.
- [options] – modifiers to the command.
- pattern – the search query to be found.
- [FILE] – the file in which the command will be searching.


Additional usage examples include:

- `cat file | grep [options] "string/pattern"`
- `echo "some text" | grep [options] "string/pattern"`

## Basic Options

| Option | Description                                               |
|--------|-----------------------------------------------------------|
| `-i`   | Ignore case for matching/searching                        |
| `-w`   | Match whole words only                                    |
| `-v`   | Display lines that do not contain the given string/pattern|
| `-o`   | Print/display only the matched parts from matched lines   |
| `-n`   | Display line numbers for matched lines                    |
| `-c`   | Display the count of matched lines                        |
| `-A`   | Display N lines after the match                           |
| `-B`   | Display N lines before the match                          |
| `-C`   | Display N lines around the match                          |
| `-r`   | Recursively search under the current directory and its subdirectories|
| `-l`   | Display only the filenames containing the matched string |
| `-h`   | Hide filenames in the output                              |

## Advanced Options

| Option | Description                                                                      |
|--------|----------------------------------------------------------------------------------|
| `-f`   | Takes search strings/patterns from a file, one per line                          |
| `-e`   | Search for multiple strings/patterns                                             |
| `-E`   | Interpret the pattern as an extended regular expression                           |

Pattern is a string and it represents more than one string.

```
grep -E[options] “pattern” file/files
```

## Rules to Create Patterns in `grep`


| Rule              | Description                                                        | Example               |
|-------------------|--------------------------------------------------------------------|-----------------------|
| xy\|pq            | Matches for "xy" or "pq"                                           | `xy\|pq`              |
| ^xyz              | Matches for lines starting with "xyz"                               | `^xyz`                |
| xyz$              | Matches for lines ending with "xyz"                                 | `xyz$`                |
| ^$                | Matches for empty lines                                             | `^$`                  |
| \                 | Removes the special purpose of any symbol                          | `\^`, `\$`            |
| .                 | Matches any one character                                           | `.`                   |
| \.                | Matches exactly with "."                                            | `\.`                  |
| \b                | Matches the empty string at the edge of a word                     | `\b`                  |
| ?                 | Preceding character is optional and will be matched at most once   | `ab?`                 |
| *                 | Preceding character will be matched zero or more times             | `ab*`                 |
| +                 | Preceding character will be matched one or more times              | `ab+`                 |
| [xyz]             | Matches for lines having "x" or "y" or "z"                         | `[xyz]`               |
| [a-d]             | Matches for lines having "a", "b", "c", or "d"                     | `[a-d]`               |
| [a-ds-z]          | Matches for lines having "a", "b", "c", "s" to "z"                 | `[a-ds-z]`            |
| ^[abc]            | Matches for lines starting with "a", "b", or "c"                   | `^[abc]`              |
| [^abc]            | Matches for lines not starting with "a", "b", or "c"               | `[^abc]`              |
| {N}               | Preceding string matched exactly N times                           | `x{3}`                |
| {N,}              | Preceding string matched N or more times                           | `x{3,}`               |
| {N,M}             | Preceding string matched at least N times but not more than M times| `x{3,5}`              |

## Character Classes

Character classes provide shorthand notation for certain types of characters:

- `[[:alnum:]]`: Alphanumeric characters.
- `[[:alpha:]]`: Alphabetic characters.
- `[[:blank:]]`: Blank characters: space and tab.
- `[[:digit:]]`: Digits: '0 1 2 3 4 5 6 7 8 9'.
- `[[:lower:]]`: Lower-case letters.(a-z)
- `[[:space:]]`: Space characters: tab, newline, vertical tab, form feed, carriage return, and space.
- `[[:upper:]]`: Upper-case letters.(A-Z)


