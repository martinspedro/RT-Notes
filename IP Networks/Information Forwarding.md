# Methods for information forwarding in networks

## Circuit Switching
Caracteriza-se por:

- Reservar recursos entre os _endpoints_ para a conexão 
	- Os recursos são alocados e permanecem ativo enquanto a conexão durar
- Podem ser necessários processos auxiliares para inciar e finalizar a conexão
	- Estes processos são **externos** ao sistema de conexão,
		- Existem antes de uma chamada ser efetuada e depois de a chamada terminar
- Todo o processo de conexão é feito **offline**

Antigamente, todos os métodos de `routing` eram implementados com recurso a _circuit switching_: 

- correspondiam a alguém conectar **fisicamente** dois cabos,
- Efetuava uma ligação entre o destinatário da chamada e quem a iniciou
- Mais tarde passou a ser um processo eletromecânico.

Cada pessoa tinha um cabo reservado para si e após a conexão ser estabelecida, a linha que será usada para a chamada é uma diferente da que foi usada para a iniciar


Impõe delays e _jitter_[^2], que para além de conhecidos e fixos, são normalmente baixos.

A implementação física da rede tem de conseguir garantir que podem ser reservados uma quantidade de recursos conhecida, sem comprometer as outras chamadas que possam estar a decorrer.

A estratégia mais comum para implementar este mecanismo é implementar TDM (Time Division Multiplexing)

Isto implica que:

- Mesmo quando não existem comunicações (silêncio), os recursos estão permanentemente ocupados
- Quando ocorre uma **congestão da rede** e não são possíveis reservar mais circuitos, os recursos existentes mantêm as suas propriedades 
	- $\implies$ **call rejection**
	- _Call Admission Control_ (CAC)
	- Uma comunicação é bloqueada se a rede não possui capacidade de resposta
	- Mantêm a largura de banda
	- As comunicações que já foram aceites persistem até serem terminadas

Hoje em dia as tecnologias que estabelecemos implementam `circuit switchig` de forma digital. Na prática não interessa se esse sistema está implementado em _hardware_ ou em _software_, mas apenas que é um sistema multiplexado


[^2]: _jitter:_ variação do delay


## Packet switching
- Não existe nenhuma conexão estabelecida antes de a informação ser enviada
- A informação é dividida em `packets` (pacotes) 
	- cada pacote é uma pequena fração da informação que se pretende enviar
	- cada pacote é enviado **individualmente** e **independentemente** do anterior
	- não existe qualquer relação **para a rede** entre os pacotes enviados 
		- obviamente, que para o recetor e emissor possuem
	- Não existem quaisquer garantias que os pacotes:
		- sigam todos o mesmo percurso entre o emissor e o recetor
		- cheguem por ordem
		- Cheguem ao destino
- Não existe a necessidade de estabelecer um circuito de ligação, quer físico quer lógico
- Cada nó usa uma política de `immediate forwarding`

Uma rede que utilize `packet switching`:

- é boa para comunicações em `burst`
	- Os recursos são partilhados entre todos, i.e., multiplexados
	- Não é requerido qualquer **overhead** inicial e final para estabelecer/terminar a ligação
- **congestão causa perdas e atrasos no envio da informação**
	- Se existir demasiado tráfico na rede, pode ocorrer a perda de pacotes
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

Uma visão fundamentalista indica que uma rede de `packet swithcing` não se comporta como uma rede de circuitos (`circuit switching`)
Uma visão prática diz que sim, visto que em 99% dos casos uma rede de pacotes comporta-se com uma rede de circuitos
Para ser 100% seria necessário muito dinheiro, o que inviabiliza o projeto do ponto de vista economicamente.

Em termos práticos, `packet switching` é melhor para o tipo de tráfego que fazemos hoje em dia. 

## Message switching
- Cada mensagem segue um caminho independente
- Cada mensagem pode ser armazenada em cada nó pelo tempo necessário
	- e.g., email
	
Um pacote (`package`) é visto como:

- um "pedaço" de informação que **não contém relevância _per se_**
- A **perda de um pacote** pode afetar **outros pacotes**

Já uma mensagem é:

- possui **informação _per se_**
- Se perder outras mensagens, posso continuar a perceber as outras $\implies$ **independência entre mensagens**
- Cada mensagem, **ao contrário de um pacote** é **totalmente contida em si mesma**
- Cada pedaço da informação enviada, i.e., cada mensagem, **tem significado sozinha**



