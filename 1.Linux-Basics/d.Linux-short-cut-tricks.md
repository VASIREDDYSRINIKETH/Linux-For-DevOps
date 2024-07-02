# Useful Linux Shortcuts and Tricks

## Keyboard Shortcuts:

1. **Ctrl + C:** Terminate the current command/process.
2. **Ctrl + D:** Exit the current shell or logout.
3. **Ctrl + Z:** Suspend the current process (background).
4. **Ctrl + A:** Move cursor to the beginning of the line.
5. **Ctrl + E:** Move cursor to the end of the line.
6. **Ctrl + U:** Clear the line before the cursor.
7. **Ctrl + K:** Clear the line after the cursor.
8. **Ctrl + L:** Clear the screen.
9. **Ctrl + R:** Search command history (reverse search).
10. **Tab:** Auto-complete filenames or commands.
11. **Ctrl + W:** Delete the word before the cursor.
12. **Ctrl + Y:** Paste the last deleted text.
13. **Ctrl + P:** Recall the previous command (in history).
14. **Ctrl + N:** Recall the next command (in history).
15. **Ctrl + T:** Swap the last two characters before the cursor.
16. **Alt + . (period):** Insert the last argument from the previous command.
17. **Alt + Backspace:** Delete the word before the cursor.
18. **Alt + F:** Move cursor forward one word.
19. **Alt + B:** Move cursor backward one word.
20. **Ctrl + Alt + Del:** Restart the system (use with caution).

## Shell Tricks:

1. **History Commands:**
   - Use `history` to view command history.
   - Use `!n` to execute the nth command in history.
   - Use `!!` to execute the last command.
   - Use `!<string>` to execute the most recent command starting with `<string>`.
   - Use `!<string>:p` to preview the command without executing it.

2. **Aliases:**
   - Create shortcuts for commonly used commands using `alias`.
   - Example: `alias ll='ls -alF'` makes `ll` equivalent to `ls -alF`.

3. **File Manipulation:**
   - Use `mv` with `!$` to move the last argument of the previous command.
   - Example: `mv /path/to/file.txt /new/path/` can be followed by `mv !$ /another/new/path/` to move the same file.

4. **Process Management:**
   - Use `ps aux` to list all running processes.
   - Use `kill <PID>` to terminate a process by its PID.
   - Use `killall <process-name>` to terminate all processes with a specific name.
   - Use `nohup <command> &` to run a command that continues to run even after logging out.

5. **Redirection:**
   - Use `command > file` to redirect command output to a file.
   - Use `command >> file` to append command output to a file.
   - Use `command 2>&1` to redirect both stdout and stderr to a file.

6. **Remote Access:**
   - Use `ssh user@hostname` to connect to a remote server.
   - Use `scp` for secure file transfer between local and remote systems.
   - Use `rsync` for efficient file synchronization between systems.

7. **Text Processing:**
   - Use `grep` to search for patterns in files or command output.
   - Use `sed` for text transformations, substitutions, and editing.
   - Use `awk` for more complex text processing and reporting.

8. **System Monitoring:**
   - Use `top` or `htop` to monitor system resource usage.
   - Use `df -h` to check disk space usage.
   - Use `free -m` to check memory usage.
   - Use `uptime` to view system load averages.

These shortcuts and tricks can greatly improve productivity and efficiency when working on a Linux system. Feel free to explore and adapt them to suit your workflow!

9. **Re-run Previous Command with sudo**

If you forget to use `sudo` before running a command that requires elevated privileges, you can quickly re-run it with `sudo !!`.

Example:
```bash
$ apt-get install nginx
E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?

$ sudo !!
[sudo] password for user:
Reading package lists... Done
Building dependency tree...
Reading state information... Done
The following additional packages will be installed:
  ...
```


10. **Automate Confirmation with `yes`**

```markdown
# Automate Confirmation with `yes`
```
To automate confirmation prompts for commands that require manual confirmation, you can use `yes |`.

Example:
```bash
$ yes | apt-get install nginx
Reading package lists... Done
Building dependency tree...
Reading state information... Done
The following additional packages will be installed:
  ...
```
11. **Navigate Command History with `hstr`**

```markdown
# Navigate Command History with `hstr`
```
The `hstr` utility provides an enhanced way to search and navigate your command history interactively.

Example:
```bash
$ hstr
<use arrow keys to navigate through history>
```
12. **Monitor System Resources with `glances`**

```markdown
# Monitor System Resources with `glances`
```
Use `glances` to get a comprehensive view of CPU usage, memory usage, disk usage, and top processes.

Example:
```bash
$ glances
<real-time system monitoring output>

```

12. **Start HTTP Server with Python**

```markdown
# Start HTTP Server with Python
```
Easily start an HTTP server using Python on port 8000.

Example:
```bash
$ python3 -m http.server
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

