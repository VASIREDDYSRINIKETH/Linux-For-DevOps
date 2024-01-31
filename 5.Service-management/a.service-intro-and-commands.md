# Service management

Systemd is a system and service manager for Linux operating systems. It is responsible for managing the startup and shutdown of the system, as well as managing the services that run on the system.

The service command starts, stop and restart a daemon or services by calling the script. Usually all scripts are stored in /etc/init.d directory.

## Journalctl

`journalctl` is a command-line utility in Linux used to query and display logs from the systemd journal. Here's why it's commonly used:

- **Centralized Logging**: `journalctl` provides access to all system logs managed by the systemd journal in one central location.

- **Powerful Querying**: It allows users to filter and query logs based on various criteria such as time range, log priority, specific units (services), and more.

- **Structured Data**: Logs collected by systemd are stored in a structured format, making it easier to extract specific information and analyze logs programmatically.

- **Persistent Storage**: The systemd journal stores logs persistently across system reboots, ensuring that log data is retained even after a system restart.

- **Integration with Systemd Services**: `journalctl` provides an integrated way to view logs for specific services managed by systemd.

- **Real-time Monitoring**: It can also be used to monitor logs in real-time, allowing users to observe log entries as they are generated.

In summary, `journalctl` is a powerful tool for managing and analyzing logs on Linux systems, providing a centralized and structured approach to log management.


## Difference between SERVICE,SYSTEMCTL,chconfig commands

| Command   | Description                                                 | Usage                                                |
|-----------|-------------------------------------------------------------|------------------------------------------------------|
| `service` | A script located in `/etc/init.d/` used to start, stop, and manage services. It's the traditional method for managing services. | `service <service_name> <action>`                    |
| `systemctl` | A central management tool for controlling the systemd system and service manager. It can be used to start, stop, enable, disable, reload, and check the status of system services. | `systemctl <action> <service_name>`                 |
| `chkconfig` | A command-line tool used to enable or disable system services at boot time. It doesn't start or stop services directly but configures them to start or not start at boot time. | `chkconfig <service_name> <on|off>`                 |



## Examples using Docker

### Service

1.**Start Docker service**:

service docker start

2.**Stop Docker service**:

service docker stop

3.**Restart Docker service**:

service docker restart

4.**Check Docker service**:

service docker status

5.**Reload Docker service**:

service docker reload

### Systemctl

1.**Start Docker service**:

sudo systemctl start docker

2.**Stop Docker service**:

sudo systemctl stop docker


3.**Restart Docker service**:

sudo systemctl restart docker


4.**Check Docker service**:

sudo systemctl status docker


5.**Reload Docker service**:

 sudo systemctl reload docker


6.**Enable/disable Docker service**:

sudo systemctl enable docker
sudo systemctl disable docker


### Chkconfig

If you are using `chkconfig`:

1.**Enable Docker service at boot**:

sudo chkconfig docker on

2.**Disable Docker service at boot**:

sudo chkconfig docker off

3.**Check Docker service status**:

sudo chkconfig --list docker
