## [ULA UFPEL]: Unidade Lógica e Aritmética (ULA)📌 
**Sobre o Projeto:**
Este projeto consiste na implementação de uma ULA (ALU - Arithmetic Logic Unit) de 6 bits. Ela é capaz de realizar operações aritméticas básicas e operações lógicas bit a bit, servindo como o bloco construtor principal para o caminho de dados de um processador simples.


⚙️ Funcionalidades
A ULA processa dois operandos de entrada (A e B) e um sinal de controle (Seletor), gerando um resultado e flags de status.

Operações Suportadas:
Seletor (Binário),Operação,Descrição
| Seletor | Operação                  | Descrição Técnica        | Status |
| :---:   | :---                      | :---                     | :---: |
| `0000`  | **SOMA**                  | A + B                    | ✅ OK |
| `0001`  | **SUB**                   | A - B                    | ✅ OK |
| `0010`  | **OR**                    | OU LÓGICO ENTRE A E B    | ✅ OK |
| `0011`  | **AND**                   | E LÓGICO ENTRE A E B     | ✅ OK |
| `0100`  | **NOT A**                 | NEGAÇÃO LÓGICA DE A      | ✅ OK |
| `0101`  | **NOT B**                 | NEGAÇÃO LOGICA DE B      | ✅ OK |
| `0110`  | **SHIFTER RIGHT A**       | DIVIDE A POR 2           | ✅ OK |
| `0111`  | **SHIFTER LEFT A**        | MULTIPLICA A POR 2       | ✅ OK |
| `1000`  | **A**                     | EXIBE O PRÓPRIO A        | ✅ OK |
| `1001`  | **B**                     | EXIBE O PRÓPRIO B        | ✅ OK |
| `1010`  | **SHIFTER RIGHT B**       | DIVIDE B POR 2           | ✅ OK |
| `1011`  | **SHIFTER RIGHT B**       | MULTIPLICA B POR 2       | ✅ OK |
| `1100`  | **INCREMENTADOR**         | A + 1                    | ✅ OK |
| `1101`  | **DECREMENTADOR**         | A - 1                    | ✅ OK |
| `OTHERS`| **000000**                | NÃO FAZ NENHUMA OPERAÇÃO | ✅ OK |
## 🚩 Flags de Status
A ULA monitora o resultado de cada operação e atualiza as seguintes flags:

| Flag | Nome | Descrição |
| :---: | :---       | :---                                                                                           |
| **Z** | Zero       | Ativa (1) se todos os bits do resultado forem 0.                                               |
| **N** | Negativo   | Ativa (1) se o bit mais significativo (MSB) for 1 (indica valor negativo em Complemento de 2). |
| **I** | Igualdade  | Ativa (1) se os números forem iguais (bit a bit).                                              |
| **V** | Overflow   | Ativa (1) se ocorrer um erro de sinal em operações aritméticas.                                |

🛠️ Tecnologias Utilizadas
Linguagem: VHDL (IEEE 1164)

Alvo de Síntese: Kit FPGA Altera DE-2



Conceitos: Portas lógicas, Somadores, Multiplexadores.

      Desenvolvido por Carlos Henrique Leite Bianchin e Pedro Henrique Balen • Engenharia de Computação (UFPel)
