# OSPF
## 6.1 e 6.2
Ao fazer o ping para uma estação no outro lado da rede, existe um redirect que segue o caminho estabelecido pelos custos das portas OSPF.
A deifnição dos custos faz com que seja possível mudar entre os sentidos

```
ping 192.30.30.2
Redirect Network, gateway 192.20.20.1 -> 192.20.20.2
84 bytes from 192.30.30.2 icmp_seq=1 ttl=254 time=20.791 ms
84 bytes from 192.30.30.2 icmp_seq=2 ttl=254 time=16.854 ms
84 bytes from 192.30.30.2 icmp_seq=3 ttl=254 time=16.951 ms
84 bytes from 192.30.30.2 icmp_seq=4 ttl=254 time=16.968 ms
84 bytes from 192.30.30.2 icmp_seq=5 ttl=254 time=17.105 ms
```

## 7 
Os pacotes capturados são `Hello Packets`, `LS Update` e `LS Acknowledge`

### Hello Packets
Os pacotes são enviados pelos vários routers, através das portas que possuem ligadas às redes
Indicam o Source OSPF router, o Desiganted Router, o Backup designated router e o active neighbour

`Internet Protocol Version 4, Src: 192.20.20.1, Dst: 224.0.0.5`

### LS Update
```
Open Shortest Path First
	OSPF Header
		Version: 2
		Message Type: LS Update (4)
		Packet Length: 60
		Source OSPF Router: 192.30.30.1
		Area ID: 0.0.0.0 (Backbone)
		Checksum: 0x1da0 [correct]
		Auth Type: Null (0)
		Auth Data (none): 0000000000000000
	LS Update Packet
		Number of LSAs: 1
		LSA-type 2 (Network-LSA), len 32
			.000 0000 0000 0001 = LS Age (seconds): 1
			0... .... .... .... = Do Not Age Flag: 0
			Options: 0x22 ((DC) Demand Circuits, (E) External Routing)
				0... .... = DN: Not set
				.0.. .... = O: Not set
				..1. .... = (DC) Demand Circuits: Supported
				...0 .... = (L) LLS Data block: Not Present
				.... 0... = (N) NSSA: Not supported
				.... .0.. = (MC) Multicast: Not capable
				.... ..1. = (E) External Routing: Capable
				.... ...0 = (MT) Multi-Topology Routing: No
			LS Type: Network-LSA (2)
			Link State ID: 192.20.20.2
			Advertising Router: 192.30.30.1
			Sequence Number: 0x80000002
			Checksum: 0xfc6b
			Length: 32
			Netmask: 255.255.255.0
			Attached Router: 192.30.30.1
			Attached Router: 192.20.20.1
```

O LS update é enviado por um router a outro router indicado todas as portas que vê para além das porta de envio

### LS ACK
```
Open Shortest Path First
	OSPF Header
		Version: 2
		Message Type: LS Acknowledge (5)
		Packet Length: 64
		Source OSPF Router: 192.20.20.1
		Area ID: 0.0.0.0 (Backbone)
		Checksum: 0x7a36 [correct]
		Auth Type: Null (0)
		Auth Data (none): 0000000000000000
	LSA-type 2 (Network-LSA), len 32
		.000 0000 0000 0010 = LS Age (seconds): 2
		0... .... .... .... = Do Not Age Flag: 0
		Options: 0x22 ((DC) Demand Circuits, (E) External Routing)
			0... .... = DN: Not set
			.0.. .... = O: Not set
			..1. .... = (DC) Demand Circuits: Supported
			...0 .... = (L) LLS Data block: Not Present
			.... 0... = (N) NSSA: Not supported
			.... .0.. = (MC) Multicast: Not capable
			.... ..1. = (E) External Routing: Capable
			.... ...0 = (MT) Multi-Topology Routing: No
		LS Type: Network-LSA (2)
		Link State ID: 192.10.10.1
		Advertising Router: 192.30.30.2
		Sequence Number: 0x80000002
		Checksum: 0xf189
		Length: 32
	LSA-type 2 (Network-LSA), len 32
		.000 0000 0000 0010 = LS Age (seconds): 2
		0... .... .... .... = Do Not Age Flag: 0
		Options: 0x22 ((DC) Demand Circuits, (E) External Routing)
			0... .... = DN: Not set
			.0.. .... = O: Not set
			..1. .... = (DC) Demand Circuits: Supported
			...0 .... = (L) LLS Data block: Not Present
			.... 0... = (N) NSSA: Not supported
			.... .0.. = (MC) Multicast: Not capable
			.... ..1. = (E) External Routing: Capable
			.... ...0 = (MT) Multi-Topology Routing: No
		LS Type: Network-LSA (2)
		Link State ID: 192.30.30.2
		Advertising Router: 192.30.30.2
		Sequence Number: 0x80000002
		Checksum: 0x1529
		Length: 32
```
É enviado em resposta ao LS Update, indicando que foi dado o ACK da nova informação que foi recebida

## 8
- Desativar o protocolo OSPF em todos os routers
  ```
  configure terminal
  no router ospf <router ospf ID>
  end
  write
  ```
- Esperar até todos os routers detetarem a inatividade
- COnfiguar os routers com as areas respetiva 
	- uma delas tem de ser obrigatoriamente a área 0 (backbone)
	```
	configure terminal
	router ospf <router ospdf ID>
	network <IP address> <negated network mask> area <area number>  // first port
	network <IP address> <negated network mask> area <area number>  // second port
	end
	write
	```

### R1

```
R1#show ip ospf database router

            OSPF Router with ID (192.30.30.2) (Process ID 1)

		Router Link States (Area 0)

  Routing Bit Set on this LSA
  LS age: 886
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.20.20.1
  Advertising Router: 192.20.20.1
  LS Seq Number: 80000002
  Checksum: 0x4D5A
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.10.10.1
     (Link Data) Router Interface address: 192.10.10.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


  LS age: 907
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.2
  Advertising Router: 192.30.30.2
  LS Seq Number: 80000003
  Checksum: 0xD79
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.10.10.1
     (Link Data) Router Interface address: 192.10.10.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1



		Router Link States (Area 1)

  Routing Bit Set on this LSA
  LS age: 848
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.20.20.1
  Advertising Router: 192.20.20.1
  LS Seq Number: 80000002
  Checksum: 0x4247
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1


  LS age: 830
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.1
  Advertising Router: 192.30.30.1
  LS Seq Number: 80000002
  Checksum: 0xEB5F
  Length: 48
  Number of Links: 2

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


  LS age: 833
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.2
  Advertising Router: 192.30.30.2
  LS Seq Number: 80000002
  Checksum: 0x1517
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10

```

- O router R1 está ligado a duas áreas. Por isso temos duas áreas nas entradas do router
- Isto significa que alguns dos routers estão a servir como area border router e outros apenas como designtaed routers, porque apenas pertencem a uma área
- Só existem duas entradas na area 0, uma devido ao anunciado pelo próprio router, outra pela interface do router 3 na áera 0
- As entradas das áreas aparecem separadas


### R2

```
R2#show ip ospf database router

            OSPF Router with ID (192.30.30.1) (Process ID 2)

		Router Link States (Area 1)

  Routing Bit Set on this LSA
  LS age: 1710
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.20.20.1
  Advertising Router: 192.20.20.1
  LS Seq Number: 80000002
  Checksum: 0x4247
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1


  LS age: 1692
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.1
  Advertising Router: 192.30.30.1
  LS Seq Number: 80000002
  Checksum: 0xEB5F
  Length: 48
  Number of Links: 2

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


  Routing Bit Set on this LSA
  LS age: 1694
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.2
  Advertising Router: 192.30.30.2
  LS Seq Number: 80000002
  Checksum: 0x1517
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


```

- O router 2 apenas tem noção do routers que pertecenm à area 1, operando como um designated router
- O router não sabe da existência da area 0


### R3

```
R3#show ip ospf database router

            OSPF Router with ID (192.20.20.1) (Process ID 3)

		Router Link States (Area 0)

  LS age: 88
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.20.20.1
  Advertising Router: 192.20.20.1
  LS Seq Number: 80000003
  Checksum: 0x4B5B
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.10.10.1
     (Link Data) Router Interface address: 192.10.10.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


  Routing Bit Set on this LSA
  LS age: 200
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.2
  Advertising Router: 192.30.30.2
  LS Seq Number: 80000004
  Checksum: 0xB7A
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.10.10.1
     (Link Data) Router Interface address: 192.10.10.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1



		Router Link States (Area 1)

  LS age: 89
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.20.20.1
  Advertising Router: 192.20.20.1
  LS Seq Number: 80000003
  Checksum: 0x4048
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1


  LS age: 1943
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.1
  Advertising Router: 192.30.30.1
  LS Seq Number: 80000002
  Checksum: 0xEB5F
  Length: 48
  Number of Links: 2

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.1
      Number of TOS metrics: 0
       TOS 0 Metrics: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.20.20.1
     (Link Data) Router Interface address: 192.20.20.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


  Routing Bit Set on this LSA
  LS age: 1944
  Options: (No TOS-capability, DC)
  LS Type: Router Links
  Link State ID: 192.30.30.2
  Advertising Router: 192.30.30.2
  LS Seq Number: 80000002
  Checksum: 0x1517
  Length: 36
  Area Border Router
  Number of Links: 1

    Link connected to: a Transit Network
     (Link ID) Designated Router address: 192.30.30.2
     (Link Data) Router Interface address: 192.30.30.2
      Number of TOS metrics: 0
       TOS 0 Metrics: 10


```

Semelhante ao R1

## Encaminhamento Hierárquico
- permite que tenha várias areas de encaminhamento. Reduzo as tabelas de encaminhamento dos router
- Na pior das hipoteses, um router esta ligaod a duas areas
- em redes grandes, as tabelas de encaminhamento nos routres são mais reduzidas


No router 2, temos:

```
R2#show ip route 
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.30.30.0/24 is directly connected, FastEthernet0/1
O IA 192.10.10.0/24 [110/2] via 192.30.30.2, 00:36:19, FastEthernet0/1
C    192.20.20.0/24 is directly connected, FastEthernet0/0
```

Em vez de o router 2 ter noção de todoas os routres dentro da rede 192.10.10.0, apenas sabe que existe um area border router que trata de do encaminhamento entre a area em qyue está a e area a que quer chegar


# BGP
Inicalemnte os routers enviam mensagens TCP a indicar que a counicação foi estabelecida.
Usam o bit SYN
Enviam para o destino da outra porta 

a outra porta responde com um ACK
Fora isso, envia uma OPEN MESSAGE, que identifica a Autonomous Area e o repsriyvo IP 

A área 2 envia internamente pacotes OSPF

## 9.2

```
R1#show ip route  
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set
C    192.10.10.0/24 is directly connected, FastEthernet0/0
C    192.20.20.0/24 is directly connected, FastEthernet0/1
B    192.30.30.0/23 [20/0] via 192.20.20.1, 00:29:55
```

```
R2#show ip route 
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set
C    192.30.30.0/24 is directly connected, FastEthernet0/1
B    192.10.10.0/24 [20/0] via 192.20.20.2, 00:39:14
C    192.20.20.0/24 is directly connected, FastEthernet0/0
B    192.30.30.0/23 [200/0] via 0.0.0.0, 00:30:05, Null0
```

```
R3#show ip route 
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.30.30.0/24 is directly connected, FastEthernet0/0
O*E2 0.0.0.0/0 [110/1] via 192.30.30.2, 00:01:25, FastEthernet0/0

```


Apesar de o router 3 não possuir redes exteriores ao seu sistema autonomo, consegue comunicar acom estas através do rpotocolo BGP
 
## 9.3
KEEPALIVE: 30 seg no início, depois 60 seg
ACK/TCP: 60 seg
HELLO PACKET: 10 seg
 
## 10
Quando ocorre a remoção da ligação do router R1 a outra SA são enviados pacotes de TCP RETRANSMISSION. Após 10 tentativas, existe uma NOTIFICATION MESSAGE com TTL= 1 e desegida um TCP protocol a indicar indicar que a ligação terminou (FLAG FIN is set)

Após restablecer a ligação:
Rapidamente é enviado um SYN e um ACK e é iniciado o processod e configuração da rede BGP

Terminando a ligação entre os routers R2 e R1, não se vê nada a acontecer (?)
 
## 11
Usando agregação de redes temos:

```
R1#show ip route 
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

B    192.30.30.0/24 [20/0] via 192.20.20.1, 00:00:41
C    192.10.10.0/24 is directly connected, FastEthernet0/0
C    192.20.20.0/24 is directly connected, FastEthernet0/1
B    192.30.30.0/23 [20/0] via 192.20.20.1, 00:38:31
```
Apenas a atabela de endereços do router 2 mudou, e passa a incluir um noo endereço (192.30.30.0), que é a rede entre o R2 e o R3, mas a mascara passa a ser /23 em vez de mascara /24. 
Isto failitia o professor de filtragem de rendereços do router, que podemser feito pro hardware


# 12.1
Ao dar shutdown no porto, aquilo que se verifica é tentado efetetar a retransmissão TCP
Após 16 tentativas, o protocolo BGP envia um change notification

O R3 deixa de estar ligado a R2

Não acontece nada (?)

Após retormar, o que acontece é um flood de pacote OSPF que causam o restaro da IP route

# 12.2

```
R3#show ip route 
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
		 D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
		 N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
		 E1 - OSPF external type 1, E2 - OSPF external type 2
		 i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
		 ia - IS-IS inter area, * - candidate default, U - per-user static route
		 o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.30.30.0/24 is directly connected, FastEthernet0/0
```


```
R2#show ip route      
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

B    192.10.10.0/24 [20/0] via 192.20.20.2, 00:21:13
C    192.20.20.0/24 is directly connected, FastEthernet0/0
```

```
R1#show ip route
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.10.10.0/24 is directly connected, FastEthernet0/0
C    192.20.20.0/24 is directly connected, FastEthernet0/1
```

Depois de eliminar a ligação, só o R2 é que passa a ter uma ligação BGP para R1. Todas as outras ligações são eliminadas

Depois de ativo, são enviados SYN e TCP para restabelecer a ligação BGP
o protocolo OSPF volta a restabelecer a ligação

