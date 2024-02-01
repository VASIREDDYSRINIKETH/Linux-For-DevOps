# Disk management commands

## Investigate Directories For Disk Usage

Sometimes it may be required to find out which directory consuming how much disk space especially when you are
used df -h and realized your available disk space is low.

`du:`

`du` command summarizes disk usage of the set of FILEs, recursively for directories.
It's often uses with -sh option:

```
-s, --summarize
display only a total for each argument
-h, --human-readable
print sizes in human readable format (e.g., 1K 234M 2G)

```

For summarizing disk usages of the files in the current directory we use:

`du -sh *`

Example output:

```
572K Documents
208M Downloads
4,0K Music
724K Pictures
4,0K Public
4,0K Templates
4,0K Videos
```

We can also include hidden files with using:

`du -sh .[!.]* *`

Example output:

```
6,3M .atom
4,0K .bash_history
4,0K .bash_logout
8,0K .bashrc
350M .cache
195M .config
12K .dbus
4,0K .dmrc
44K .gconf
60K .gem
520K .gimp-2.8
28K .gnome
4,0K .ICEauthority
8,3M .local
8,0K .nano
404K .nv
36K .pki
```

Thirdly, you can add total to the output by adding ,-c, option:

`du -sch .[!.]* *`

Result:

```
.
.
.
4,0K Templates
4,0K Videos
769M total
```

`Most importantly` using du command properly on the root directory is a life saving action to find out what
application/service or user is consuming your disk space wildly. For example, in case of a ridiculously low level of
disk space availability for a web and mail server, the reason could be a spam attack to your mail service and you
can diagnose it just by using du command.

Investigate root directory for disk usage:

`sudo du -sch /.[!.]* /*`

Example output:

```
16K /.VolumeIcon.icns
24K /.VolumeIcon.png
13M /bin
57M /boot
4,0K /cdrom
620K /dev
13M /etc
779M /home
0 /initrd.img
406M /lib
3,9M /lib32
4,0K /lib64
16K /lost+found
4,0K /media
4,0K /mnt
367M /opt
du: cannot access '/proc/18221/task/18221/fd/4': No such file or directory
du: cannot access '/proc/18221/task/18221/fdinfo/4': No such file or directory
du: cannot access '/proc/18221/fd/4': No such file or directory
```

Lastly, the best method forms when you add a threshold size value for directories to ignore small ones. This
command will only show folders with more than 1GB in size which located under root directory up to the
farthermost branch of the whole directory tree in your file system:

`sudo du --threshold=1G -ch /.[!.]* /*`

Example output:

```
1,4G /usr/lib
1,8G /usr/share
3,5G /usr
5,8G total
```

## Checking Disk Space

It's quite common to want to check the status of the various partitions/drives on your server/computer to see how
full they are. The following command is the one you'll want to run:

`df -h`

This will produce output similar to the following:

```
[root@mail ~]# df -h

Filesystem Size Used Avail Use% Mounted on
/dev/mapper/VolGroup-lv_root
19G 1.6G 16G 9% /
tmpfs 245M 0 245M 0% /dev/shm
/dev/sda1 485M 47M 413M 11% /boot

```

In this basic example, we can see that the / partition only has 9% used.

For a more complex example that also covers using df to see various mountpoints, see below:

```
[root@mail ~]# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/VG-root 1.9T 1.7T 89G 95% /
/dev/mapper/VG-var 431G 145G 264G 36% /var
devtmpfs 7.8G 204K 7.8G 1% /dev
tmpfs 7.8G 4.0K 7.8G 1% /dev/shm
/dev/md1 495M 126M 344M 27% /boot
ku.example.com:9421 2.5T 487G 2.0T 20% /mnt/test
tmpfs 500M 86M 415M 18% /var/ngx_pagespeed_cache
```
`free`

The "free" command is used to display information about the system's memory usage, including total, used, and free memory. When used alone, it typically shows memory usage in kilobytes.

The "-h" option is used to display the output in a human-readable format. It converts the memory values into more understandable units such as megabytes (MB) or gigabytes (GB).

So, "free -h" will display the memory usage information in a human-readable format, making it easier to understand at a glance.

## Difference between du, df, free

| Command  | Meaning                                                   | Difference                                     |
|----------|-----------------------------------------------------------|------------------------------------------------|
| `du`     | Disk Usage                                                | Reports disk usage of files and directories within a specified path |
| `df`     | Disk Free                                                 | Reports disk space usage for mounted filesystems, showing total, used, and available space |
| `free`   | Free Memory                                               | Displays system's memory usage, including total, used, free, shared, and cached memory |
