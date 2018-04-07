# Conexões entre hubs

## Cascata
- Permite a extensão da rede 
	- apenas até 4 hubs

![Diagrama de ligação de hubs em cascata](../pictures/hub_cascade_connection.png)

## Estrela
- Cada Hub conecta-se a um `hub` central
- Permite a criação de redes em estrela de redes em estrela


![Diagrama de ligação de hubs em estrela](../pictures/hub_star_connection.png)

## Conexões entre hubs - porta de `uplink`
A conexão entre `hubs` é efetuada usando uma porta especial: a porta de `uplink`. A porta de `uplink` serve apenas para ligar diretamente hubs, usando um **cabo direto**

A porta de uplink está configurada para receber nos pinos 1 e 2 e transmitir nos pinos 3 e 6.
Útil uma vez que os vários pinos do `hub` podem funcionar a diferentes frequências

![Exemplo de conexões entre hubs usando a porta de `uplink`. A conexão apenas pode ser efetuada usando um cabo direto](../pictures/hub_uplink_port.png)



