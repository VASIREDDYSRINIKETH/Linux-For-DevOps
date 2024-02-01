# Core Concepts for Package Management

- Most software applications designed for Linux or Unix systems are distributed as packages, which are archives that contain the pre-compiled binary software files, installation scripts, configuration files, dependency requirements, and other details about the software. These packages are typically specific to a particular distribution and formatted in that distribution’s preferred package format, such as .deb for Debian/Ubuntu and .rpm for CentOS/RHEL.

- While it’s relatively simple for a user to install a package file, there are other complexities to consider. These complexities include obtaining (downloading) the package, ensuring packages are upgraded with security and bug fixes, and maintaining all the dependencies for the software.

## Comparison of Package Managers

- There are lots of package managers in Linux, each working a bit differently. Here is a list of common package managers, along with their supported distributions, package file formats, and a description.

`APT`

Using APT to Manage Packages in Debian and Ubuntu

- **Distributions**: Ubuntu, Debian, and Kali Linux

- **Commands**: apt, apt-get, apt-cache

- **Underlying package management tool**: dpkg

- **Package file format**: .deb

Advanced Package Tool, more commonly known as APT, is a package management system for Debian, Ubuntu, and other similar Linux distributions. It acts as a front-end to the lower-level dpkg package manager, which is used for installing, managing, and providing information on .deb packages. Most distributions that use APT also include a collection of command-line tools that can be used to interface with APT. These tools include apt-get, apt-cache, and the newer apt, which essentially combines both of the previous tools with some modified functionality.

`DNF`

Using DNF to Manage Packages in CentOS/RHEL 8 and Fedora

- **Distributions**: RHEL/CentOS 8, Fedora 22, and later versions of both distributions

- **Commands**: dnf, yum

- **Underlying package management tool**: RPM (RPM Package Manager)

- **Package file format**: .rpm

Dandified YUM, or simply DNF, is the successor to YUM. Just like YUM, DNF provides a user-friendly interface to the RPM Package Manager (RPM) that comes with CentOS, RHEL, Fedora, and many other Linux distributions. As the successor to YUM, DNF has several enhancements including increased performance, faster dependency resolution, and more complete documentation for its API. Most distributions still link the yum command to the DNF software and, since DNF maintains compatibility with much of YUM’s CLI, most commands using yum still function as intended.

`YUM`

Using YUM to Manage Packages in CentOS/RHEL 7 and Earlier

- **Distributions**: RHEL/CentOS 7, Fedora 21, and earlier versions of both distributions

- **Command**: yum

- **Underlying package management tool**: RPM (RPM Package Manager)

- **Package file format**: .rpm

Yellowdog Updater, Modified, more commonly known as YUM, is a package management tool for a variety of older RHEL-based distributions (such as CentOS 7) and older versions of Fedora. It provides an easy-to-use interface on top of the low-level functions available in the RPM Package Manger (RPM). It has largely been replaced by it successor Dandified YUM, also called DNF, on most newer RPM-based distributions.
