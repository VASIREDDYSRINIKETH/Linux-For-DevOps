# File Management in Linux

File management in Linux refers to the processes and tools used to create, organize, manipulate, and maintain files and directories within the Linux operating system. It encompasses a range of tasks, including creating, copying, moving, renaming, deleting, and searching for files, as well as setting permissions and ownership.

## File Permissions

Every file or directory within Linux has a set of permissions that control who may read, write, and execute the contents. Each of these permissions is represented by an abbreviation (r, w, or x) and has an octal value.

### Table

| Abbreviation | File/Directory Permission | Octal Value | Description                                               |
|--------------|---------------------------|-------------|-----------------------------------------------------------|
|    Read (r)  |   Allows file viewing     |      4      | The file can be viewed or copied. Directory contents can be listed using `ls`. |
|   Write (w)  |  Allows file modification |      2      | The file content can be modified. Files can be created or deleted within the directory. |
|  Execute (x) |  Allows file execution    |      1      | The file can be executed (for shell scripts or executables). Access to the directory is controlled. |

There are a set of read, write, and execute permissions for the user who owns the file, for everybody in the group he/she belongs to, and for all other users.

| Category | u (user) | g (group) | o (other) |
|----------|----------|-----------|-----------|
| Permission | r w x | r w x | r w x |
| Value | 4 2 1 | 4 2 1 | 4 2 1 |

## Example: "-rwx-rwx-rwx"

Here, the leading hyphen "-" denotes that this is a regular file. If it were a directory, there would be a "d" instead of a hyphen. The permissions breakdown is as follows:

- The first triplet "rwx" refers to the permissions for the owner (user) of the file.
- The second triplet "rwx" refers to the permissions for the group associated with the file.
- The third triplet "rwx" refers to the permissions for all other users (those who are not the owner or in the group).

## Deciding On Appropriate Permissions

You can change file permissions by using the `chmod` command followed by the octal values that reflect the permissions you want to set. To decide on the permissions:

1. Work out what you want each category of user to be able to do and the appropriate octal value for this (see the table).
2. Take these 3 octal values and put them together to form a set which will be the permissions for that file.

For example, if we want a user to be able to read and write to a file but the group and others to only be able to read that file, then the permissions for this file would need to be set to 644.

| Category  | u (user) | g (group) | o (other) |
|-----------|----------|-----------|-----------|
| Permission| r w      | r        | r         |
| Value     | 4 + 2    | 4         | 4         |
| Total     | 6        | 4         | 4         |

## Typical File Permissions

| Octal Value | Permissions | 
|-------------|-------------| 
| 644         | rw-r--r--   |
| 711         | rwx--x--x   |
| 754         | rwxr-xr--   |
| 755         | rwxr-xr-x   |
