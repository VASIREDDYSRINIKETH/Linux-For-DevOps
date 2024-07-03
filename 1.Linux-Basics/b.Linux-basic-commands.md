# Top 50 Basic Commands for DevOps Engineers

These essential Linux commands are frequently used by DevOps engineers for system administration, automation, deployment, monitoring, and more.

## Navigation and File Management:

1. **pwd**: Print working directory.
   - Example: `pwd` (Output: `/home/user/documents`)
   
2. **ls**: List directory contents.
   - Example: `ls -l` (Output: list of files and directories with details)
   - Example with options: `ls -al` (List all files, including hidden files, with detailed information)

3. **cd**: Change directory.
   - Example: `cd /var/log` (Change to the '/var/log' directory)

4. **mkdir**: Make directory.
   - Example: `mkdir project` (Create a directory named 'project')

5. **touch**: Create an empty file.
   - Example: `touch index.html` (Create an empty file named 'index.html')

6. **cp**: Copy files or directories.
   - Example: `cp file1.txt file2.txt` (Copy 'file1.txt' to 'file2.txt')
   - Example with options: `cp -r dir1/ dir2/` (Recursively copy 'dir1' to 'dir2')

7. **mv**: Move or rename files or directories.
   - Example: `mv file1.txt /path/to/new/location` (Move 'file1.txt' to a new location)
   - Example with options: `mv -i file.txt newfile.txt` (Interactive mode - prompt before overwriting)

8. **rm**: Remove files or directories.
   - Example: `rm file.txt` (Remove 'file.txt')
   - Example with options: `rm -rf directory/` (Force remove directory recursively)

9. **nano/vim**: Text editors for creating or editing files.
   - Example: `nano filename.txt` (Edit 'filename.txt' using nano editor)

## System Management:

10. **ps**: Display information about active processes.
    - Example: `ps aux` (Show all running processes)
    - Example with options: `ps -ef | grep process` (Display processes matching a pattern)

11. **top**: Display dynamic real-time information about running processes.
    - Example: `top` (Show running processes and system resource usage)
    - top -d 5 (Every 5 seconds we know the process by default 3sec)
12. **kill**: Terminate processes by ID.
    - Example: `kill 1234` (Kill the process with ID 1234)
    - Example with options: `kill -9 1234` (Force kill the process with ID 1234)

13. **df**:(diskfile system) Display disk space usage. and **du**: Display disk usage(used to find file size or directory size)
    - Example: `df -h` (Display disk usage in human-readable format)
    - The df (disk filesystem) command is used to display the amount of disk space used and available on all mounted filesystems.
    - It also stands for disk free and this command us used to display the details about space used and available on the file system( disk space)
   
    - `du Command`
    - The du (disk usage) command estimates file space usage. It can show the disk usage of files and directories.
    - To show the disk usage of the current directory:
    - Example: `du -sh .`
    - The -s option summarizes the total, and the -h option makes the output human-readable.

14. **free**: Display memory usage. It summary of RAM usage, including total used free, shared and available memory and swap space .This command helps monitor resource usage and allows an admin to determine if there's enough room for running new programs.
    - Example: `free -m` (Display memory usage in megabytes)
    - Options -b (bytes) , -k (kilobytes) -g (gigabytes) -t (display the total memory)
    - Watch Memory Usage
    - To continuously watch the memory usage and update every 2 seconds:
    - Example: `watch -n 2 free -h`

15. **grep**: Search for patterns in files.
    - Example: `grep "error" logfile.log` (Search for 'error' in 'logfile.log')
    - Example with options: `grep -r "pattern" directory/` (Recursively search for 'pattern' in 'directory')

16. **systemctl**: Control systemd services (start, stop, restart, enable, disable).
    - Example: `sudo systemctl start apache2` (Start Apache web server)

17. **netstat**: Display network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
    - Example: `netstat -tuln` (Show listening ports)

18. **ifconfig/ip**: Display or configure network interface parameters.
    - Example: `ifconfig` (Show network interface configuration)
    - Example with options: `ip address show` (Show IP address information)

19. **ping**: Check connectivity to a remote host.
    - Example: `ping google.com` (Ping google.com to check connectivity)

20. **ssh**: Securely connect to a remote server.
    - Example: `ssh username@hostname` (SSH into a remote server)

## Package Management:

21. **apt/yum**: Package managers for installing, updating, and removing software packages.
    - Example: `sudo apt install nginx` (Install nginx web server)
    - Example: `sudo yum install nginx` (Install nginx on CentOS/RHEL)

22. **dpkg/rpm**: Package management commands for Debian-based and Red Hat-based systems respectively.
    - Example: `dpkg -i package.deb` (Install a .deb package)
    - Example: `rpm -ivh package.rpm` (Install a .rpm package)

## Compression and Decompression:

23. **tar**: Archive files and directories.
    - Example: `tar -czvf archive.tar.gz /path/to/directory` (Create a tar.gz archive)
    
24. **gzip/gunzip**: Compress or decompress files.
    - Example: `gzip file.txt` (Compress 'file.txt')

## User Management:

25. **useradd**: Add a new user account.
    - Example: `sudo useradd -m newuser` (Create a new user 'newuser')

26. **passwd**: Change user password.
    - Example: `passwd username` (Change password for user 'username')

27. **userdel**: Delete a user account.
    - Example: `sudo userdel username` (Delete user 'username')

## Miscellaneous:

28. **date**: Display or set the system date and time.
    - Example: `date` (Display current date and time)

29. **history**: Display command history.
    - Example: `history` (Show a list of previously executed commands)

30. **chmod/chown**: Change file permissions or ownership.
    - Example: `chmod 755 script.sh` (Change permissions of 'script.sh')
    - Example: `chown user:group file.txt` (Change ownership of 'file.txt')

31. **sudo**: Execute a command with superuser privileges.
    - Example: `sudo apt update` (Update package list with superuser privileges)

32. **find**: Search for files and directories.
    - Example: `find /path/to/search -name "*.txt"` (Find all .txt files in a directory)

33. **wget/curl**: Download files from the internet.
    - Example: `wget https://example.com/file.txt` (Download file.txt using wget)
    - Example: `curl -O https://example.com/file.txt` (Download file.txt using curl)

34. **scp**: Securely copy files between hosts.
    - Example: `scp /path/to/local/file username@hostname:/path/to/remote/location` (Copy file to remote server)

35. **rsync**: Efficiently sync files between directories or hosts.
    - Example: `rsync -avz /path/to/source/ username@hostname:/path/to/destination/` (Sync files to remote server)

36. **tar**: Extract files from an archive.
    - Example: `tar -xvf archive.tar.gz` (Extract files from tar.gz archive)

37. **uname**: Display system information.
    - Example: `uname -a` (Show all system information)
    - Example with options: `uname -mrs` (Show machine, kernel release, and system architecture)
    - lsb_release -a

38. **hostname**: Display or set the system hostname.
    - Example: `hostname` (Display the hostname)
    - Example: `sudo hostnamectl set-hostname newhostname` (Set the hostname)

39. **whoami**: Display the current username.
    - Example: `whoami` (Show the current username)

40. **w**: Display information about the users currently on the machine.
    - Example: `w` (Show who is logged in and what they are doing)

41. **who**: Display information about who is logged on.
    - Example: `who` (Show who is logged in)
    - who log in last (`last` or last username`)

42. **uptime**: Show how long the system has been running.
    - Example: `uptime` (Show system uptime)

43. **wc**: Count lines, words, or characters in a file.
    - Example: `wc -l filename.txt` (Count lines in 'filename.txt')

44. **head**: Output the first part of files.
    - Example: `head -n 10 file.txt` (Display first 10 lines of 'file.txt')

45. **tail**: Output the last part of files.
    - Example: `tail -n 10 file.txt` (Display last 10 lines of 'file.txt')

46. **sort**: Sort lines of text files.
    - Example: `sort file.txt` (Sort the lines in 'file.txt')
    - in reverse order `sort -r` file name

47. **uniq**: Report or omit repeated lines in a file.
    - Example: `uniq file.txt` (Display unique lines in 'file.txt')
    - uniq -c to know how many occurance

48. **awk**: A versatile programming language for working on files.
    - Example: `awk '{print $1}' file.txt` (Print the first column of 'file.txt')

49. **sed**: Stream editor for filtering and transforming text.
    - Example: `sed 's/old/new/g' file.txt` (Replace 'old' with 'new' in 'file.txt')

50. **tr**: Translate or delete characters.
    - Example: `tr '[:lower:]' '[:upper:]' < file.txt` (Convert lowercase to uppercase in 'file.txt')

These commands are essential for DevOps engineers to manage systems, troubleshoot issues, and automate tasks efficiently.
