
# User Management Commands

## What is `sudo`?
`sudo` stands for "superuser do." It is a command used in Unix and Linux operating systems to allow a permitted user to execute a command as the superuser or another user, as specified in the `sudoers` file.

## What is `sudoers` file?
The `sudoers` file (`/etc/sudoers`) is a configuration file that determines which users are granted with privileges to run `sudo` commands. It defines rules regarding who can run what commands as which users on which machines.

## Commands

### Login as Root User
To login as the root user:
```bash
sudo su -
#This command starts a new shell as the root user (su stands for "switch user").

#Logout Command
#To logout from the root user:

exit
#This command exits the current shell session, returning you to your previous user.

#Switch User
#To switch from one user to another:

su - username

# Replace username with the name of the user you want to switch to. You will be prompted to enter the password of the target user.

sudo -i: This command is used to run a login shell as the superuser or root. It is similar to sudo su -, which starts a shell with root privileges. When you run sudo -i, you are prompted for your password (if required by your sudo configuration) and then given a shell session as the root user.

su root: This command is used to switch to the root user by starting a new shell session as root. Unlike sudo, which allows specific commands to be run with elevated privileges, su root switches to the root user for the duration of the session until you exit.
```

## Check Currently Logged Users

- `who`: Displays information about currently logged in users.
- `who -H`: Same as above, but with headers.
- `w`: Displays information about currently logged in users.

## Setting Passwords

- `passwd`: Allows users to set their own password or change it.

To set another user's password, run the following as root:

- `passwd username`

## List All Users

- `cat /etc/passwd`: Lists all user accounts configured on the system.

## Create User

- `useradd username`: Creates a new user with the specified username.

## Delete User

- `userdel username`: Deletes the specified user account.
- `userdel -r username`: Removes the specified user along with their home directory and mail spool.

## Modify Default User Settings

The `usermod` command in Linux is used to modify various attributes of an existing user account. Administrators can utilize several options with this command to change specific data points:

- `-d`: Changes the user's home directory.
  - Example: `sudo usermod -d /home/newhome username`

- `-s`: Changes the user's default shell.
  - Example: `sudo usermod -s /bin/zsh username`

- `-e`: Sets an account expiry date.
  - Example: `sudo usermod -e 2025-01-30 username`

- `-c`: Adds a comment to the user's entry.
  - Example: `sudo usermod -c "John Doe" username`

- `-u`: Changes the user's UID (User ID).
  - Example: `sudo usermod -u 1002 username`

- `-aG`: Adds the user to supplementary groups without removing existing group memberships.
  - Example: `sudo usermod -aG newgroup username`

These commands allow administrators to customize user accounts according to specific requirements.

## Linux User Group Management Commands

### Create Group

To create a new user group in Linux:

- `sudo groupadd groupname`

Replace `groupname` with the name of the group you want to create.

Use the `getent` command to confirm the new group is in the Linux `/etc/group` file:

- `getent group groupname`

### Delete Group

To delete an existing group:

- `sudo groupdel groupname`

### Add or Remove Members From Group

When you add a user to a group, they automatically receive the permissions associated with that group.

- To add a user to an existing group:
  - `sudo adduser username groupname`

- To append a user to an existing group while keeping them in their current groups:
  - `sudo usermod -aG groupname username`

Confirm if the user has been added by using the `groups` command:

- `groups username`

To remove a user from a specific group:

- `sudo deluser username groupname`

### Display All Groups a User Is a Member Of

To list the groups an individual user is a member of:

- `id username`
- `id -nG username`

### List all Groups and Members

The data about user groups is stored in the `/etc/group` file.

To retrieve the names of all user groups, group IDs, and group members from the file:

- `getent group`

You can parse this list to extract group members using a tool like `awk`:

- `getent group | awk -F: '$4 != "" {print $1 ": " $4}'`

These commands provide comprehensive management options for user groups in a Linux environment.


## User Management Commands:
1. Adding Users:

  - useradd: Adds a user to the system.
    Example: sudo useradd -m username
2. Deleting Users:

    - userdel: Deletes a user account.
    - Example: sudo userdel username

3. Modifying Users:

  - usermod: Modifies user account properties.
  - Example:
    - Add user to a group: sudo usermod -aG groupname username (-a is append and -G is group name to remove the user just use -G option alone)
    - Change user's shell: sudo usermod -s /bin/bash username
    - Change user's home directory: sudo usermod -d /path/to/new/home username

4. Changing User Password:

    - passwd: Changes user password.
    - Example: sudo passwd username

5. Listing Users:

    - cat /etc/passwd: Displays a list of all users on the system.
    -  getent passwd: Another way to list users.

6. Viewing User Information:

  - id: Shows user and group information.
  - Example: id username

7. Switching Users:

  - su: Switches user account.
  - Example: su - username (switches to username's account)

8. Setting User Expiry:

  - chage: Changes user password expiry information.
  - Example: sudo chage -E 2025-01-01 username

9. Locking/Unlocking User Accounts:

  - passwd -l: Locks a user account.
  - Example: sudo passwd -l username

  - passwd -u: Unlocks a user account.
  - Example: sudo passwd -u username

10. Group Management Commands:
  - Adding Groups:

  - groupadd: Adds a group to the system.
  - Example: sudo groupadd groupname

  - Deleting Groups:

  - groupdel: Deletes a group from the system.
  - Example: sudo groupdel groupname
  - Modifying Groups:

  - groupmod: Modifies group properties.
  - Example: sudo groupmod -n newgroupname oldgroupname (renames a group)
  -  Listing Groups:

  -  cat /etc/group: Displays a list of all groups on the system.
  - getent group: Another way to list groups.

11. Adding Users to Groups:

  - usermod -aG: Adds a user to a group.
  - Example: sudo usermod -aG groupname username
  - Removing Users from Groups:

  - Removing a user from a group typically involves editing the /etc/group file or using tools like gpasswd.
  - Managing Group Passwords:

  -  gpasswd: Manages group passwords (usually not commonly used).

Real-world Tasks:
Creating a new user:

bash
Copy code
sudo useradd -m username
sudo passwd username
Adding a user to a group:

bash
Copy code
sudo usermod -aG groupname username
Changing a user's home directory:

bash
Copy code
sudo usermod -d /path/to/new/home username
Creating a new group:

bash
Copy code
sudo groupadd newgroupname
Renaming a group:

bash
Copy code
sudo groupmod -n newgroupname oldgroupname
Deleting a user or group:

bash
Copy code
sudo userdel username
sudo groupdel groupname
Managing user password expiry:

bash
Copy code
sudo chage -E 2025-01-01 username
These commands should cover most tasks related to user and group management on a Linux system. Always ensure you have sufficient privileges (sudo or root) to execute these commands properly.

sudoers file task 
ChatGPT
Managing the sudoers file on a Linux system is crucial for granting and controlling administrative privileges. The sudoers file (/etc/sudoers) defines which users and groups are granted sudo privileges, specifying what commands they can run and under what conditions. Here are some tasks related to managing the sudoers file:

Editing the sudoers File
Editing with visudo:

visudo is the recommended way to edit the sudoers file because it checks for syntax errors before saving changes.
bash
Copy code
sudo visudo
This opens the sudoers file in your default editor (usually vi or vim). Make changes carefully and save the file to apply them.
Adding a User to sudoers:

To grant sudo privileges to a user:
bash
Copy code
sudo visudo
Add the following line:
sql
Copy code
username    ALL=(ALL:ALL) ALL
Replace username with the actual username. This grants the user username full sudo privileges.
Adding a Group to sudoers:

To grant sudo privileges to a group:
bash
Copy code
sudo visudo
Add the following line:
sql
Copy code
%groupname   ALL=(ALL:ALL) ALL
Replace groupname with the actual group name. This grants all users in groupname full sudo privileges.
Granting Specific Command Access:

To grant a user or group access to specific commands only, use the following syntax:
css
Copy code
username    ALL=(ALL) /path/to/command
This allows username to run /path/to/command with sudo.
Granting NOPASSWD Access:

To allow a user or group to run commands without entering a password:
sql
Copy code
username    ALL=(ALL:ALL) NOPASSWD: ALL
Replace ALL with specific commands if needed.
Including other Files:

You can include additional configuration files into sudoers using #include.
arduino
Copy code
#include /etc/sudoers.d/my_custom_config
This allows for modular configuration and easier management.
Best Practices
Use visudo: Always edit the sudoers file with visudo to avoid syntax errors.
Be Specific: Grant minimal sudo privileges necessary for users or groups.
Regular Review: Review sudoers file periodically for security and compliance.
Backup: Always backup the sudoers file before making changes.
Example Tasks
Granting sudo access to a new user:

bash
Copy code
sudo visudo
Add:

sql
Copy code
newuser    ALL=(ALL:ALL) ALL
Granting sudo access to a group for specific commands:

bash
Copy code
sudo visudo
Add:

shell
Copy code
%admin_group    ALL=(ALL) /bin/ls, /bin/cat
Granting NOPASSWD access to a user for specific commands:

bash
Copy code
sudo visudo
Add:

sql
Copy code
username    ALL=(ALL:ALL) NOPASSWD: /bin/ls
Including an additional configuration file:

bash
Copy code
sudo visudo
Add:

arduino
Copy code
#include /etc/sudoers.d/my_custom_config
These tasks ensure proper management and security when configuring sudo access on a Linux system. Always exercise caution and validate changes to maintain system integrity.

## overview of each file (/etc/passwd, /etc/group, and /etc/shadow) found on Unix-like systems, including their structure and purpose:

1. /etc/passwd
The /etc/passwd file contains essential information about user accounts on the system. Each line in /etc/passwd represents a single user account and is structured in the following format:

`username:password:UID:GID:GECOS:home_directory:shell`

Fields:

username: The login name of the user.
password: Historically, this field used to contain the encrypted password, but modern systems store an 'x' or '*' here and store the actual encrypted password in /etc/shadow.
UID: User ID, a unique numerical identifier for the user.
GID: Primary group ID, identifies the user's primary group.
GECOS: General Electric Comprehensive Operating System, traditionally used for additional user information such as full name, office number, phone, etc.
home_directory: The user's home directory.
shell: The user's login shell.

Example:

`username:x:1000:1000:John Doe:/home/username:/bin/bash`
Purpose: /etc/passwd provides basic account information necessary for user authentication and management. It is readable by all users but writable only by root (root).

2. /etc/group
The /etc/group file lists all groups on the system and their respective members. Each line in /etc/group is structured as follows:

`groupname:password:GID:user_list`

Fields:

groupname: The name of the group.
password: Historically, used for group passwords (not widely used now, usually contains x).
GID: Group ID, a unique numerical identifier for the group.
user_list: Comma-separated list of users who are members of the group.

Example:

makefile
Copy code
groupname:x:1000:user1,user2,user3
Purpose: /etc/group manages group information, facilitating access control by defining group memberships and permissions. Like /etc/passwd, it is readable by all users but writable only by root (root).

3. /etc/shadow
The /etc/shadow file stores encrypted password and other security-related information for user accounts. Its structure is:

makefile
Copy code
username:password:last_change:min_age:max_age:warn_days:inactive_days:expire_date:reserved
Fields:

username: The login name of the user.
password: Encrypted password (or a placeholder like ! or * if stored separately).
last_change: Last password change date (days since epoch).
min_age: Minimum password age.
max_age: Maximum password age.
warn_days: Password expiration warning days.
inactive_days: Password inactivity days.
expire_date: Account expiration date (days since epoch).
reserved: Reserved for future use.

Example:

username:$6$Dvc0C8Ue$ZkY7p5Cv6L8p1Vn1f8kKDx6w2tJyV.gS4bOuhK4aSdpIeJ7phF1GwThfDZL4.d4FukBt/SpruFWJgyEtIVXUG.:18992:0:99999:7:::

Purpose: /etc/shadow enhances security by separating sensitive password data from /etc/passwd and includes features for password expiration, aging, and account locking. It is readable only by root (root) to prevent unauthorized access to password information.

| File         | Structure                             | Purpose                                                    | Permissions            |
|--------------|---------------------------------------|------------------------------------------------------------|------------------------|
| `/etc/passwd`| `username:password:UID:GID:GECOS:home_directory:shell` | Basic user account info for login and shell access.      | Readable by all, writable by root. |
| `/etc/group` | `groupname:password:GID:user_list`    | Group definitions and memberships.                         | Readable by all, writable by root. |
| `/etc/shadow`| `username:password:last_change:min_age:max_age:warn_days:inactive_days:expire_date:reserved` | Encrypted passwords and security info.  | Readable only by root, no general access. |



