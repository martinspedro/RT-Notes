# Endereços
Um endereço é formado por 6 octetos [^1], como se pode ver no diagrama da figura \ref{fig:IEEE_address_example}.

![Exemplo de um endereço segundo o protocolo IEEE \label{fig:IEEE_address_example}](../pictures/ieee_address.png)

No 1º octeto, existem dois bits com significados especiais

- **Último:** bit G/I (Grupo/Individual)
- **Penúltimo:** bit G/L (Global/Local)

O último bit do 1º octeto serve para identificar os tipos de endereços:

- `Unicast`: G/I = 0
- `Multicast`: G/I = 1
- `Broadcast`: todos os bits a 1


**OUI:** Organization Unique Identifier

[^1]: octeto: conjunto de 8 bits. 1 byte.

# Packet Format

## Comum aos protocolos
- **Preamble:** 
	- sequência alternada de '0's e '1's, para sincronização de clock
		- `01010101010101010101010...`
	- Utiliza-se **código de Manchester diferencial**
		- Produz exatamente a mesma sequência que os dados binários quando estes são uma sequência alternada de '0's e '1's
	- A **sincronização do clock** é crucial para decidir o **instante de amostragem**
	- Otimizar a escolha do instante de amostragem $\implies$ maximizar a abertura do diagrama de olho no instante de amostragem
	- O `preamble` possui 57 bits
		- No entanto, é preciso a indicação da terminação da trama, uma vez que estes bits apenas servem sincronismo, e "não podem ser contados antes de existir sincronismo"
- **SFD - Start of Frame Delimiter:** 
	- 1 octeto
	- Funcionalidade: permitir a detecção do início da `frame`
	- Pode existir _padding_
		- Para garantir a formatação correta do `frame` e alinhamento da informação
		- **Pad:** bytes de _padding_ 
- **Hardware Destination address**
	- 6 octetos (ver figura \label{IEEE_address_example})
- **Source Address:**
	- 6 octetos (ver figura \label{IEEE_address_example})
- **FCS - Frame Check Sequence:**
	- Permite detetar de erros na transmissão


## Ethernet II
- Existem dois tipos de _standards_ de Ethernet
- A proposta  original foi submetida pelo IEEE

![Estrutura de um pacote de Ethernet](../pictures/ethernet_II.png)

- **Protocol:**
	- 3º campo no header 
	- superior a 1500 bytes 
	- representa o protocolo à qual os dados pertencem.
- **EFD - End of frame Delimiter:** 
	- Detetar o fim do `frame`
	- Possui um padrão específico
	- Utilizado porque não existe informação relativa ao tamanho do pacote na Ethernet II
- **Data:**
	- Dados a serem enviados
	- 46 a 1500 bytes de mensagem

## IEEE 802.3
![Estrutura de um pacote de IEEE 802.3](../pictures/ieee_802_3.png)

- **length:**
	- tamanho do pacote de dados (`MAC`)
- Os três próximos bits (`DSAP`, `SSAP` e `CTL`) referem-se à `LLC - Logical Link Control` _Protocol Layer_, e são usadas para representar o protocolo.
- **Data:**
	- Dados a serem enviados
	- 43 a 1497 bytes de mensagem



Uma das principais diferenças entre o protocolo Ethernet II e o protocolo IEEE 802.3 é que no IEEE 802.3 é feita explicitamente a identificação do protocolo. Entre o protocolo IEEE e Ethernet II existe uma identificação explicita na trama enviada. Além disso, o campo length (3º campo, possui dimensão inferior a 1500 bytes)

Contém ainda explicitamente:

- Designação do serviço de _access point_
- Quais são as "aplicações" da camada `Applications` que precisam do pacote
- _Control Data_
- _Frame Check Sequence_, com CRC (Cyclic Redundancy Check)

