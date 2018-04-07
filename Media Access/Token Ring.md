# Token Ring
O mecanismo utilizado é diferente da CSMA/CD

A rede é vista como um **anel de estações** e o **acesso ao meio** é baseado num `token`.

- Só quem tem o `token` é que pode enviar o pacote
- Se uma máquina/`node` receber o `token` e não quiser enviar nada, passa o `token` à seguinte
- Se nenhuma máquina/estação/nó quiser enviar dados, o `token` circula entre elas até que uma delas tenha algo para enviar


Quando uma estação possui um pacote pronto a transmitir, **espera** pela **receção do `token`**. De seguida:

- Remove o `token` da rede
- Envia o pacote que pretende transmitir
	- Uma vez que o `token` já não circula e uma estação só pode enviar pacotes na presença do `token`, não vão ocorrer colisões
- O pacote circula a rede
	- É lido pelo destinatário
	- O destinatário indica, usando um bit de flag, que a mensagem foi lida
	- Volta ao emissor, que o remove da rede
- Após o pacote circular, o `token` é enviado, permitindo a outras estações transmitir 
- Não existe _acknowledge_

Uma rede `token ring` possui um tempo de espera determinístico. No máximo, o tempo de espera será 
$$N \times (tempo\ máximo\ da\ mensagem + tempo\ de\ passagem\ do\ token)$$
onde N são o número de estações exisitentes

Existe uma estação responsável por **monitorizar** a rede `active monitor`. As suas principais funcionalidades são:

- Impedir pacotes de circular pela rede infinitamente
	 - Ao passar pela **estação monitora**, esta transmite o pacote a jusante de si com o bit M a 1
	 - Se um pacote passar pela estação monitora com o bit M a 1, é removido do `ring`
	 - Pode ocorrer se o emissor enviar um pacote e em seguida "desaparecer" da rede
- Detetar ausência de `token` na rede
	- A **estação monitora** mantêm um `timer`
	- Sempre que o `token` passa pela estação, o `timer` sobre um reset
	- Se o `timer` esgotar o seu intervalo de contagam, um novo `token` é introduzido no anel
- Detetar se existe algum monitor no `ring`:
	- envia periodicamente uma `frame`: `active-monitor-present`
	- Cada estação mantém um `timer` 
		- atualizado/reset cada vez que um `frame` é recebido
	- O monitor pode ser qualquer uma das estações
	- Quando o `timer` expira, occorre processo para eleger um novo monitor
		- É escolhida a estação com maior endereço

No `Token Ring`, tudo é baseado em `timers`

- Se este tipo de sinalização não aparecer, alguma estação toma  ainiciativa
- É escolhido com base no endereço da máquina


Podem existir endereços `multicast` numa rede `Token Ring`. Basta que pacotes IP `multicaste` sejam enviados por uma rede em `Token Ring`. Apenas é necessário que exist algo que efetue o mapeamento dos endereços IP `multicast` no endereço MAC na rede `token-ring`

![Exemplo de rede `Token-Ring` onde podem ser enviados endereços IP `multicast`](../pictures/token_ring_ip_multicast.png)

**Vantagens:**

- A rede opera à sua máxima capacidade
- Não existem colisões
- O tempo de um serviço (emissão, receção) é **determinístico**

	
Protocolo Ethernet IEEE 802.3

## Token-Ring vs Ethernet

### Desvantagens do _Token-Ring_
1. É preciso garantir que o `token` é mantido na rede
	- Implica nomear uma estação, que:
		- assegure que existe **apenas 1 `token`**
		- substitua o `token-ring`, se necessário
2. Se o tráfego na rede for reduzido, as estações são **obrigadas a esperar pelo `token`**
	- Numa rede Ethernet, com baixa carga, as transmissões podem ser **imediatamente**


### Vantagens do _Token-Ring_
1. Se a rede estiver com bastante ocupada, o `token` introduz na rede uma política de acesso `round-robin`
	- Garante eficiência e justiça no acesso ao meio
	- Na Ethernet, com demasiada carga na rede, a utilização e acesso ao meio pelas estações é ineficiente devido ao elevado número de colisões netre pacotes

