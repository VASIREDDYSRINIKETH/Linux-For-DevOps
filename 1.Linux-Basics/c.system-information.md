# Linux Commands to Gather Information About Your System

## Display CPU Information

- **Command:** `lscpu`
- **Description:** The `lscpu` utility provides a comprehensive summary of your CPU's capabilities, including model information, the number of cores, speeds, flags, virtualization capabilities, and security mitigations applied.

## Gather Disk Information

- **Command:** `lsblk`
- **Description:** Linux provides many utilities to look at the storage and disks attached to your system, such as `df`, `fdisk`, or `mount`. These are great options for gathering specific information. You can also use `lsblk` to get an overview of your block devices at a glance.

## List Hardware

- **Command:** `lshw`
- **Description:** `lshw` is a small tool to extract detailed information on the hardware configuration of the machine. It can report exact memory configuration, firmware version, mainboard configuration, CPU version and speed, cache configuration, bus speed, etc.
  - `$ sudo lshw | less` (or more)
  - `$ sudo lshw -html > myhardware.html`
  - `$ sudo lshw -xml > myhardware.xml`

## See USB Info

- **Command:** `lsusb -tv`
- **Description:** Displays information about USB devices connected to the system.

## Display BIOS Information

- **Command:** `dmidecode -q | less`
- **Description:** Shows specific information about the system's BIOS.

## See Specific Information About Disk

- **Command:** `hdparm -i /dev/sda`
- **Description:** Provides specific information about a disk (example shows disk `sda`).

