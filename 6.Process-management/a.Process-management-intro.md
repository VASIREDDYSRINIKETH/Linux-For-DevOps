# Process Management in Linux

A process means program in execution. It generally takes an input, processes it and gives us the appropriate output.

There are basically 2 types of processes.

**Foreground processes**: Such kind of processes are also known as interactive processes. These are the processes which are to be executed or initiated by the user or the programmer, they can not be initialized by system services. Such processes take input from the user and return the output. While these processes are running we can not directly initiate a new process from the same terminal.

**Background processes**: Such kind of processes are also known as non interactive processes. These are the processes that are to be executed or initiated by the system itself or by users, though they can even be managed by users. These processes have a unique PID or process if assigned to them and we can initiate other processes within the same terminal from which they are initiated.

## Commands

1.List processes

To display your currently active processes, use the ps command:

```
[tcarrigan@client ~]$ ps
    PID TTY          TIME CMD
   2648 pts/0    00:00:00 bash
   3293 pts/0    00:00:00 sleep
   3300 pts/0    00:00:00 ps
```

Here you get a little information about the active processes on your system. You will want to pay attention to the PID (unique process ID), the TIME (amount of time that the process has been running), and the CMD (the command executed to launch the process).

2.Verbose list (processes)

To see an incredibly detailed list of processes, you can use the ps aux command.

a - all users
u - shows the user/owner
x - displays processes not executed in the terminal (making the output rather long)
You can see the command here (output edited for length):

```
[tcarrigan@client ~]$ ps aux
USER         PID %CPU %MEM   VSZ    RSS   TTY  STAT  START    TIME   COMMAND
tcarrig+    3293  0.0  0.0 215292   520 pts/0    T    13:41   0:00 sleep 500
root        3380  0.0  0.0      0     0 ?        I    13:45   0:00 [kworker/1:1-mm_percpu_wq]
root        3381  0.0  0.0      0     0 ?        I    13:45   0:00 [kworker/1:3]
root        3398  0.0  0.0      0     0 ?        I    13:46   0:00 [kworker/3:2-ata_sff]
root        3481  0.0  0.0      0     0 ?        I    13:50   0:00 [kworker/u8:2-flush-253:0]
root        3482  0.0  0.0      0     0 ?        I    13:50   0:00 [kworker/0:1-events]
root        3483  0.0  0.0      0     0 ?        I    13:50   0:00 [kworker/0:2]
root        3508  0.0  0.0      0     0 ?        I    13:51   0:00 [kworker/3:0-ata_sff]
root        3511  0.0  0.0  18892  7732 ?        S    13:52   0:00 systemd-userwork
root        3512  0.0  0.0  18892  7656 ?        S    13:52   0:00 systemd-userwork
root        3513  0.0  0.0  18892  7656 ?        S    13:52   0:00 systemd-userwork
root        3566  0.4  0.0 432792  8024 ?        Ssl  13:54   0:00 /usr/libexec/fprintd
tcarrig+    3598  0.0  0.0 228208  3948 pts/0    R+   13:54   0:00 ps aux

```

3.Kill by PID
Inevitably, a process will get hung, and you will need to kill it. The more time you spend at the CLI, the more likely it is you will need the kill command. The most accurate way to identify a process is by process ID (PID).

Use the following syntax:

```
[tcarrigan@client ~]$ kill PID
```

This command sends the SIGTERM signal. However, if you are dealing with a stuck process, add the -9 option.


4.Kill by name/keyword

Use the killall command to kill a process by name. This command will kill all processes with the keyword/name that you specify.

The syntax is:

`killall sleep`

This would kill all sleep processes active on the system (the -9 option works here as well). Here is an example:

```

[tcarrigan@client ~]$ ps
    PID TTY          TIME CMD
   2648 pts/0    00:00:00 bash
   3293 pts/0    00:00:00 sleep
   4684 pts/0    00:00:00 sleep
  40527 pts/0    00:00:00 sleep
  40540 pts/0    00:00:00 ps

[tcarrigan@client ~]$ sudo kill -9 3293
[sudo] password for tcarrigan: 
[1]   Killed                  sleep 500
```

5.To track the running processes on your machine you can use the top command.

`top`

## Difference between top and ps command

| Feature                | top                                  | ps                                        |
|------------------------|--------------------------------------|------------------------------------------|
| **Real-time Monitoring** | Yes, provides live updates on system processes and resources. | No live updates; shows current processes once. |
| **Interface**             | Interactive interface for sorting, filtering, and managing processes. | Static list of processes without interactive features. |
| **Resource Usage**    | Shows system-wide and individual process resource usage. | Doesn't display resource usage by default; needs additional options. |
| **Process Management** | Allows interactive process management like killing or changing priority. | Primarily for listing processes, no interactive management. |
| **User-Friendlyness** | Complex interface with extensive options. | Simple and straightforward for basic information. |
| **Continuous Monitoring** | Can monitor system activity continuously. | Typically used for one-time process listing. |
| **Customization**       | Offers limited display customization. | No built-in customization; output manipulation through scripts. |
| **Compatibility**      | Available on most Linux distributions. | Available on Linux, macOS, and BSD variants. |


# PS and TOP Command Options

## `ps` Command Options:

1. `-e`: Selects all processes.
2. `-f`: Provides full-format listing.
3. `-u <user>`: Displays processes owned by a specific user.
4. `-aux`: Shows all processes in a user-oriented format.
5. `-p <pid>`: Displays information for a specific process ID.
6. `-o <format>`: Specifies a user-defined output format.
7. `-C <command>`: Selects processes by command name.
8. `-r`: Sorts processes by CPU usage.
9. `-m`: Displays information in a more readable format.
10. `-H`: Displays a hierarchical view of processes.

## `top` Command Options:

1. `-d <delay>`: Specifies the delay between screen updates.
2. `-p <pid>`: Monitors specific process IDs.
3. `-u <username>`: Shows processes for a specific user.
4. `-o <field>`: Sets the initial sort field.
5. `-b`: Starts `top` in batch mode (useful for scripts).
6. `-n <number>`: Specifies the number of iterations before exiting.
7. `-i`: Ignores idle or zombie processes.
8. `-E <field>`: Specifies which fields are displayed.
9. `-Z`: Adds security context information (SELinux) to the output.
10. `-c`: Shows command name instead of full command line.

These options allow users to customize the behavior and output of `ps` and `top` commands according to their specific requirements.
