
# User Management Commands

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
