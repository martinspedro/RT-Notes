### TTL of entries of the forwarding tables
- Tradeoff:
	- **Tempo de vida demasiado longo:** pode haver um número exagerado de pacotes perdidos quando a estação muda de localização
	- **Tempo de vida demasiado curto:** o tráfego na rede pode ser exagerado devido ao processo de `flooding`


Existem dois tempos de vida usado:

- `Longo`: 
	- usado por defeito
	- valor recomendado: 5 minutos
- `Curto`:
	- usado quando a spanning tree está em reconfiguração
	- valor recomendado: 15 segundos
	- exige processo de notificação de alterações da topologia da rede


![](../pictures/spanning_tree_network_topology.png)

- (1) Porta passa ao estado blocking
- (2) A bridge 2 envia um TCN-BPDU, com a periodicidade de _hello time_
- (3) A bridge 2 envia um Conf-BPDU com TCA = 1 até deixar de receber o TCN-BPDU da bridge 2
- (4) A bridge 1 envia um TCN-BPDU, com periodicidade _hello time_. 
- (5) A bridge raiz envia um Conf-BPDU com TC=1 (Toplogy Configuration), duarante um tempo `forward delay` + `max age`
	- inicia o processo de reconfiguração. 
	- a bridge 1 e 3 passam a usar o tempo de vida curto nas suas table as de encaminhamento durante esse período
- (6) A bridge 1 repete o Conf-BPDU com TC=1
	- a bridge 2 passa a usar o tempo de vida curto nas suas tabelas até voltar a ouvir TC = 0


#### Exemplo de uma spanning tree ineficiente
![Exemplo de uma spanning tree ineficiente](../pictures/spanning_tree_inneficient)

