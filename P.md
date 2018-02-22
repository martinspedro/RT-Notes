# COnfig computer ip address

```bash
/etc/networks/interfaces
iface enp3s0 inet static
	address 192.1.1.<nº grupo>
	mask 255.255.255.0
```

# Up network
```bash
ifup enp3s0
# Executar minicom
minicom
```

# Configure Router
```
configure terminal
interface fastEthernet 0/0 // slot/nº módulo
ip address 192.1.1.20 255.255.255.0
no shutdown
end

# write configuration file
write
```

# Ping computer
```
Router# ping 192.1.1.10
```

# Ping router
```
$ ping 192.1.1.20
```

# Ping Hub do Laboratório
```
$ ping 192.1.1.50
```

# Wireshark
Timestamp: 1 seg aproximadamente

## FIltros
Analyze -> Display Filters -> + 

### Filtrar pings
`icmp`

### Filtrar o meu ping
`icmp && ip.addr == 192.1.1.10`


### Filtrar o meu ping para o hub do lab
`icmp && ip.src_host == 192.1.10 && ip.dst_host == 192.1.1.50`

Endereço Ethernet da Source PC AsustekC_93:74:fd (d0:17:c2:93:74:fd)
Endereço Ethernet do Destation HUB IntelCor_39:20:47 (00:90:27:39:20:47)

Type	IPV4  (0x0800)

Protocol ICMP (x01)

ICMP
- 0 (echo (ping) reply)
- 8 (echo (ping) )


### Filtrar ARP Request
- Hardware type: Ethernet (0x0001)
- Protocol Type: IPv4 (0x0800)
- Cabeçalho do pacote Ethernet (0x0001)
	- Endereço Origem: AsustekC_93:74:fd (d0:17:c2:93:74:fd)
	- Sender Ip address: 192.1.1.10
	- Target MAC address: 00:00:00_00:00:00 (00:00:00:00:00:00)
	- Target IP address: 192.1.1.30

# Notes 15/Fev/2018
um router só precisa de duas portas porque  é uma interface entre duas redes

pc -> hub (direto/cruzado)
hub -> router (direto)

não colocar auto


 CIDR
- helps the network to have the news to crates more devices inside the network


 IP Adrress that are not routable in the INternet
A pc doesnt need to have a public address, the firewall takes care of it

NAT - network address translation
- monitorize the connections between the public addres and private addre

# nOTES 22 Feb 2018
- existe uma flag de desfragmentação
-

