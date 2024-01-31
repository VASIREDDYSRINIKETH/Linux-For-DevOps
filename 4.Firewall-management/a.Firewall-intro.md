# Introduction to Linux Firewall

- A firewall can be defined as a system of network security that controls and filters the traffic based on a predefined set of rules. It acts as an intermediary system between the Internet and the device it protects.

- The Linux kernel contains a subsystem called Netfilter, which is used for deciding or manipulating the fate of network traffic passing through or into the server. Most modern Linux firewall solutions utilize this subsystem for packet filtering.

- The packet filtering process within the kernel would be of little use to many administrators without a userspace interface for managing it. This is where iptables comes into play: when a packet reaches the server, iptables hands it off to the Netfilter subsystem for rejection, acceptance, or manipulation based on various rules supplied by userspace.

- Therefore, iptables is all that's needed to manage the firewall if one is familiar with it. However, several frontends exist to simplify the task.

Some key points are mentioned below that we need to know about Linux firewall:

- A firewall is a group of rules.
  
- When a packet of data moves out or into a protected space, then its contents (information about its target, protocol, and the origin it plans for using) are checked against the rules of the firewall to see if it must be permitted through.
  
- Besides, iptables is another tool of CLI to manage the rules of firewall on any Linux machine.
  
- Also, Firewalld is a tool to manage the rules of a firewall on any Linux machine.
- Linux firewall can also be described as a device that checks Network traffic (outbound/inbound connections) and establishes a decision to traffic out or pass the traffic.
  
- In this era, Network Security is derived from different kinds of Linux firewalls.
  
- In the traditional packet, firewall filtering deals with filtering and routing packets, where else NGFWs would work with some other functions (with OSI layers).

## Firewalld

Firewalld can be defined as a way for protecting machines from outside from unwanted traffic. It enables all the users to manage network traffic (incoming) on host machines by specifying the firewall rules set. These rules can be used for sorting the traffic and either allow it or block through.

- Firewalld applies the concepts of services and zones that simplify the management of traffic.
- Zones are a set of predefined rules.
  
- Network sources and interfaces are assigned to the zone.
  
- The traffic permitted depends on the network our computer is linked to and the level of security this network is elected.
  
- The firewall services can be defined as some predefined rules that enclose each essential setting to permit the traffic for a particular service and they use within the zone.
  
- Services use multiple addresses or ports for network communication.
  
- The filter communication of firewalls is based on the ports.
  
- To permit network traffic for any service, its ports should be open.

- Firewalld can block every traffic on the ports that aren't set as open explicitly.

- By default, a few zones like trusted permit each traffic.

- Firewalld could be used for separating networks into distinct zones based on the trust level that a user has determined for placing on the traffic and interfaces in that network.

## Working of Linux Firewall

Most of the distributions of Linux ship with many tools of default firewall that could be used for configuring them. We will use "IPTables" (default tool) given in Linux to create a firewall. Iptables is used for setting up, inspecting, and maintaining the packet filter rules of IPv6 and IPv4 tables in a Linux kernel.

Important: Every command in this article requires the privileges of sudo.

## Iptables Working

Network traffic is composed of packets. Data is divided into various small pieces (known as packets), transferred over a network, put back altogether. Specifically, iptables recognizes the packets which are received and applies a group of rules for deciding what we can do to them.

Ipatables is a command-line interface application that permits an administrator for configuring particular rules that would enforce a Linux kernel to implement an action like drop, modify, or inspect network packets

Distinct programs and modules of the kernel are used for distinct protocols such as:

- IPtables for IPv4
- arp tables for ARP
- ip6tables for IPv6
- ebtables for Ethernet frames

Later, a project called Netfilter developed the Nftables for scalability and performance, serving as a framework for the packet filtering process that does a similar job to Iptables.

## Iptables Overview

Iptables is used for filtering packets according to:

- **Tables**: These are files that can join the same operations. A table is composed of various chains.
- **Chains**: The chains are the rule's string. Iptables finds an appropriate table if any packet is received, then executes it from the rule's chains until it searches for a match.
- **Rules**: The rules are the statement that informs a system what needs to do with the packets. They can block a single packet type, or forward other types of packets. The result, in which a packet is transferred, is known as the target.
- **Targets**: The target is a determination of what needs to do with the packets. It is typically for accepting it, rejecting it, or dropping it (which transfers the error back to a sender).

### Chains

A chain is a group of rules described for a specific task. There are three types of chains that can be used for processing the traffic:

1. **FORWARD Chains**: The traffic which is arising from the network (external) and going to other networks requires to go from the forward chain. It can be used if two or more systems are linked and we wish to transfer data between them.
2. **OUTPUT Chains**: The traffic going through our local machine towards the Internet requires us to go from these output chains.
3. **INPUT Chains**: The traffic arising through the network (internal) to our local machine will go from the input chains. It means they need to go from every rule that has been fixed up within the input chains.

### TABLES

The iptables of the Linux firewall contain four tables by default. We will list every four tables.

## 1. Filter

This table is widely used. It works as the bouncer and determines who gets out and in of our network. It contains some default chains such as forward, input, and output chains.

## 2. Network Address Translation (NAT)

It includes rules of Network Address Translation (NAT) to route packets to the networks that can't be directly accessed. If the source or destination of a packet has to be modified, then the NAT table will be used. It contains some chains which are mentioned below:

- Prerouting: It is used for assigning the packets as soon as a server gets them.
- Output: This chain acts similarly to the output chain that we explained above.
- Postrouting: It permits to make of alterations to the packets after these packets leave the output chain.

## 3. Mangle

This table is used for adjusting the packet's IP header properties. It contains every chain we explained above:

- Forward
- Input
- Output
- Postrouting
- Prerouting

## 4. Raw

This table is used for exempting packets through connection tracking. It contains two chains:

- Prerouting
- Output

## 5. Security

This table is optional. Some of the Linux versions use the Security table for managing unique access rules. It contains forward, input, and output chains.

## Targets

The target is what goes on after the packet matches any rule criteria. Many targets (non-terminating) keep matching various packets with rules within a chain even if a packet is matching a rule.

The packet is immediately evaluated and isn't matched with other chains in the terminating targets.

## Different Types of Policies

There are three different actions that an iptables can implement over the traffic:

1. **ACCEPT**: The iptables will accept the traffic when the traffic passes some rules in the specified chain. It means it opens up many ways and permits the user to access the rules and regulations.

2. **REJECT**: This action is the same as the drop action. However, it transfers a message to a sender of any traffic illustrating that the transfer of data has failed. We can use the REJECT action as a normal rule when we wish another end to understand the port is unavailable.

3. **DROP**: The iptables can block any traffic when it can't pass the rules inside the specified chain. It means that the firewall has closed.

4. **RETURN**: It transfers a packet back to the producing chain so we could match it with other rules.

## Configure and install firewall iptables in Ubuntu

By default, the iptables is installed on most of the Linux distros. We can use the following command to ensure that iptable is available on our system:

`sudo apt-get install iptables`

## Difference between ip-tables and firewalld

| Aspect          | iptables                                             | firewalld                                           |
|-----------------|------------------------------------------------------|-----------------------------------------------------|
| Level           | Kernel-level firewall management                     | High-level firewall management with dynamic updates |
| Syntax          | Complex and requires knowledge of networking concepts| Simplified with zones, services, and ports          |
| Configuration   | Direct manipulation of rules using command-line      | Managed via user-friendly interface or command-line |
| Dynamic Updates | Rules must be manually updated                        | Supports dynamic updates without disrupting traffic|
| Granularity     | Fine-grained control over rules                      | Abstraction provides ease of management             |
