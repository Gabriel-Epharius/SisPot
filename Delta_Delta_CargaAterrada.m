
clear all;
%%Características Delta.

V_delta = 1; %%PREENCHER

%Fonte

alfa = complex(cos(120*pi/180), sin(120*pi/180));

vetor_alfa_positivo = [
    1
    alfa**2
    alfa
];

vetor_alfa_negativo = [
    1
    alfa
    alfa**2
];

fator_conv_delta_para_estrela = [
    complex(cos(pi/3), sin(pi/3))
    complex(cos(-pi/3), sin(-pi/3))
    -1
]/sqrt(3);


V_Y_positivo = V_delta*fator_conv_delta_para_estrela;


%Carga
%%PREENCHER
Zab = 1;
Zbc = 1;
Zac = 1;

Zsoma = Zab + Zac + Zbc;

Za = Zab*Zac/Zsoma;
Zb = Zab*Zbc/Zsoma;
Zc = Zac*Zbc/Zsoma;

%Matriz de carga

Zn = 1; 

Z = [
    Za  0   0   
    0   Zb  0
    0   0   Zc
];

Z_carga = Z + Zn;

%Matriz de rede

%%PREENCHER
Z_rede = [
    1   1   1
    1   1   1
    1   1   1
];

%Circuito com neutro aterrado
I = inv(Z_rede + Z_carga)*V_Y_positivo





