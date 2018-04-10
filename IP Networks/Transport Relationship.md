# Transport relationship
As relações entre as redes de transporte de informação podem ser:

- `Connectionless `
- `Connection oriented`

## Connectionless
A informação que foi enviada **não possui relação nenhuma entre si**: 

- "Tudo" é independente de tudo o resto
- A relação entre o emissor, o receptor e a rede não é orientada para a conexão
- A informação é enviada para a rede
- Não é estabelecida nenhuma sessão ou conexão entre o emissor e o receptor


## Connection- oriented
- É necessário estabelecer uma conexão entre o emissor e o receptor antes de enviar a informação para a rede
	- Normalmente esta conexão implica o alocamento de recursos
	- A conexão pode ser física ou virtual
		- Se for virtual, é conhecida como `virtual circuits`
- `Circuit Switching` é por natureza `connection-oriented`
	- a comutação dos circuitos é uma conexão
	- é preciso criar o circuito de ligação $\implies$ alocar recursos
- 	Redes com **entradas e saídas bem definidas**
- 	Nem sempre implica que seja necessário **reservar recursos** para a conexão
- 	Mantém a ordem da informação (na maior parte das vezes)
	- 	O envio de informação para a rede é feita por ordem
	- 	A saída é feita pela mesma ordem do envio
	- 	Política FIFO
- Exemplos:
	- vpn
	- 	rede `peer-to-peer `
		- torrents
		- ligação entre duas entidades, no geral
	- modelo cliente-servidor
		- _request http_: aceder a um website



