# Methods for information forwarding in networks

## Circuit Switching
- São reservados recursos entre os _endpoints_ para a conexão durante todo o tempo em que a mesma dure
- Podem ser necessários processos auxiliares para inciar e finalizar a conexão
	- Estes processos são **externos** ao sistema de conexão, tendo de existir antes de uma chamada ser efetuada e depois de a chamada terminar
- Todo o processo de conexão é feito offline

Antigamente todos os métodos de routing eram por _circuit switching_: correspondiam a alguém conectar fisicamente dois cabos, que efetuada uma ligação entre o destinatário da chamada e quem a iniciou. Mais tarde passou a ser um processo eletromecânico.

Cada pessoa tinha um cabo reservado para si e após a conexão ser estabelecida, a linha que será usada para a chamada é uma diferente da que foi usada para a iniciar


Impõe delays e _jitter_[^2], que para além de conhecidos e fixos, são normalmente baixos.

A implementação física da rede tem de conseguir garantir que podem ser reservados uma quantidade de recursos conhecida, sem comprometer as outras chamadas que possam estar a decorrer.

A estratégia mais comum para implementar este mecanismo é implementar TDM (Time Division Multiplexing)

Isto implica que:

- Mesmo quando não existem comunicações (silêncio), os recursos estão permanentemente ocupados
- Quando ocorre uma congestão da rede e não são possíveis reservar mais circuitos, os recursos existentes mantêm as suas propriedades 
	- $\implies$ **call rejection**
	- _Call Admission Control_ (CAC)
	- Uma comunicação é bloqueada se a rede não possui capacidade de resposta
	- Mantêm a largura de banda

Hoje em dia as tecnologias que estabelecemos implementam `circuit switchig` de forma digital. Na prática não interessa se esse sistema está implementado em _hardware_ ou em _software_, mas apenas que é um sistema multiplexado


[^2]: _jitter:_ variação do delay


## Packet switching
- Não existe nenhuma conexão estabelecida antes de a informação ser enviada
- A informação é dividida em `packets`(pacotes) 
	- cada pacote é uma pequena fração da informação que se pretende enviar
	- cada pacote é enviado **individualmente** e **independentemente** do anterior
	- não existe qualquer relação **para a rede** entre os pacotes enviados (obviamente, que para o recetor e emissor possuem)
	- Não existem quaisquer garantias que sigam todos o mesmo percurso entre o emissor e o recetor
- Não existe a necessidade de estabelecer um circuito de ligação, quer físico quer lógico
- Cada nó usa uma política de `immediate forwarding`

Uma rede que utilize `packet switching`:

- é boa para comunicações em `burst`
	- Os recursos são partilhados entre todos, i.e., multiplexados
	- Não é requerido qualquer **overhead** inicial e final para estabelecer/terminar a ligação
- **congestão causa perdas e atrasos no envio da informação**
	- São precisos protocolos e mecanismos extra para efetuar uma transmissão com segurança
- Não providencia um serviço de `circuit switching`
	- para comunicações _multimedia_ é necessário que sejam garantidos valores mínimos e máximos de:
		- Largura de banda
		- Atrasos
		- _jitter_
	- O problema é parcialmente resolvido por um sistema de `packet switching`
- A resposta, no geral, é mais rápida que a um rede que opere em `circuit swithcing`
- É possível congestionar a rede ao ponto de não puder ser utilizável $\implies$ `over-congestioning`
- A diferença entre `circuit/cell switching` e `packet switching` é que é os pacotes têm um tamanho fixo no `packet switching`
- Se existir demasiado tráfico na rede, pode ocorrer a perda de pacotes

Uma visão fundamentalista indica que uma rede de `packet swithcing` não se comporta como uma rede de circuitos.
Uma visão prática diz que sim, visto que em 99% dos caso uma rede de pacotes comporta-se com uma rede de circuitos

Em termos práticos é melhor para o tipo de tráfego que fazemos hoje em dia. Para ser 100% seria necessário muito dinheiro.

## Message switching
- Cada mensagem segue um caminho independente
- Cada mensagem pode ser armazenada em cada nó pelo tempo necessário
	- p.e, email
	
Um pacote (`package`) é visto como:

- um "pedaço" de informação que **não contém relevância _per se_**
- A **perda de um pacote** pode afetar **outros pacotes**

Já uma mensagem é:

- possui **informação _per se_**
- Se perder outras mensagens, posso continuar a perceber esta
- Cada mensagem, **ao contrário de um pacote** é **totalmente contida em si mesmo**
- Cada pedaço da informação enviada, i.e., cada mensagem, **tem significado**


# Transport relationship
As relações entre as redes de transporte de informação podem ser:

- Connectionless 
- Connection oriented

## Connectionless
A informação que foi enviada **não possui relação nenhuma entre si**: 

> Tudo é independente de tudo o resto

- A relação entre o emissor, o recetor e a rede não é orientada para a conexão
- A informação é enviada para a rede
- Não é estabelecida nenhuma sessão ou conexão entre o emissor e o recetor


## Connection- oriented
- É necessário estabelecer uma conexão entre o emissor e o recetor antes de enviar a informação para a rede
	- Normalmente esta conexão implica o alocamento de recursos
	- A conexão pode ser física ou virtual
		- Se for virtual, é conhecida como `virtual circuits`
	- 
- `Circuit Switching` é por natureza `connection-oriented`
	- a comutação dos circuitos é uma conexão
	- é preciso criar o circuito de ligação $\implies$ alocar recursos
- 	Redes com entradas e saídas bem definidas
- 	Nem sempre implica que seja necessário **reservar recursos** para a conexão
- 	Mantém a ordem (na maior parte das vezes)
	- 	O envio de informação para a rede é feita por ordem
	- 	A saída é feita pela mesma ordem do envio
	- 	FIFO
- Exemplos:
	- vpn
	- 	rede `peer-to-peer `
		- torrents
		- ligação entre duas entidades me geral)
	- modelo cliente servidor
		- request http: ir a um website web


# Relações Hierárquicas/Relações de Importância
## Modelo Cliente - Servidor
- Modelo **mais utilizado na Internet** [^1]

[^1]: Há uns anos atrás era `peer-to-peer`

- Os clientes comunicam com uma **entidade hierarquicamente** acima deles
	- O servidor não inicia conexões 
	- As conexões são sempre iniciadas pelos clientes, pedindo informação
	- o cliente é o suplicante
	- A maior percentagem do tráfego da rede é entre o servidor e os clientes
- O servidor controla a comunicação
	- É mais fácil garantir quer a segurança quer a qualidade da comunicação 
	- A informação está contida no servidor

![Modelo Cliente Servidor](pictures/client-server-model.png)
	
**WCP: Weel Known Ports** (TCP/UDP)

- HTTP: 80
- FTP: 20 e 21
- telnet: 23


### Cookies
	- a informação reside no lado do cliente
	- Os cookies existam porque cada pedido é individualmente tratado
	- Se o pedido for feito neste instante ou daqui a 5 minutos, a resposta por parte do servidor é a mesma $\implies$ **Servidor não possui histórico nem estados**
	- Problema: E se eu quiser mudar uma página para Português, supondo que tenho um servidor com capacidade multi língua, como mantenho todas as outras páginas que abrir depois dessa em Português?
	- Uso cookies: Se selecionar português, guardo um cookie que me indica que todas as páginas daquele servidor devem ser vistas em português. 
	- Quando abro outra página/link daquele servidor, envio a informação contida no cookie no pedido, e recebo a página em português
	> This is how we design a state awareness system in a stateless web engine


### Cache
	-	É informação que já foi pedida ao servidor e foi armazenada temporariamente 
	-	O cliente informa o servidor que já possui informação, indicando a time stamp.
	-	Se o servidor tiver informação mais recente, envia e o cliente descarta a informação que tem
	-	Se o servidor não possui informação mais recente, o cliente usa a informação que tem, resultante de um pedido anterior ao servidor
 
# Peer to peer communication
- Todas as entidades são iguais:
	- a comunicação é efetuada entre entidades semelhantes.
	- Estas entidades podem:
		- estabelecer conexões entre entidades
		- fazer pedidos a outras entidades
		- responder a pedidos de outras entidades
	- todas podem funcionar como clientes ou como servidores
	- Todas as máquinas são igualmente confiáveis
- Os `peers` são:
	- identificáveis
	- contactáveis
	- capazes de estabelecer as comunicações necessárias, como efetuar pedidos e responder a pedidos
- Modelo útil para a partilha de conteúdo
- As entidades em comunicação acedem e partilham recursos de forma global
	- Pode ser implementado se existirem recursos suficientes na rede e os atrasos forem pequenos
	- Para redes de grandes dimensões e maior complexidade, que recebem demasiada carga, não providencia a mesma _performance_
- Exemplos:
	- Jogos online
	- VOIP

Comparação com o modelo cliente servidor: 

- Se a rede for muito grande, é mau porque uma rede peer-to-peer não tem nenhum servidor estável
- A probabilidade de existir um problema na rede aumenta
- Num serviço http, a ligação entre o cliente e o servidor é muito mais estável;
- Exemplos: 
	- torrent
		- download efetuada entre múltiplos utilizadores
	- http:
		- apenas uma `source` (servidor)

# Logical Deployment
- Topologia da rede
- A implementação física da rede não tem de possuir nenhuma relação com a implementação lógica da mesma
- A implementação física são apenas cabos

![Modelo lógico de uma rede Cliente Servidor](pictures/client-server-network.png)

![Modelo lógico de uma rede Peer-to-peer](pictures/peer-to-peer-network.png)

A relação lógica pode ser:

- `unicast`
	- de um para um
	- uni/bidirecional
	- Ex: conversa telefónica
- `multicast`
	- Tipicamente, de um para muitos
	- uma entidade envia para várias entidades que recebem
	- unidirecional
	- caso particular: `bicast` (1 para 2)
	- Exemplo: transmissão de vários eventos numa rede Internet multicast (Mbone)
- `broadcast`
	- um para todos
	- a camada física das redes é sempre broadcast (ou quase sempre)
	- o que quer dizer que não possa haver broadcast acima disso
	- unidirectional
	- televisão na internet
	- Broadcast na **camada física**
		- "Olá" -> todos ouvem
		- "Olá João" -> todos ouvem, mas a mensagem é para o João


Outros tipos de classificações da relação lógica entre entidades pode ser:

- **Com/Sem requisitos temporais fixos**
	 - Comunicações em tempo real, como:
		 - videoconferências (atrasos e _jitter_)
		 - _Video on Demand_ _(jitter)_
	- Requerem que seja definido o atraso temporal de uma comunicação
		- Fácil numa rede ponto a ponto
		- muito difícil numa rede onde a implementação física e a lógica não são diretamente relacionadas

- **Symmetrical/Asymmetrical**

A maior parte das comunicações hoje em dia são assimétricas

- Em conexões bidirecionais, os recursos disponíveis em diferentes direções podem ser diferentes
- As conexões têm se vindo a tornar mais simétricas desde que a quantidade de conexões `peer to peer` aumentou
- Tipicamente, existe mais informação a circular de um lado para o outro do que ao contrário
	- O tráfego de download é superior ao de upload
	- Daí que as velocidades de downlink e uplink sejam diferentes
- Conexões assimétricas: `client-server model`
- Conexões simétricas: `peer-to-peer model`
	- Exemplos: chamadas 
- Os valores de simetria de entre a `client-server` e `peer-to-peer` situa-se entre 1:5 e 1:10



# Network Structure
- **Network borders**
	- Estações
	- Exemplo: a _network_ que temos em casa
- **Network nucleus**
	- malhas de routers interligados
		- normalmente, por fibra ótica
	- cria uma _network_ de _networks_
	- MPLS (Multi protocol label switching - circuitos virtuais sobre a uma camada física de links óticos)
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

- A `client station` efetua um pedido a um serviço e recebe do servidor.
	- o servidor está sempre à escuta
	- Exemplo de serviços: browser/web server e client/server email


Num modelo **peer-to-peer**

- Pequena utilização 
- Nenhum ou poucos servidores dedicados.


## Access Networks
- Como são efetuadas as conexões entre os núcleos
	- Redes de acesso residenciais;
	- Redes de acesso institucional (escolas, empresas);
	- Redes de Acesso móvel.

- Questões que se colocam:
	- Qual é a bitrate da rede de acesso?
	- A rede de acesso é partilhada ou dedicada?
	- Existe alguma `contention rate`?
	- Qual é a latência?

# Contention rate
A taxa de contenção da rede é a 

$$contention\ rate = \frac{quantidade\ total\ de\ BW\ que\ estou\ a\ vender}{Nº\ de\ clientes\ a\ que\ estou\ a\ vender}$$

Pode facilmente variar entre 1 e 5. A largura de banda que é vendida a cada utilizador não é a largura de banda real que esse utilizador tem direito em todas as condições. O que acontece é uma partilha de recursos entre os vários clientes, uma vez que a probabilidade de os utilizadores todos precisarem da largura de banda máxima ao mesmo tempo é muito baixa, o dimensionamento do sistema para este caso é demasiado caro e conduz ao desperdício de recursos

A Internet funciona com base nos ganhos de multiplexagem. Leva à aplicação de `fare usage policies`, na qual a percentagem de tempo que um utilizador pode estar a utilizar a largura de banda máxima, i.e., em `peak-rate`, é cerca de 25%

# Latency
> Mot the bitrate you have, but how long it takes you to have it

- Representa o tempo que um pacote demora a atravessar a rede através dos vários nós até atingir o nó de destino
- O tempo de acesso ao uplink depende da camada física
	- fibra melhor que ADSL

### Acesso Residencial: point to point
- Router em casa:
	- access point: WiFi
	- + switch de 4 portas
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
- HFC: Hybrid Fiber COax
	- tv cabo
	- também é possível transmitir dados pela rede
- Wireless access networks

### Acesso Residencial: cable modems
- HFC: Hybrid Fiber Coax
	- Asymmetric:
		- 100 Mb/s `downstream`
		- 30 Mb/s `upstream`
- Uma rede de cabos e fibras conecta as casas ao router ISP


### Acesso Institucional: local area networks
- local area network (LAN)
- efetua a ligação entre estações e routers
- Ethernet:
	- Conexão dedicada ou partilhada entre as estações e o router
	- 10 Mb/s, 100 Mb/s ou Gigabit Ethernet


# Wireless Access Networks
- Acesso partilhado entre as estações e o router, usando um `access point`
- `Wireless LAN`: 802.11b (WI_FI):
	- $\approx 600 MB/s max, 50-100 Mb/s typ$
- `Wide Area Wireless Acces`
	 - Provided by a telecommunications operator
	 - 3G $\implies \approx$ 10 MB/s
	 - UMTS (LTE) $\approx$ 52 Mb/s

# Residential Networks
- Componentes Típicos
	- ADSL/cable model
	- router/firewall/NAT
	- Ethernet
	- Wireless Access Point


