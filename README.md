# Neander
Theoric Computer - Final project of Digital Systems

ULA (UNIDADE DE LÓGICA E ARITMÉTICA)

Componentes:

● Registrador com carga de 8 bits (AC);

● Registrador com carga de 2 bits (FLAGS);

● Multiplexador 2x8 bits;

● ULA(ALU) - Multiplexador 5x8 bits.

Registrador AC: Armazena a memória vinda da ULA, que futuramente será
transformada em x, uma entrada da ULA, e enviado para o multiplexador especial.

Registrador FLAGS: Reset = “01”, em resumo, servem para registrar o sinal da
informação vinda da ULA.

ULA (ALU): Realiza todas as operações possíveis, sendo elas selecionadas a partir
do dado vindo de Ula_op que é o seletor de seu multiplexador.

Multiplexador 2x8:

MEMÓRIA

Componentes:

● Multiplexador 2x8;

● REM (Registrador com carga de 8 bits);

● Memória 256x8;

● RDM (Registrador com carga de 8 bits).

UNIDADE DE CONTROLE

Componentes

● Program Counter PC (RIP)

● Contador de 0 a 7;

● Registrador (RI)

● Decodificador 8x11:

● Control Unit (UC):
○ Aciona os sinais de controle no tempo correto, sendo elas:

➢ NOP;

➢ STA;

➢ LDA;

➢ ADD;

➢ AND;

➢ OR;

➢ NOT;

➢ JMP;

➢ JN;

➢ JZ;

➢ HLT.
