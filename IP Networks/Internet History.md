# Breve História da Internet
- Começou por ser uma experiência no meio académico no final da década de 60
- Inicialmente ARPANET, depois NSFnet e agora, _"ANYBODYSNET"_
	- Não é proprietária
- Não é detida por uma única entidade
	- Existem vários serviços a providenciar:
		- acesso
		- alojamento
	- Diferentes entidades a criar e partilhar conteúdo
- O organismo máximo que regula a Internet é a _Internet Society_

## Motivação
A origem da Internet remota ao período da Guerra Fria nos Estados Unidos, 
quando o mecanismo primário de comunicação era a rede telefónica.
O principal problema desta rede é que os `switchs` são ligados de forma estruturada.
Isto implica que se um dos `switches` for destruído ou sabotado [^1], o sistema de
comunicação do país ficava **inoperacional**


A solução encontrada foi utilizar um **sistema distribuído.**

- Remove-se o **`single point of failure`**
- A rede torna-se mais robusta e fiável
	- Passam a existir múltiplos links de ligação entre os dispositivos
	- o `routing` passa a ser distribuído.


Se um nó da rede for removido abruptamente, a rede possui a capacidade de 
continuar a transmitir informação:

- Atualmente, com `switching` ótico, a rede precisa de apenas 200 $\mu $ para recuperar
e restabelecer a comunicação
- Antigamente, se um router fosse eliminado, eram precisos entre 5 a 10 min para restabelecer
a comunicação

A UUNET já não existe

[^1]: O clima era de uma possível guerra

Problem: Resiliency of our infrastructure

### 1990: Internet Crisis
- A tecnologia foi toda paga pelo Governo Americano
- Questões que se colocam:
	- Quem é o dono da Internet?
	- Quem é o responsável pela sua gestão?
- Solução: 
	- Criação de um órgão de gestão: `The Internet Socienty`
- Todo o material público na Internet pertencem à `Internet Society`


## The Internet Society
A Internet funciona com base em:

- **consensos:** protocolos
- **código funcional:** implementação dos protocolos

Os protocolos só são validados se **diferentes equipas** conseguirem implementar o protocolo e testar a sua funcionalidade independentemente e uns com os outros. Não basta uma equipa desenvolver um protocolo, implementá-lo e testá-lo. É preciso os resultados puderem ser verificados por outros grupos de investigadores.

Funciona com base em `RFC` - Request For Comments. Sempre que se quer acrescentar algo novo ou ratificar protocolos existentes, são efetuados `RFC`

### Organização e Estrutura
- É dividida em 9 diferentes áreas/_development topics_.
- Dentro de cada área existem diferentes _working groups_
	- **IESG:**
		- Usa os resultados dos outros grupos
	- **IAB**
	- **IANA** _(Internet Assigned Number Authority)_
		- Responsável pela gestão dos:
			- DNS
			- domínios TLD (Top Level Domains)


As conexões entre a Internet Tree não é hierárquica


## Evolução da Internet
- Pode ser divida em 3 grandes fases
- **Startup:** Académica & Investigação (DARPA)
- **Scaling:** Redes Empresariais
	- Rede aberta, disponível para todos
	- Foi criada a NSF (National Science Foundation) para gerir a rede
- **Universal:** A rede passou a ser pública, acessível por todos


