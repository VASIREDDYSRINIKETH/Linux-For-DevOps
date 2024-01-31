# Use Linux iptables to Manage IPv4 Traffic

## The iptables Command

Many options can be used with the iptables command. As stated above, iptables sets the rules that control network traffic. You can define different tables to handle these rules through chains, lists of rules that match a subset of packets. The table contains a variety of built-in chains, but you can add your own.

Basic iptables Parameters and Syntax

Before we begin creating rules, let’s review the syntax of an iptables rule.

For example, the following command adds a rule to the beginning of the chain that will drop all packets from the address 198.51.100.0:

```
iptables -I INPUT -s 198.51.100.0 -j DROP
```

The sample command above:

Calls the iptables program
Uses the -I option for insertion. Using a rule with the insertion option will add it to the beginning of a chain and will be applied first. To indicate a specific placement in the chain, you may also use a number with the -I option.
The -s parameter, along with the IP address (198.51.100.0), indicates the source.
Finally, the -j parameter stands for jump. It specifies the target of the rule and what action will be performed if the packet is a match.

| Parameter           | Description                                                                                   |
|---------------------|-----------------------------------------------------------------------------------------------|
| -p, --protocol      | The protocol, such as TCP, UDP, etc.                                                         |
| -s, --source        | Can be an address, network name, hostname, etc.                                              |
| -d, --destination   | An address, hostname, network name, etc.                                                      |
| -j, --jump          | Specifies the target of the rule; i.e. what to do if the packet matches.                      |
| -g, --goto chain    | Specifies that the processing will continue in a user-specified chain.                        |
| -i, --in-interface  | Names the interface from where packets are received.                                          |
| -o, --out-interface | Name of the interface by which a packet is being sent.                                        |
| -f, --fragment      | The rule will only be applied to the second and subsequent fragments of fragmented packets.    |
| -c, --set-counters | Enables the admin to initialize the packet and byte counters of a rule.                        |

## Basic iptables Options

There are many options that may be used with the iptables command:

| Option                | Description                                                          |
|-----------------------|----------------------------------------------------------------------|
| -A, --append          | Add one or more rules to the end of the selected chain.              |
| -C, --check           | Check for a rule matching the specifications in the selected chain.  |
| -D, --delete          | Delete one or more rules from the selected chain.                    |
| -F, --flush           | Delete all the rules one-by-one.                                      |
| -I, --insert          | Insert one or more rules into the selected chain as the given rule number. |
| -L, --list            | Display the rules in the selected chain.                              |
| -n, --numeric         | Display the IP address or hostname and port number in numeric format.|
| -N, --new-chain <name>| Create a new user-defined chain.                                      |
| -v, --verbose         | Provide more information when used with the list option.             |
| -X, --delete-chain <name>| Delete the user-defined chain.                                     |

## Insert, Replace or Delete iptables Rules

iptables rules are enforced top down, so the first rule in the ruleset is applied to traffic in the chain, then the second, third and so on. This means that rules cannot necessarily be added to a ruleset with iptables -A or ip6tables -A. Instead, rules must be inserted with iptables -I or ip6tables -I.

### Insert

Inserted rules need to be placed in the correct order with respect to other rules in the chain.

1.To get a numerical list of your iptables rules:

```

sudo iptables -L -nv --line-numbers

```

For example, let’s say you want to insert a rule into the basic ruleset provided in this guide, that will accept incoming connections to port 8080 over the TCP protocol. We’ll add it as rule 7 to the INPUT chain, following the web traffic rules:

```
sudo iptables -I INPUT 7 -p tcp --dport 8080 -m state --state NEW -j ACCEPT
```

If you now run sudo iptables -L -nv again, you’ll see the new rule in the output.

### Replace

Replacing a rule is similar to inserting, but instead uses iptables -R. For example, let’s say you want to reduce the logging of denied entries to only 3 per minute, down from 5 in the original ruleset. The LOG rule is ninth in the INPUT chain:

```
sudo iptables -R INPUT 9 -m limit --limit 3/min -j LOG --log-prefix "iptables_INPUT_denied: " --log-level 7
```

### Delete

Deleting a rule is also done using the rule number. For example, to delete the rule we just inserted for port 8080:

```
sudo iptables -D INPUT 7
```

### View Your Current iptables Rules

IPV4:

```
sudo iptables -L -nv
```

## Configure iptables

- iptables can be configured and used in a variety of ways. The following sections will outline how to configure rules by port and IP, as well as how to block or allow addresses.
  
### Block Traffic by Port

- You may use a port to block all traffic coming in on a specific interface. For example:

```
iptables -A INPUT -j DROP -p tcp --destination-port 110 -i eth0
```

Let’s examine what each part of this command does:

- `-A` will add or append the rule to the end of the chain.
- `INPUT` will add the rule to the table.
- `DROP` means the packets are discarded.
- `-p tcp` means the rule will only drop TCP packets.
- `--destination-port 110` filters packets targeted to port 110.
- `-i eth0` means this rule will impact only packets arriving on the eth0 interface.

It is important to understand that iptables do not recognize aliases on the network interface. Therefore, if you have several virtual IP interfaces, you will have to specify the destination address to filter the traffic. A sample command is provided below:

```
iptables -A INPUT -j DROP -p tcp --destination-port 110 -i eth0 -d 198.51.100.0
```

You may also use -D or --delete to remove rules. For example, these commands are equivalent:

```
iptables --delete INPUT -j DROP -p tcp --destination-port 110 -i eth0 -d 198.51.100.0

iptables -D INPUT -j DROP -p tcp --destination-port 110 -i eth0 -d 198.51.100.0
```

### Drop Traffic from an IP

In order to drop all incoming traffic from a specific IP address, use the iptables command with the following options:

```
iptables -I INPUT -s 198.51.100.0 -j DROP
```
To remove these rules, use the --delete or -D option:

```
iptables --delete INPUT -s 198.51.100.0 -j DROP

iptables -D INPUT -s 198.51.100.0 -j DROP
```

### Block or Allow Traffic by Port Number to Create an iptables Firewall

One way to create a firewall is to block all traffic to the system and then allow traffic on certain ports. Below is a sample sequence of commands to illustrate the process:

```
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i lo -m comment --comment "Allow loopback connections" -j ACCEPT

iptables -A INPUT -p icmp -m comment --comment "Allow Ping to work as expected" -j ACCEPT

iptables -A INPUT -p tcp -m multiport --destination-ports 22,25,53,80,443,465,5222,5269,5280,8999:9003 -j ACCEPT

iptables -A INPUT -p udp -m multiport --destination-ports 53 -j ACCEPT

iptables -P INPUT DROP

iptables -P FORWARD DROP

```

Let’s break down the example above. The first two commands add or append rules to the INPUT chain in order to allow access on specific ports. The -p tcp and -p udp options specify either UDP or TCP packet types. The -m multiport function matches packets on the basis of their source or destination ports, and can accept the specification of up to 15 ports. Multiport also accepts ranges such as 8999:9003 which counts as 2 of the 15 possible ports, but matches ports 8999, 9000, 9001, 9002, and 9003. The next command allows all incoming and outgoing packets that are associated with existing connections so that they will not be inadvertently blocked by the firewall. The final two commands use the -P option to describe the default policy for these chains. As a result, all packets processed by INPUT and FORWARD will be dropped by default.

Note that the rules described above only control incoming packets, and do not limit outgoing connections.

## Allow or Block Traffic by Address

You can use iptables to block all traffic and then only allow traffic from certain IP addresses. These firewall rules limit access to specific resources at the network layer. Below is an example sequence of commands:

```
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i lo -m comment --comment "Allow loopback connections" -j ACCEPT

iptables -A INPUT -p icmp -m comment --comment "Allow Ping to work as expected" -j ACCEPT

iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT

iptables -A INPUT -s 198.51.100.0 -j ACCEPT

iptables -P INPUT DROP

iptables -P FORWARD DROP

```
In the first command, the -s 192.168.1.0/24 statement specifies that all source IPs (-s) in the address space of 192.168.1 are allowed. You may specify an IP address range using CIDR (Classless Inter-Domain Routing) notation, or individual IP addresses, as in the second command. The third command allows all incoming and outgoing packets that are associated with existing connections. The final two commands set the default policy for all INPUT and FORWARD chains to drop all packets.

### Basic iptables Rulesets for IPv4 

IPV4

```
# Allow all loopback (lo0) traffic and reject traffic
# to localhost that does not originate from lo0.
-A INPUT -i lo -j ACCEPT
-A INPUT ! -i lo -s 127.0.0.0/8 -j REJECT

# Allow ping.
-A INPUT -p icmp -m state --state NEW --icmp-type 8 -j ACCEPT

# Allow SSH connections.
-A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Allow HTTP and HTTPS connections from anywhere
# (the normal ports for web servers).
-A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT

# Allow inbound traffic from established connections.
# This includes ICMP error returns.
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Log what was incoming but denied (optional but useful).
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables_INPUT_denied: " --log-level 7

# Reject all other inbound.
-A INPUT -j REJECT

# Log any traffic that was sent to you
# for forwarding (optional but useful).
-A FORWARD -m limit --limit 5/min -j LOG --log-prefix "iptables_FORWARD_denied: " --log-level 7

# Reject all traffic forwarding.
-A FORWARD -j REJECT

```

### Verify iptables Rulesets

sudo iptables -vL

