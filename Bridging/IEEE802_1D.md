## Protocolo IEEE 802.1D
- Para construir e manter a spanning tree as brdiges trocam mensagens entre si
- Estas mensagens são desingadas de BPDUs - Bridge Protocol Data Units
- Existem dois tipos:
	1. Configuration 
	2. Topology Change Notification


O Header do pacote é apresentado na figura \ref{ieee_802_1d_header}

![\label{ieee_802_1d_header} Campos do pacote IEEE802.1D](../pictures/ieee802_1D_header.png)

- `Destination`: endereço multicast atribuído a todas as bridges
- `Source`: endereço MAC da porta que enviou o BPDU
- `DSPAP` = `SSAP` = $0100010$ = $0x42$


![Exemplo de uma mensagem BPDU num analisador de redes](../pictures/bpdu_wireshark.png)

Os campos mais importantes são:

- `Root ID`: estimativa atual do endereço da bridge raiz
- `Root Path Cost`: estimativa atual do custo para a bridge raiz
- `Bridge ID`: endereço da bridge que envia a mensagem de configuração
- `Port ID`: endereço da porta que envia a mensagem de configuração

