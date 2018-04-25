# NATP
- `NEtwork Address Port Translation`
- para além da tradução de endereços (efetuada pelo `NAT`), efetua a tradução de portas UDP e TCP entre portas privadas e públicas
- A associação entre endereços públicos ou privados por ser:
	- estática
	- dinâmica
- É responsável por processar as mensagens de protocolos da camada de aplicação que usam endereços IP e portas TCP/UDP
	- p.e., o protocolo ftp
- Só utiliza um endereço IP público
	- a multiplexagem é efetuada no uso das diferentes portas
	- O router é capaz de efetuar a distribuição dos pedidos por diferentes portas de destino para diferentes máquinas
- O número da porta só é traduzido se for necessário e as estações não estão cientes do processo
- A tradução de endereços IP tem de ser efetuada no interior de vários `application protocols` que referem as portas das ligações

## Exemplo sem necessidade de tradução de portas
![Exemplo de rede a correr o protocolo NATP. A estação D foi configurada como um servidor FTP ativo e os endereços públicos que estão a ser usados são `216.100.100.2` para as associações `NAPT` e `216.100.100.1` para a interface do router](../pictures/napt_example.png)



\begin{figure}
\subfloat[Estação A acede o servidor FTP (estação D). \textit{Snipping} da rede Interna]{\includegraphics[width= 0.48\textwidth]{../pictures/napt_private_ftp_1.png}}
\subfloat[Estação A acede o servidor FTP (estação D). \textit{Snipping} da rede Externa]{\includegraphics[width= 0.48\textwidth]{../pictures/napt_public_ftp_1.png}} \\
\subfloat[Estação B acede o servidor FTP (estação D). \textit{Snipping} da rede Interna]{\includegraphics[width= 0.48\textwidth]{../pictures/napt_private_ftp_2.png}}
\subfloat[Estação B acede o servidor FTP (estação D). \textit{Snipping} da rede Externa]{\includegraphics[width= 0.48\textwidth]{../pictures/napt_public_ftp_2.png}}\\
\caption{Exemplo da tradução de endereços no acesso de várias estações de uma rede interna para um servidor ftp externo, usando o protocolo NAPT. Nestas imagens não é mostrada a tradução de portas da rede interna para a rede externa, uma vez que as portas na rede interna são diferentes para as diferentes estações.}
\label{}
\end{figure}

```
Router#show ip nat translation verbose
Pro Inside global        Inside local     Outside local       Outside global
tcp 216.100.100.2:1032   10.0.0.12:1032   216.100.100.11:21   216.100.100.11:21
	create 00:00:35, use 00:00:24, left 23:59:35,
	flags:
extended, use_count: 0

tcp 216.100.100.2:1033   10.0.0.11:1033   216.100.100.11:21   216.100.100.11:21
	create 00:00:12, use 00:00:06, left 23:59:53,
	flags:
extended, use_count: 0
```

No exemplo apresentado não existe a necessidade de traduzir as portas do `sender`, porque elas já são diferentes na rede interna:

- A estação A está a usar a porta 1032
- A estação B está a usar a porta 1033


Só a porta de destino é que é a mesma, e pertence às _Well-known ports (wkp)_

Se estão duas máquinas a aceder ao mesmo serviço e o servidor de envio é o mesmo. Uma vez que o IP de envio (IP público) é o mesmo, os portos de ligação de cada uma delas têm de ser diferentes.

## Exemplo com necessidade de tradução de portas

\begin{figure}
\subfloat[Estação B acede pela segunda vez o servidor FTP (estação D). \textit{Snipping} da rede Interna]{\includegraphics[width=0.48\textwidth]{../pictures/napt_private_ftp_3.png}}
\subfloat[Estação B acede pela segunda vez o servidor FTP (estação D). \textit{Snipping} da rede Externa]{\includegraphics[width=0.48\textwidth]{../pictures/napt_public_ftp_3.png}}\\
\caption{Exemplo da tradução de endereços no 2º acesso da estação B ao servidor ftp externo, usando o protocolo NAPT. Nestas imagens é mostrada a tradução de portas da rede interna para a rede externa, uma vez que as porta usada pela estação B na transação passada ainda está ativa, o router é  obrigado a efetuar a tradução de portas entre a rede rede interna e a rede externa, uma vez que a porta 1033 já foi usada em conexões passadas.}
\label{}
\end{figure}

A estação B não sabe que a sua porta foi traduzida. 

```
Router#show ip nat translation verbose
Pro Inside global        Inside local     Outside local       Outside global
tcp 216.100.100.2:1024   10.0.0.12:1033   216.100.100.11:21   216.100.100.11:21
create 00:00:49, use 00:00:42, left 23:59:17,
	flags:
	extended, use_count: 0

tcp 216.100.100.2:1032   10.0.0.12:1032   216.100.100.11:21   216.100.100.11:21
create 00:02:42, use 00:02:31, left 23:57:28,
	flags:
	extended, use_count: 0

tcp 216.100.100.2:1033   10.0.0.11:1033   216.100.100.11:21   216.100.100.11:21
create 00:02:18, use 00:02:13, left 23:57:46,
	flags:
	extended, use_count: 0
```

- O uso da opção verbose permite mostrar o `creation time`
