# Linux Introduction

## 1. What is Linux?

- Linux is a Unix-based operating system introduced by Linus Torvalds in 1991.
- It is open-source and low cost.
- Linux is free to use and is based on the Linux kernel.

## 2. What is Linux Kernel?

- The Linux kernel is the main component of a Linux operating system and acts as the core interface between a computer’s hardware and its processes.
- The kernel performs four main jobs:
  - Memory management: Tracks memory usage and allocation.
  - Process management: Controls CPU usage by processes.
  - Device drivers: Mediates between hardware and processes.
  - System calls and security: Handles service requests and ensures system security.

## 3. What are the Core Components of Linux?

- **Kernel:** Manages system resources directly and provides essential services like process management, memory management, and device drivers.
- **System Library:** Provides common functionality to applications and abstracts low-level hardware interactions.
- **System Utility:** Command-line tools for system management, file operations, text processing, and administrative functions.
- **Shell:** Command-line interpreter for interacting with the OS.
- **Hardware:** Physical components of a computer system.

## 4. Difference between Linux and Unix

| Aspect               | Linux                                      | Unix                                      |
|----------------------|--------------------------------------------|-------------------------------------------|
| Development & Licensing | Developed by Linus Torvalds in 1991. Open-source with various distributions under licenses like GPL. | Originated in the late 1960s at AT&T Bell Labs. Initially proprietary, later standardized. Often requires licensing fees. |
| Kernel               | Linux kernel, developed independently of Unix. | Based on various Unix kernels such as the original Unix kernel or BSD. |
| Distribution Model   | Distributed in various distributions (distros) by different organizations and communities. | Typically distributed by vendors such as IBM, Sun Microsystems, HP, etc. |
| Community & Ecosystem | Large and diverse community of developers and users worldwide. Vibrant open-source community. | Historically associated with commercial vendors, with smaller open-source communities. |
| Compatibility & Standards | Adheres to POSIX standards and aims for compatibility with Unix standards. May introduce its own features. | Adheres to various standards like POSIX, but differences in implementation between Unix variants may exist. |
| Examples             | Ubuntu, Fedora, Debian, CentOS, Arch Linux, etc. | Various proprietary Unix variants and open-source Unix-like systems like FreeBSD, OpenBSD, etc. |

## 5. What is Bash?

- Bash, short for "Bourne Again Shell," is a widely used Unix shell and command-line interpreter.
- It was invented by Brian Fox in 1989 and further developed by Chet Ramey.
- Bash is the default shell on most Linux distributions and is available on macOS and other Unix-like systems.

## 6. Features of Linux

- Portable Environment
- Free and Open-source
- Shell/Command Line Interface
- End-to-end Encryption
- Lightweight Infrastructures
- Flexibility

## 7. What are Daemons?

- In Linux, daemons are background processes that run independently, performing various system tasks or providing services.
- Examples include the Apache web server, SSH daemon, and cron daemon.

## 8. Linux File System Hierarchy

- **Root Directory (/):** Top-level directory in the Linux file system hierarchy.
- **/bin:** Essential command binaries.
- **/boot:** Boot loader files and kernel images.
- **/dev:** Device files.
- **/etc:** Configuration files.
- **/home:** User home directories.
- **/lib and /lib64:** Shared libraries.
- **/mnt and /media:** Mount points for temporary file systems.
- **/opt:** Optional software packages.
- **/proc:** Process information.
- **/root:** Root user's home directory.
- **/sbin:** System binaries.
- **/tmp:** Temporary files.
- **/usr:** User programs and data.
- **/var:** Variable data.

## 9. What is zombie Process in linux?

A zombie process in Linux is a terminated process that has completed execution but still has an entry in the process table. This occurs when the process's parent has not yet called `wait()` to retrieve its exit status.

### Why are zombie processes problematic?

Zombie processes can accumulate over time and consume system resources, such as process table entries. While individual zombies may not cause immediate issues, a large number can degrade system performance.

### How can zombie processes be managed or prevented?

Zombie processes can be managed by ensuring proper termination handling in parent processes. This involves promptly calling `wait()` to retrieve the exit status of child processes. Implementing signal handlers for `SIGCHLD` can also help manage zombie processes effectively.

### Example Scenario:

Imagine a server application that spawns multiple processes to handle client requests. If these processes terminate without their parent processes calling `wait()`, they may leave behind zombie processes that gradually consume system resources.


## 10. What is SELinux and how do you check its status?

SELinux (Security-Enhanced Linux) is a mandatory access control (MAC) security mechanism implemented in the Linux kernel. It provides an additional layer of security by enforcing access control policies that restrict processes and users based on defined security policies.

### How do you check SELinux status?

To check the status of SELinux on a Linux system, you can use the following command:

```bash
sestatus
```
To change the SELinux mode (Enforcing, Permissive, or Disabled), follow these steps:

1. **Check Current SELinux Status:**
   Use the `sestatus` command to check the current SELinux status and mode.

2. **Edit SELinux Configuration File:**
   Modify the SELinux configuration file `/etc/selinux/config`. You can use a text editor like `vi` or `nano`.

3. **Set SELINUX=**: 
   Set the `SELINUX=` parameter to one of the following values:
   - `enforcing`: SELinux security policy is enforced.
   - `permissive`: SELinux security policy is not enforced, but denials are logged.
   - `disabled`: SELinux is completely disabled.

### How do you change SELinux mode using `sed`?

You can use the `sed` command to automate changes to the SELinux configuration file (`/etc/selinux/config`). Here's a step-by-step guide:

1. **Check Current SELinux Status:**
   First, check the current SELinux status and mode using `sestatus`.

2. **Modify SELinux Configuration File Using `sed`:**
   Use `sed` to modify the `SELINUX=` parameter in the configuration file. For example, to change SELinux to `permissive` mode:

   ```bash
   sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
   ```

## 11. How do you schedule a cron job?

A cron job is a scheduled task that runs automatically at specified intervals or times on Unix-like operating systems. It is commonly used for automating repetitive tasks, such as backups, maintenance scripts, and periodic checks.

### How do you schedule a cron job?

To schedule a cron job, follow these steps:

1. **Open the Cron Table for Editing:**
   Use the `crontab -e` command to open the cron table for the current user. If you need to edit the cron jobs for a specific user, you can use `crontab -u <username> -e`.

   ```bash
   crontab -e
   ```
   
## 12.How do you configure a firewall on a Linux system?

Configuring a firewall on a Linux system is typically done using firewall management tools like `iptables` or `firewalld`, depending on the distribution.

### Using iptables (Traditional Method):

1. **Check the current firewall rules:**
   ```bash
   # This command lists all current firewall rules.
   sudo iptables -L

   # Allow incoming traffic on a specific port (e.g., port 80 for HTTP):

   sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

   # Deny incoming traffic on a specific port:

   sudo iptables -A INPUT -p tcp --dport 22 -j DROP
   ```
2. Using firewalld (Dynamic Firewall Management):

   ```bash
    # Check the firewall status:

    sudo firewall-cmd --state

   # Allow incoming traffic on a specific port permanently:

    sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
  
   #  Reload firewall configurations:

     sudo firewall-cmd --reload
    ```

## 13. What is the command to create a compressed archive of a directory?

To create a compressed archive of a directory, you can use the `tar` command with compression options:

```bash
tar -czvf archive.tar.gz /path/to/directory
```
tar: The command to create or manipulate tar archives.
-c: Create a new archive.
-z: Compress the archive using gzip.
-v: Verbose mode to show the files being archived.
-f: Specify the filename of the archive.

## 14. How do you restore files from a tar archive?

```bash
tar -xzvf archive.tar.gz -C /path/to/extract
```
-x: Extract files from an archive.
-z: Use gzip to decompress.
-v: Verbose mode to show extracted files.
-f: Specify the filename of the archive.
-C: Specify the directory where files should be extracted.

## 15. How to add a user and give differnt commands based on centos, ubuntu, redhat?

## 15. How to add a user and give different commands based on CentOS, Ubuntu, Red Hat?

To add a user on Linux systems, you can use the `useradd` command. Below are the commands specific to CentOS, Ubuntu, and Red Hat distributions:

### CentOS and Red Hat:

```bash
# Add a user
sudo useradd username

# Set password for the user
sudo passwd username

# Add the user to a specific group (optional)
sudo usermod -aG groupname username
```
### Ubuntu:

```bash

# Add a user
sudo adduser username

# Set password for the user
sudo passwd username

# Add the user to a specific group (optional)
sudo usermod -aG groupname username
```

## 16. What is the command to check the kernel version in Linux?

we use the command

uname -r

## 17. How to check what os is the linux is ? and Give some commands to get system information commands to know who is log in who is log out and what they doing?

```bash
# To check what OS (Operating System) your Linux system is running, you can use the following command:
# This command displays detailed information about the system kernel and operating system.

uname -a

# Commands to get system information:

# To know who is logged in:
# This command shows who is currently logged in to the system.

who

# To know who is logged out:
# This command displays a list of all users logged in and out since the last reboot.

last

# To know what users are currently doing:
# This command displays information about the users currently logged in and their activities.

w

This command displays information about the users currently logged in and their activities.
```
## 18. How to change the timezone to IST? give me the command and give some more examples?

### To IST:
   
   sudo timedatectl set-timezone Asia/Kolkata

### To EST:
  
  sudo timedatectl set-timezone America/New_York

### To CET:

  sudo timedatectl set-timezone Europe/Berlin


## 19. How do you check the disk usage of a specific directory?

To check the disk usage of a specific directory, use the `du` (disk usage) command with the `-h` (human-readable) option for readability:

```bash
du -h /path/to/directory
```

## 20. How can you find all the files larger than 100MB in the /home directory?

To find all files larger than 100MB in the /home directory, use the find command with the -size and + options:

```bash

find /home -type f -size +100M
```

## 21. How do you check the currently running processes?

To check the currently running processes on a Linux system, you can use the following commands:

### Using `ps` command:

```bash
# This command displays a list of all processes running on the system, along with detailed information such as process IDs (PID), CPU usage, memory usage, etc.

ps aux

#Using top command:

top

# top provides a dynamic real-time view of system processes. It continuously updates the list and provides a summary of system resources.

# Using htop command:

htop

# htop is an interactive process viewer for Unix systems. It provides a more user-friendly and colorful interface compared to top.

```

## 22. Explain Chmod and chown commands with examples and syntaxs?

```bash
chmod command:

The chmod command is used to change the permissions of files and directories in Unix-like operating systems.

Syntax:

chmod [options] mode file

Example:
chmod u+rwx file.txt

This example grants the user (u) read, write, and execute permissions (rwx) on file.txt.
chown command:

The chown command is used to change the owner and/or group of a file or directory.

Syntax:
chown [options] owner[:group] file

Example:
chown user1:group1 file.txt

This example changes the owner of file.txt to user1 and the group to group1.
```

## 23. How can you kill a process by name?

To kill a process by name in Linux, you can use the following command sequence:

```bash
pkill -f <process_name>

Example:

pkill -f firefox

This command kills all processes whose command line matches firefox. -f option is used to match the full command line.
```

## 24. How do you check the open ports on a system?

To check open ports on a Linux system, you can use several commands, such as:
Using netstat command:

```bash

netstat -tuln

This command displays all listening (-l) and non-listening (-a) TCP (-t) and UDP (-u) connections on the system, along with the port numbers (-n for numeric output).
Using ss command:

ss -tuln

# ss is another utility to investigate sockets. This command shows all TCP (-t) and UDP (-u) ports that are listening (-l) with numeric output (-n).
```

## 25. How can you check the network interface configuration? and give some commands to get publicIp address or host address of linux machine?

Checking network interface configuration:

```bash

ifconfig

or

ip addr show

# These commands display detailed information about all network interfaces (ifconfig is older, while ip is newer and more powerful).
# Getting public IP address:

curl ifconfig.me

# This command fetches your public IP address from ifconfig.me.

# Getting host address (hostname):

hostname -I

# This command prints all IP addresses assigned to the host, which usually includes the primary IP address.
```

## 26. How do you monitor real-time system performance?

You can monitor real-time system performance using tools like:
top command:

```bash

top

# top provides a dynamic real-time view of system processes, CPU usage, memory usage, and more.

# htop command:

htop

# htop is an interactive process viewer that shows real-time system metrics in a user-friendly interface.

# vmstat command:

vmstat 1

# vmstat reports information about processes, memory, paging, block IO, traps, and CPU activity. The 1 refreshes every 1 second.
```

## 27. How do you check memory usage on a Linux system?

To check memory usage on a Linux system, you can use:
free command:

```bash

free -h

# This command displays the total amount of free and used physical memory (-h for human-readable format).

top or htop command:

# Both top and htop commands display memory usage along with other system metrics in real-time.

vmstat command:

vmstat -s
```

## 28. How do you display disk usage in a human-readable format using df? give some commands with options?

To display disk usage in a human-readable format using `df`, you can use the following commands with options:

```bash
# Display disk usage of all filesystems
df -h

# Display disk usage of a specific filesystem (e.g., /dev/sda1)
df -h /dev/sda1

# Display disk usage including inodes
df -hi

# Display disk usage of a specific directory
df -h /path/to/directory

-h: Print sizes in human-readable format (e.g., 1K 234M 2G).
-i: Display inode information in addition to disk usage.

```

## 29. What is cut, grep, sed and awk commands and give some examples usage and options which is regulary used for realtime?

# Linux Commands Overview

| Command | Description | Examples and Usage | Commonly Used Options |
|---------|-------------|--------------------|-----------------------|
| `cut`   | Used to extract sections from each line of files | Extracting fields from a CSV file: <br> `cut -d',' -f2 file.csv` <br> This extracts the second field delimited by `,` from `file.csv`. | `-d`: Specify the delimiter <br> `-f`: Select fields by field number |
| `grep`  | Searches for patterns in files | Searching for a specific word in a file: <br> `grep "pattern" file.txt` <br> This finds all lines in `file.txt` containing "pattern". | `-i`: Ignore case <br> `-r`: Recursively search subdirectories <br> `-v`: Invert match |
| `sed`   | Stream editor for filtering and transforming text | Replacing text in a file: <br> `sed 's/old/new/g' file.txt` <br> This replaces all occurrences of "old" with "new" in `file.txt`. | `-e`: Specify multiple commands <br> `-i`: Edit files in place |
| `awk`   | Powerful programming language for pattern scanning and processing | Summing values in a column of a CSV: <br> `awk -F',' '{sum += $2} END {print sum}' file.csv` <br> This calculates the sum of the second column in `file.csv`. | `-F`: Specify field separator <br> `'{print $1, $2}'`: Print specific columns |



## 30. What is inode number in linux?

In Linux, an inode is a data structure that stores metadata about a file or directory, except its name and actual data content. Each file or directory on a Linux filesystem is associated with an inode, identified by a unique inode number.

## 31. What is hardlink and softlink and give examples?

### Hardlink:
A hardlink is a link that points directly to the inode of a file on the disk. All hardlinks to a file have the same inode number. Removing any hardlink does not affect the file until the last hardlink is deleted.

Example:
```bash
 ln file1 hardlink1
```

### Softlink (Symbolic link):

A softlink, or symbolic link, is a special file that points to another file or directory by its pathname. It refers to the target file by its name. If the target file is removed or renamed, the symbolic link becomes broken.

Example:

```bash

 ln -s /path/to/targetfile symlinkname
```
## 32. Give Some firewall commands used in real time?

# List all rules
$ iptables -L

# Allow incoming SSH (port 22) traffic
$ iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Block all incoming traffic from a specific IP
$ iptables -A INPUT -s 192.168.1.100 -j DROP


## 33. What is journalctl and systemctl?

### journalctl:

journalctl is a command-line utility for querying and displaying logs from the systemd journal. It can filter logs based on various criteria such as time, severity, and service.

Example:

``` bash
journalctl -u nginx.service
```
### systemctl:

systemctl is a command-line utility used to manage systemd services, targets (runlevels), sockets, and other units. It allows starting, stopping, restarting, enabling, disabling, and querying the status of these units.

Example:

``` bash
systemctl start nginx
```

## 34. Give some service management commands and Package management commands?

```bash

systemctl start servicename
systemctl restart servicename
service serviceName stop

sudo apt-get install packagename  # Debian/Ubuntu
sudo yum install packagename      # CentOS/RHEL

```

## 35.How do you redirect give explanation for << <<< and < > >> ?

# Redirection Operators Overview

| Operator | Description | Example Usage |
|----------|-------------|---------------|
| `>`      | Redirects output of a command to a file, overwriting the file if it exists. | Redirect `ls` output to a file: <br> `ls > list.txt` |
| `>>`     | Redirects output of a command to a file, appending to the file if it exists. | Append `date` output to a log file: <br> `date >> logfile.txt` |
| `<`      | Redirects input to a command from a file. | Input from a file to `grep`: <br> `grep pattern < file.txt` |
| `<<`     | Here Document: Redirects multiple lines of input to a command. | Here document example with `cat`: <br> `cat << EOF` <br> `line1` <br> `line2` <br> `EOF` |
| `>>>`    | Redirects the standard error (stderr) of a command to a file, overwriting the file if it exists. | Redirect `stderr` of `ls` to a file: <br> `ls 2> error.log` |

