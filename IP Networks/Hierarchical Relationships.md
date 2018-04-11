# Relações Hierárquicas/Relações de Importância

## Modelo Cliente - Servidor
- Modelo **mais utilizado na Internet** [^1]

[^1]: Há uns anos atrás era `peer-to-peer`

- Os clientes comunicam com uma **entidade hierarquicamente** superior a eles
	- O servidor **não inicia conexões**
	- As conexões são sempre iniciadas pelos clientes, pedindo informação
		- o cliente é o suplicante
	- A maior percentagem do tráfego da rede é entre o servidor e os clientes
- O servidor **controla a comunicação**
	- É mais fácil garantir quer a segurança quer a qualidade da comunicação 
	- A informação está contida no servidor

\begin{figure}[H]
\centering
\includegraphics[width=0.5\textwidth]{../pictures/client-server-model.png}
\caption{Modelo Cliente Servidor}
\end{figure}	


### WCP: Well Known Ports (TCP/UDP)
Portos mais conhecidos e tabelados internacionalmente.

- HTTP: 80
- FTP: 20 e 21
- telnet: 23


### Cookies
- a informação reside no lado do cliente
- Os cookies existam porque cada pedido é individualmente tratado
- Se o pedido for feito neste instante ou daqui a 5 minutos, a resposta por parte do servidor é a mesma $\implies$ **Servidor não possui histórico nem estados**

**Problema:** E se eu quiser mudar uma página para Português, supondo que tenho um servidor com capacidade multi língua, como mantenho todas as outras páginas que abrir depois dessa em Português?

- Uso cookies: Se selecionar português, guardo um cookie que me indica que todas as páginas daquele servidor devem ser vistas em português. 
- Quando abro outra página/link daquele servidor, envio a informação contida no cookie no pedido, e recebo a página em português
	 
> This is how we design a state awareness system in a stateless web engine


### Cache
- É informação que já foi pedida ao servidor e foi armazenada temporariamente 
- O cliente informa o servidor que já possui informação, indicando a time stamp.
- Se o servidor tiver informação mais recente, envia e o cliente descarta a informação que tem
- Se o servidor não possui informação mais recente, o cliente usa a informação que tem, resultante de um pedido anterior ao servidor

## Peer to peer communication
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
	- capazes de estabelecer as comunicações necessárias
		- efetuar pedidos 
		- responder a pedidos
		- etc.
- Modelo útil para a partilha de conteúdo
- As entidades em comunicação acedem e partilham recursos de forma global
	- Pode ser implementado se existirem recursos suficientes na rede e os atrasos forem pequenos
	- Para redes de grandes dimensões e maior complexidade, que recebem demasiada carga, não providencia a mesma _performance_
- Exemplos:
	- Jogos online
	- VOIP

### Comparação com o modelo cliente servidor: 
- Se a rede for muito grande, é mau porque uma rede peer-to-peer não tem nenhum servidor estável
- A probabilidade de existir um problema na rede aumenta
- Num serviço HTTP, a ligação entre o cliente e o servidor é muito mais estável;
- Exemplos: 
	- torrent
		- download efetuada entre múltiplos utilizadores
	- HTTP:
		- apenas uma `source` (servidor)


