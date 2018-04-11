# Network Structure
- **Network borders**
	- Estações
	- Exemplo: a _network_ que temos em casa
- **Network nucleus**
	- malhas de routers interligados
		- normalmente, por fibra ótica
	- cria uma _network_ de _networks_
	- MPLS (Multi Protocol Label Switching)
		- circuitos virtuais sobre a uma camada física de links óticos)
- **Access Networks**
	- Interliga diferentes áreas
	- É o que o _network provider_ nos vende
	- Ligação residential/comercial
		- ADSL fiber
	- É o que bloqueia o acesso à Internet
	- O acesso é partilhado entre todos
		- Vários telefones partilham a mesma torre de telemóvel

## Network periphery (borders)
- Estações (`hosts`)
	- Executam aplicações
		- email
		- web


Num modelo **cliente servidor**:

- A `client station` efetua um pedido a um serviço e recebe informação do servidor.
	- o servidor está **sempre à escuta**
	- Exemplo de serviços:
		- browser/web server 
		- client/server email


Num modelo **peer-to-peer**

- Pequena utilização 
- Nenhum ou poucos servidores dedicados


## Access Networks
- Como são efetuadas as conexões entre os núcleos?
	- Redes de acesso residenciais;
	- Redes de acesso institucional (escolas, empresas);
	- Redes de Acesso móvel.

- Questões que se colocam:
	- Qual é a bitrate da rede de acesso?
	- A rede de acesso é partilhada ou dedicada?
	- Existe alguma `contention rate`?
	- Qual é a latência?

### Contention rate
A taxa de contenção da rede é a 

$$contention\ rate = \frac{quantidade\ total\ de\ BW\ que\ estou\ a\ vender}{Nº\ de\ clientes\ a\ que\ estou\ a\ vender}$$

Pode facilmente variar entre 1 e 5. A largura de banda que é vendida a cada utilizador não é a largura de banda real que esse utilizador tem direito em todas as condições. 

O que acontece é uma partilha de recursos entre os vários clientes, uma vez que a probabilidade de todos os utilizadores precisarem da largura de banda máxima ao mesmo tempo é muito baixa, o dimensionamento do sistema para este caso é demasiado caro e conduz ao desperdício de recursos.

Assim, é optado por subdimensionar a rede, numa proporção de 5 a 10 vezes. A rede é `best effort` e em situações de **congestionamento** a qualidade de serviço deteriora-se

A Internet funciona com base nos ganhos de multiplexagem. Leva à aplicação de `fare usage policies`, na qual a percentagem de tempo que um utilizador pode estar a utilizar a largura de banda máxima, i.e., em `peak-rate`, é cerca de 25%

### Latency
> Mot the bitrate you have, but how long it takes you to have it

- Representa o tempo que um pacote demora a atravessar a rede através dos vários nós até atingir o nó de destino
- O tempo de acesso ao _uplink_ depende da camada física
	- fibra melhor que ADSL

### Residential Networks
- Componentes Típicos
	- ADSL/cable model
	- router/firewall/NAT
	- Ethernet
	- Wireless Access Point


#### Acesso Residencial: point to point
- Router em casa:
	- access point: WiFi
	- switch de 4 portas
	- ONT: Optical Network Termination
- Usava-se um modem de telefone para se fazer uma ligação direta à camada física:
	- a rede de transporte de informação era a rede telefónica
	- Não era possível utilizar a Internet e telefone ao mesmo tempo
	- $\approx$ 2Mb/s
	- 0 kHz - 4 kHz
	- Obsoleto
- ADSL: Asymmetric Digital subscriber
	- `upstream`: 4Mb/s
	- `downstream`: 30Mb/s
	- FDM: 50 kHz - 1 MHz para `downstream`
		- 4 kHz - 50 kHz para `upstream`
- Cable TV
- HFC: Hybrid Fiber Coaxial
	- TV cabo
	- também é possível transmitir dados pela rede
- Wireless access networks

#### Acesso Residencial: cable modems
- HFC: Hybrid Fiber Coax
	- Asymmetric:
		- 100 Mb/s `downstream`
		- 30 Mb/s `upstream`
- Uma rede de cabos e fibras conecta as casas ao router ISP (Internet Service Provider)


### Acesso Institucional: local area networks
- local area network (LAN)
- efetua a ligação entre estações e routers
- Ethernet:
	- Conexão dedicada ou partilhada entre as estações e o router
	- 10 Mb/s, 100 Mb/s ou Gigabit Ethernet


## Wireless Access Networks
- Acesso partilhado entre as estações e o router, usando um `access point`
- `Wireless LAN`: 802.11b (WI_FI):
	- $\approx 600 MB/s max, 50-100 Mb/s typ$
- `Wide Area Wireless Acces`
	 - Provided by a telecommunications operator
	 - 3G $\implies \approx$ 10 MB/s
	 - UMTS (LTE) $\approx$ 52 Mb/s

