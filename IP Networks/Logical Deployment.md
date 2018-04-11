# Logical Deployment
- Topologia da rede:
	- A implementação física da rede não tem de possuir nenhuma relação com a implementação lógica da mesma
	- A implementação física são apenas cabos

\begin{figure}
\centering
\includegraphics[width=0.5\textwidth]{../pictures/client-server-network.png}
\caption{Modelo lógico de uma rede Cliente Servidor}
\end{figure}	

\begin{figure}
\centering
\includegraphics[width=\linewidth]{../pictures/peer-to-peer-network.png}
\caption{Modelo lógico de uma rede Peer-to-peer}
\end{figure}	

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
	- não quer dizer que não possa haver broadcast acima disso
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
	- Daí que as velocidades de _downlink_ e _uplink_ sejam diferentes
- Conexões assimétricas: `client-server model`
- Conexões simétricas: `peer-to-peer model`
	- Exemplos: chamadas 
- Os valores de simetria de entre a `client-server` e `peer-to-peer` situam-se entre 1:5 e 1:10

