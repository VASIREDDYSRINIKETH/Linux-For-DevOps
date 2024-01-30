# User and Group Management in Linux

## User Management in Linux

User management in Linux involves creating, modifying, and deleting user accounts, while group management deals with organizing users into logical groups with shared permissions. This guide provides an overview of user and group management in Linux systems.

## User Account Types in Linux


| Account Type   | Access Level                                                                                   | Usage                                                                                                           |
|----------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| Root User      | Access to the entire Linux system. Root users can initiate any command, modify system settings, edit files, or install software without restrictions. | Primarily used to perform system administration tasks.                                                          |
| Standard User  | User privileges are limited. Standard users cannot perform actions that affect core system settings or other user accounts.                                   | Basic access for utilizing various system resources.                                                            |
| Sudo User      | A standard user who has been granted permissions to execute certain commands as the root user. | Every command that requires root privileges must be preceded with the sudo command.                               |
| System Account| User accounts for applications or automated services that need to perform specific tasks on the Linux system.                                           | System accounts operate with restricted permissions to enhance security and control over system operations.       |
| Guest User     | Temporary accounts with restricted and controlled privileges.                                  | Users that need access for a limited time and do not require personal files and settings.                        |
| User Groups    | Permissions are assigned to a collection of users who are organized into logical groups with identical permissions.                                      | Admins can manage permissions for an entire user group instead of managing individual user accounts.             |

## Understanding User Management Files

Linux stores user and group data in specific files and directories. System administrators interact with these files to control and modify user and group settings. 

### Main Files and Directories

- `/etc/passwd`: Contains user account information like usernames, IDs, home directories, and shells.
- `/etc/group`: Stores data about user groups including group names, IDs, and members.
- `/etc/sudoers`: Specifies which users can run commands with elevated permissions via sudo.
- `/etc/shadow`: Holds encrypted user passwords and related information, accessible only by privileged users.
- `/etc/gshadow`: Similar to `/etc/shadow` but for group passwords.
- `/etc/skel`: Contains default settings and templates copied to new user accounts' home directories.
- `/etc/login.defs`: Contains system-wide user account policy settings, like password aging rules.

## Group Management in Linux

There are two categories of groups in Linux: Primary and Secondary groups.

### Primary Group

The primary group is automatically generated while creating a user. It has the same ID as the user and the user becomes its first and only member.

### Secondary Group

Secondary groups can be created separately, and users can be added to them by changing the group ID of users.