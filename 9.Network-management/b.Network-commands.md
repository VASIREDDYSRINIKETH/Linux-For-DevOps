# Network commands

# Linux Networking Commands Cheat Sheet

This cheat sheet provides a quick reference guide for commonly used Linux networking commands. Whether you're a beginner or an experienced Linux user, these commands will help you manage and troubleshoot network-related tasks efficiently.

## Basic Commands

1. **ifconfig**: Display or configure network interfaces.

    ```bash
    ifconfig [interface] [options]
    ```

    Example: `ifconfig eth0`

2. **ip**: Display or manipulate routing, devices, policy routing, and tunnels.

    ```bash
    ip [options] [object] [command]
    ```

    Example: `ip addr show`

3. **ping**: Send ICMP ECHO_REQUEST packets to network hosts.

    ```bash
    ping [options] destination
    ```

    Example: `ping 8.8.8.8`

4. **traceroute**: Print the route packets take to network host.

    ```bash
    traceroute [options] destination
    ```

    Example: `traceroute google.com`

5. **netstat**: Display network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.

    ```bash
    netstat [options]
    ```

    Example: `netstat -a`

    `netstat -tulpn`

## Intermediate Commands

6. **route**: View or manipulate the IP routing table.

    ```bash
    route [options]
    ```

    Example: `route -n`

7. **nslookup**: Query Internet name servers interactively.

    ```bash
    nslookup [options] host
    ```

    Example: `nslookup google.com`

8. **dig**: DNS lookup utility.

    ```bash
    dig [options] host
    ```

    Example: `dig google.com`

9. **iptables**: Administration tool for IPv4 packet filtering and NAT.

    ```bash
    iptables [options]
    ```

    Example: `iptables -L`

## Advanced Commands

10. **ss**: Display socket statistics.

    ```bash
    ss [options]
    ```

    Example: `ss -t`

11. **tcpdump**: Dump traffic on a network.

    ```bash
    tcpdump [options] [expression]
    ```

    Example: `tcpdump -i eth0`

12. **nc**: Netcat utility for reading from and writing to network connections.

    ```bash
    nc [options] destination port
    ```

    Example: `nc -l -p 1234`

13. **nmap**: Network exploration tool and security/port scanner.

    ```bash
    nmap [Scan Type(s)] [Options] {target specification}
    ```

    Example: `nmap -sP 192.168.1.0/24`

14. **arp**: Manipulate the system ARP cache.

    ```bash
    arp [options] [hostname]
    ```

    Example: `arp -a`

15. **ifup/ifdown**: Bring a network interface up or down.

    ```bash
    ifup [interface] / ifdown [interface]
    ```

    Example: `ifup eth0`

These commands cover a wide range of networking tasks, from basic diagnostics to more advanced network analysis and management.

For more detailed information on each command and its options, consult the manual pages (`man` command) or online resources.
