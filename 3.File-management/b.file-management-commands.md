# Changing File Permissions with `chmod`

The `chmod` command in Unix-based systems is used to change the permissions of a file or directory. It stands for "change mode". The permissions specify who can read, write, or execute a file.

## Syntax

`chmod [options] mode file`

## Commonly Used Options

- `-R`: Recursively changes permissions of directories and their contents.
- `+`: Adds the specified permissions to the file or directory.
- `-`: Removes the specified permissions from the file or directory.
- `=`: Sets the permissions exactly as specified.

## Modes

- **Numeric Mode**: Represented by a 3 or 4-digit number.
  - Each digit represents the permissions for owner, group, and others, respectively.
  - 4 = read, 2 = write, 1 = execute. Sum the values to set permissions.

  Example: `chmod 755 file.txt` (Owner can read, write, and execute; Group and others can read and execute.)

- **Symbolic Mode**: Uses letters to represent permissions.
  - `u` for user/owner, `g` for group, `o` for others, `a` for all.
  - `+`, `-`, `=` to add, remove, or set permissions.
  - `r` for read, `w` for write, `x` for execute.

  Example: `chmod u+x file.txt` (Adds execute permission for the file's owner.)

## Examples

1. Give execute permission to the owner of a file:

`chmod u+x file.txt`

2.Remove write permission from group and others for a directory and its contents:

 `chmod -R go-w directory/`

3.Set permissions to read-only for all users:

 `chmod a=r file.txt`

4.Give execute permission to the owner of a file using octal notation:
   chmod 700 file.txt

5.Remove write permission from group and others for a directory and its contents using octal notation:

`chmod -R 750 directory/`

6.Set permissions to read-only for all users using octal notation:

`chmod 444 file.txt`

## Changing Ownership with `chown`

The `chown` command in Unix-like operating systems is used to change the owner and group of files or directories. It stands for "change owner".

## Syntax

`chown [options] owner:group file(s)/directory(s)`

### Options

Various options can be used with `chown` to modify its behavior, such as `-R` for recursively changing ownership of directories and their contents.

### Components

- `owner`: The new owner of the file or directory.
- `group`: The new group of the file or directory.
- `file(s)/directory(s)`: The file(s) or directory(s) whose ownership you want to change.

## Examples

1. Change the owner of a file:

 `chown user1:group1 file.txt`

2. Change the owner and group of a directory and its contents recursively:

 `chown -R user1:group1 directory/`

3. Change only the group of a file:

 `chown :group2 file.txt`

4. Change the owner without changing the group:

 `chown user2 file.txt`
