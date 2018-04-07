# Protocol Demultiplexing
Usando o campo `protocol` de uma `frame` Ethernet, obtemos o diagrama de blocos representado abaixo, na figura \ref{fig:protocol_demux}

O `desmultiplexing` é efetuado pelo `MAU` - _Media Access Unit_:

- Os pacotes são recebidos de um serviço e precisam de ser enviados para outro serviço
- Cada serviço possui um `grid number`
	- A camada 2 sabe a que entidade da camada 3 entregar o pacote
	- O protocolo, ao ser desmultiplexado, "revela" o endereço da entidade da camada 3
-
![Diagrama de blocos para a operação de `protocol demultiplexing`. Na figura, MAU significa _Media Access Unit_ \label{fig:protocol_demux}](../pictures/protocol_demultiplexing.png)

## Classes de IP address
As classes IP servem para identificar os tipos de rede em relação ao seu tamanho

Inicialmente, no protocolo IEEE, 3 bytes são para o fabricante, 3 bytes para as placas de rede. Atualmente, são usados os 6 bytes para as redes.

![As diferentes classes de IP. A classe E não é usada atualmente](../pictures/ip_address_classes.png)


| Class    | nº bits in prefix | nº max networks | nº bits in suffix | nº max hosts per network |
|:--------:|:---------:|:--------:|:--------:|:-----------:|
| A        |    7      |    128   |   24     |   16777216  |
| B        |    14     |  16384   |   16     |      65536  |
| C        |    21     | 2097152  |    8     |        256  |

: Características dos 3 principais tipos de endereçamento usados. Note que nem todos os potenciais endereços são usados

| Class    | nº bytes network | nº bytes hosts |
|:--------:|:----------------:|:--------------:|
| A        |    1             |    3           |
| B        |    2             |    2           |
| C        |    3             |    1           |
| D        |    4             |    0           |

: Organização dos bytes no endereço da classes de IP

### Classificação dos endereços nas classes

| Class    | Endereço mínimo possível | Endereço máximo possível |
|:--------:|:------------------------:|:------------------------:|
| A        |      1.0.0.0             |          126.0.0.0       |
| B        |    128.0.0.0             |        191.255.0.0       |
| C        |    192.0.0.0             |      223.255.255.0       |
| D        |    224.0.0.0             |    239.255.255.255       |
| E        |    240.0.0.0             |    255.255.255.254       |

### Problemas
As classes começaram a ser atribuídas nos primórdios da Internet. Isto significa que, por exemplo, a Boeing possua endereços classe A, e a China não sequer um endereço classe B.

### Endereços IP especiais
- Um endereço todo a zeros identifica a rede atual
- Endereço todo a '1' é um broadcaste local

![(1) - Apenas permitido na inicialização. Não representa um endereço válido e destino . (2) - Não é um endereço de origem válido. (3) Nunca deve aparecer na rede (No caso demonstrado, o LOOP BACK nunca deve sair para fora da placa de rede). O (4) indica um endereço usado para dar o nome à rede.](../pictures/special_ip_address.png)

A razão porque não posso usar endereços '0' na rede é porque existe um programador que `hard-coded` o endereço '0' como sendo o endereço que identifica a máquina/host, para facilitar a escrita de um `mac-filter`. Desde aí, como algumas máquinas possuem este código, é preferível não arriscar a correr o risco de não conseguir comunicar com todas as máquinas

## IP multicast
A classe D é uma classe usada para endereços `multicast`

 `1110`.<group ID>


- Os pacotes são transmitidos a um grupo de máquinas, 
- Cada máquina pode estar em mais do que um grupo em simultâneo
- É um tipo de endereçamento específico, que se comporta de forma diferente

**IGMP:** Internet Group Management Protocol

- Pode ser usado para efetuar a troca de informação entre os vários elementos/nós da rede	

- Preferencialmente, devo ser usado `multicast` se o hardware tiver suporte para o mesmo. Caso contrário, é preferível usar `broadcast`


## Máscaras de Rede
- As máscaras de rede são utilizadas para fazer `classless addresing`
- Inicialmente, os endereços IP serviam para **fixar e definir fronteiras** entre redes, usando os primeiros bits do campo de endereço, tal como no passado tinha sido feito para as classes A, B e C
- Mais tarde, as fronteiras entre redes passaram a ser variáveis
- Passou a ser usada uma máscara de rede para definir o que pertence ou não à rede, sendo usada para separar os endereços que pertencem à rede e os endereços que pertencem ao _host_
- É importante para definir aspetos como `broadcaste` e `multicast`


\begin{table}[]
\centering
\caption{My caption}
\label{my-label}
\begin{tabular}{llllll}
            & \multicolumn{2}{l}{decimal}       &  & \multicolumn{2}{l}{binário}  \\ \cline{2-3} \cline{5-6} 
				& rede                      & host  &  & rede                          & hots \\
endereço IP & \multicolumn{1}{l|}{10.}  & 0.0.1 &  & \multicolumn{1}{l|}{00001010} & 00000000 00000000 00000001 \\
máscara     & \multicolumn{1}{l|}{255.} & 0.0.0 &  & \multicolumn{1}{l|}{11111111} & 00000000 00000000 00000000 \\

\end{tabular}
\end{table}

## Subnetting
O subnetting permite, entre outras coisas, organizar as redes em grupos, para _a posteriori_, ser mais fácil agrupá-las e controlá-las em conjunto

![Exemplo de Subnetting](../pictures/subnetting.png)


