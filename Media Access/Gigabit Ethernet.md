# Fast Ethernet e Gigabit Ethernet
> Como tornar a Ethernet 10x mais rápida? $10 Mb/s \rightarrow 100 Mb/s$

Continuamos a ter o problema do `round-trip delay`

Soluções:

1. Aumentar 10x o tamanho mínimo do pacote
2. Diminuir 10x o tamanho mínimo da rede
3. Combinação dos pontos (1) e (2)
4. Permitir que ocorram colisões sem serem detetadas

Fast Ethernet (100 Mb/s) $\rightarrow$ reduzir o tamanho da rede
Gigabit Ethernet (10 Gb/s) $\rightarrow$ reduzir o tamanho da rede e aumentar o tamanho mínimo do pacote para 512 bytes. 

- Limitou-se o comprimento máximo do cabo a 10 m 
- Os octetos nos campos protocolo deixaram de ser apenas octetos (mais bits)
- Os pacotes mais pequenos sofrem extensão da `carrier`
- Quando vários pacotes pequenos precisam de ser transmitidos, podem ser transmitidos `back-to-back`
	- O primeiro pacote tem de ser extendido para ocupar 512 bytes

## Implementações de Fast Ethernet
- **100Base-Tx:** 2 cabos UTP - categoria 5
- **100Base-Fx:** 2 cabos de fibra ótica
- **100base-T4:** 4 cabos UTP - categoria 3

## Implementações de Gigabit Ethernet
- **1000Base-SX:** 2 cabos fibra ótica - _short wavelength_
- **1000Base-LX:** 2 cabos fibra ótica - _long wavelength_
- **1000Base-CX:** 2 cabos STP
- **1000Base-T:** 4 cabos UTP

O cabo é cerca de 2/3 mais lento que a fibra ótica
