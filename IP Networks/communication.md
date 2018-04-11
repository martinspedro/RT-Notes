# Comunicação - Protocolos e Estrutura
A Internet é um sistema escalável e capaz de se dividida em sub-redes, que utilizam os mesmo protocolos.
A comunicação é feita entre diferentes dispositivos:

- `servers`: 
	- dispositivos que armazenam a maior percentagem de informação da rede. 
	- atuam como dispositivos de armazenamento de informação
	- podem ser vistos como "produtores", numa lógica produtor consumidor
- `hosts`: 
	- dispositivos que pedem informação aos servidores
	- podem ser vistos como "clientes" da informação armazenada nos servidores, seguindo uma lógica produtor consumidor.


A Internet, para funcionar como uma entidade, requer:

- elementos de comutação
- elementos terminais


As conexões físicas são asseguradas através de cabos e `routers`. **Routers:** são dispositivos que transportam pacotes entre conexões físicas de redes diferentes. Uma rede é um sistema usado para conectar dispositivos que usa apenas uma tecnologia única de transmissão.

```bash
# Para visualizar a IP routing table de um PC Linux
$ route
```

## Typical Service Mix
É um recurso flexível, que ao contrário da rede telefónica, permite ganhos de multiplexagem. Isto significa que posso **subdimensionar** a rede, criando uma rede que não tem condições de suportar as condições máximas de uso de todos os seus utilizadores, mas na **maior percentagem de tempo**, sim.

Exemplo: rede de 1 gigabit dividida por vários utilizadores

- Tenho 100 utilizadores
- Na maioria dos tempos, quando um utilizador precisa de um gigabit, tem um gigabit
- Mas como na maioria do tempo os utilizadores não precisam de 1 gigabit, escuso de ter uma rede de 100 gigabit
	- Sub dimensiono a rede
- Os utilizadores recebem menos que um gigabit, apesar de lhes ser dito que a rede fornece um gigabit
- Ocorre a **congestão da rede** quando todos os os utilizadores precisam de 1 Gigabit


Por isso se diz que a Internet é uma rede **best effort:**

- a rede faz o melhor que pode, com os recursos que têm. 
- Se o melhor que puder fazer não chega, a qualidade do serviço é diminuída
- A Internet nunca garante serviços de emergência, ao contrário de uma rede telefónica

Desde que este método foi implementado, algumas das características do consumo de Internet tem tido algumas consequências na typical service mix:

- A largura de banda dedicada para streaming de videos está a aumentar
- As redes sociais têm causado um aumento no upload de vídeos
- A camada física é muito melhor do que era anteriormente.

## Protocolos
Os protocolos criam uma conexão lógica sobre a conexão física que interliga dois ou mais dispositivos.

Definem os:

- _standards_
- procedimentos
- interpretação da informação a ser transmitida


Um protocolo é um procedimento formal entre duas entidades que:

- especifica que mensagens são enviadas
- define o formato e a ordem das mensagens a serem enviadas e recebidas entre as entidades da rede
- especifica que ações são executadas quando as mensagens são recebidas

Especifica ainda detalhes de implementação, como:

- Tensão
- Número de cabos a utilizar
- Como se caracteriza o nível lógico '0'?
- Como se caracteriza o nível lógico '1'?
- Como é efetuada a transmissão?
	- bit?
	- byte?


É importante referir que:

- Diferentes pedidos têm obviamente diferentes formatos e diferentes ações que devem ser tomadas
- Os protocolos funcionam nos extremos da rede e não no seu intermédio/caminhos da rede.
- Os seres humanos também utilizam um protocolo a comunicar com os outros
	- gestos
	- frases
	- postura

Em qualquer tipo de comunicação (humano-humano, humano-máquina, máquina-máquina), tem de ser acordado um protocolo de comunicação. Um protocolo nada mais é do que um **acordo entre duas entidades**


### Pacotes
- A informação é separada em pacotes
- Os pacotes são transferidos, numa filosofia _best effort_
	- se forem perdidos ou chegarem fora de ordem não interessa
- Existem protocolos que possuem a responsabilidade de:
	- detetar pacotes em falta
	- detetar e ordenar pacotes fora de ordem.


## Valley-free Routing
- A Internet está organizada em `Tiers`.
- Cada `tier` representa uma área de prestação de serviços


A estrutura da Internet (i.e., os `tiers`) estão organizados de forma **aproximadamente hierárquica.**

Normalmente, cada `tier` representa um **ISP:** _Internet Service Provider_.
Por isso se diz que a Internet é **basicamente hierárquica**

Os **ISPs** podem ser classificados em:

1. **ISPs de nível 1:** Cobertura Nacional ou Internacional, 
	- e.g, Sprint e AT&T
2. **ISPs de nível 2:** Cobertura Regional
3. **ISPs de nível 3/IPs locais:** `Access Networks`

Devido a esta forma de ligar as redes, um pacote pode **atravessar várias redes entre dois endpoints**

A esta forma de `routing` chamamos `valley-free routing`, porque se organizarmos hierarquicamente a estrutura de routing:

1. Primeiro o pacote sobe a hierarquia até atingir os ISPs de nível 1
2. Depois transita para o ISPs de nível 1 de destino
3. De seguida desce na hierarquia, até chegar novamente ao endpoint

O tráfego segue estas rotas **apenas de forma aproximada**. Isto não é verdade em 90% dos casos e poe ser verificado usando o `WireShark`, que permite, entre outras coisas,  enviar pacotes para e rede e estudar o comportamento dos pacote na mesma, bem como o funcionamento da rede


