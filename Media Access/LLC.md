# LLC: Logical Link Control

No IEEE 802, a camada de ligação lógica (nível 2) está dividida em 2 camadas

1. MAC - Medium Access Control
2. LLC

## MAC
- Responsável pela formação das tramas
	- Endereço de origem 
	- Endereço de destino
	- Detecção de erros
- Detecção e Receção das tramas
- Controlo de acesso ao meio
	- protocolo CSMA/CD


## LLC
- multiplexagem de fluxos de diferentes serviços da camada protocolar superior
- Contém os campos:
	- `DSAP`: _Destination Service Access Point_
		- Identifica o serviço na estação de destino a que se destina a trama
	- `SSAP`: _Source Service Access Point_ 
		- identifica o serviço na estação origem que enviou a trama
	- `CTL`: Byte de controlo
		- entre outras coisas, pode ser usado para numerar as tramas


