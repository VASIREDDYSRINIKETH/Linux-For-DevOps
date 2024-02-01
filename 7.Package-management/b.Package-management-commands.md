# Commands

## High and low-level package tools

| Distribution and Derivatives | Low-Level Tool | High-Level Tool |
|------------------------------|----------------|-----------------|
| Debian and derivatives       | dpkg           | apt-get / aptitude |
| CentOS                       | rpm            | yum             |
| openSUSE                    | rpm             | zypper          |

## Commands for all package tool

| Package Manager | Command                 | Description                                                                                             |
|-----------------|-------------------------|---------------------------------------------------------------------------------------------------------|
| apt             | `apt update`            | Updates the package index, ensuring you have the latest information about available packages.          |
| apt             | `apt upgrade`           | Upgrades all installed packages to their latest versions.                                              |
| apt             | `apt install <package>` | Installs a new package along with its dependencies.                                                     |
| apt             | `apt remove <package>`  | Removes a package from the system.                                                                      |
| dpkg            | `dpkg -l`               | Lists all installed packages on the system.                                                             |
| dpkg            | `dpkg -i <package.deb>` | Installs a package from a .deb file.                                                                    |
| dpkg            | `dpkg -r <package>`     | Removes a package from the system.                                                                      |
| rpm             | `rpm -qa`               | Lists all installed packages on the system.                                                             |
| rpm             | `rpm -i <package.rpm>`  | Installs a package from a .rpm file.                                                                    |
| rpm             | `rpm -e <package>`      | Removes a package from the system.                                                                      |
| yum             | `yum install <package>` | Installs a package along with its dependencies.                                                         |
| yum             | `yum remove <package>`  | Removes a package from the system.                                                                      |
| yum             | `yum search <keyword>`  | Searches for packages matching the specified keyword.                                                   |
| dnf             | `dnf install <package>` | Installs a package along with its dependencies.                                                         |
| dnf             | `dnf remove <package>`  | Removes a package from the system.                                                                      |
| dnf             | `dnf search <keyword>`  | Searches for packages matching the specified keyword.                                                   |
| dnf             | `dnf update`            | Updates all installed packages to their latest versions.                                                |
