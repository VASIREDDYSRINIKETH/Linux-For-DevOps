# Firewalld Commands Cheat Sheet

Firewalld is a firewall management tool used in Linux distributions like CentOS and Fedora. While Ubuntu typically uses ufw (Uncomplicated Firewall) as its default firewall management tool, Firewalld can still be installed and used on Ubuntu systems.

## Syntax:

`firewall-cmd [options] [commands]`


## Options:

- `-h`, `--help`: Display help message and exit.
- `--state`: Print the current state (running or not).
- `--reload`: Reload firewall rules.
- `--complete-reload`: Reload firewall rules and keep active connections.
- `--list-all`: Show all information.
- `--zone=zone`: Specify zone (default is the default zone).
- `--permanent`: Make changes permanent (requires a subsequent reload).
- `--runtime-to-permanent`: Save runtime configuration to permanent.


## Managing Firewalld

1.To start the service and enable firewalld on boot:

sudo systemctl start firewalld

sudo systemctl enable firewalld


2.To stop and disable it:

sudo systemctl stop firewalld

sudo systemctl disable firewalld

3.Check the firewall status. The output should say either running or not running.

sudo firewall-cmd --state

4.To view the status of the firewalld daemon:

sudo systemctl status firewalld

5.To reload a firewalld configuration:

sudo firewall-cmd --reload

## Configuration Sets

- Firewalld uses two configuration sets: Runtime and Permanent. Runtime configuration changes are not retained on reboot or upon restarting firewalld whereas permanent changes are not applied to a running system.

- By default, firewall-cmd commands apply to runtime configuration but using the --permanent flag will establish a persistent configuration. To add and activate a permanent rule, you can use one of two methods.

1.Add the rule to both the permanent and runtime sets.

sudo firewall-cmd --zone=public --add-service=http --permanent

sudo firewall-cmd --zone=public --add-service=http

2.Add the rule to the permanent set and reload firewalld.

sudo firewall-cmd --zone=public --add-service=http --permanent

sudo firewall-cmd --reload

## Firewall Zones

- Zones are pre-constructed rulesets for various trust levels you would likely have for a given location or scenario (e.g. home, public, trusted, etc.). Different zones allow different network services and incoming traffic types while denying everything else. After enabling firewalld for the first time, Public will be the default zone.

- Zones can also be applied to different network interfaces. For example, with separate interfaces for both an internal network and the Internet, you can allow DHCP on an internal zone but only HTTP and SSH on external zone. Any interface not explicitly set to a specific zone will be attached to the default zone.

3.To view the default zone:

sudo firewall-cmd --get-default-zone

4.To change the default zone:

sudo firewall-cmd --set-default-zone=internal

5.To see the zones used by your network interface(s):

sudo firewall-cmd --get-active-zones

6.To get all configurations for a specific zone:

sudo firewall-cmd --zone=public --list-all

7.To get all configurations for all zones:

sudo firewall-cmd --list-all-zones

## Working with Services

- Firewalld can allow traffic based on predefined rules for specific network services. You can create your own custom service rules and add them to any zone. The configuration files for the default supported services are located at /usr/lib/firewalld/services and user-created service files would be in /etc/firewalld/services.

8.To view the default available services:

sudo firewall-cmd --get-services

9.As an example, to enable or disable the HTTP service:

sudo firewall-cmd --zone=public --add-service=http --permanent

sudo firewall-cmd --zone=public --remove-service=http --permanent

## Allowing or Denying an Arbitrary Port/Protocol

10.As an example: Allow or disable TCP traffic on port 12345.

sudo firewall-cmd --zone=public --add-port=12345/tcp --permanent

sudo firewall-cmd --zone=public --remove-port=12345/tcp --permanent

## Port Forwarding

11.The example rule below forwards traffic from port 80 to port 12345 on the same server.

sudo firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=12345

### To forward a port to a different server:

12.Activate masquerade in the desired zone.

sudo firewall-cmd --zone=public --add-masquerade

13.Add the forward rule. This example forwards traffic from local port 80 to port 8080 on a remote server located at the IP address: 198.51.100.0.

sudo firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=198.51.100.0

14.To remove the rules, substitute --add with --remove. For example:

sudo firewall-cmd --zone=public --remove-masquerade

## Constructing a Ruleset with Firewalld

- As an example, here is how you would use firewalld to assign basic rules to your Linode if you were running a web server.

15.Assign the dmz zone as the default zone to eth0. Of the default zones offered, dmz (demilitarized zone) is the most desirable to start with for this application because it allows only SSH and ICMP.

sudo firewall-cmd --set-default-zone=dmz

sudo firewall-cmd --zone=dmz --add-interface=eth0

16.Add permanent service rules for HTTP and HTTPS to the dmz zone:
```
sudo firewall-cmd --zone=dmz --add-service=http --permanent

sudo firewall-cmd --zone=dmz --add-service=https --permanent
```

17.Reload firewalld so the rules take effect immediately:

sudo firewall-cmd --reload

If you now run firewall-cmd --zone=dmz --list-all, this should be the output:

```
dmz (default)
  interfaces: eth0
  sources:
  services: http https ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
```

This tells us that the dmz zone is our default which applies to the eth0 interface, all network sources and ports. Incoming HTTP (port 80), HTTPS (port 443) and SSH (port 22) traffic is allowed and since there are no restrictions on IP versioning, this will apply to both IPv4 and IPv6. Masquerading and port forwarding are not allowed. We have no ICMP blocks, so ICMP traffic is fully allowed, and no rich rules. All outgoing traffic is allowed.
