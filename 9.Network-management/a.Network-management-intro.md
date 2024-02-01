# Network Management

The two services responsible for managing network in Linux are network-scripts(network service) and NetworkManager service.

## What Is network-scripts (network service) In Linux

The network service is one of the utilities used to manage network in Linux but deprecated in distributions like RHEL 8, CentOS 8, etc.

Configuring and managing network interfaces with network service requires creating scripts manually. Scripts such as (ifcfg-*). Hence, one needs to be conversant with network scripts while using the network service to manage network.

some of the network service commands are

```
systemctl start network.service
systemctl stop network.service
systemctl restart network.service
```

## What Is NetworkManager In Linux

As the name implies, NetworkManager is one of the utilities that is used to manage network, including network interface cards (NIC) in Linux.

Configuring and managing network with NetworkManager does not require creating scripts manually unlike when using network-scripts. NetworkManager was introduced to easily manage network, eradicate the need for creating scripts and make network configuration simple and automatic as possible.
