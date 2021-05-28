%Carga
%%PREENCHER
Zab = 1;
Zbc = 1;
Zac = 1;
%%

Zsoma = Zab + Zac + Zbc;

Za = Zab*Zac/Zsoma;
Zb = Zab*Zbc/Zsoma;
Zc = Zac*Zbc/Zsoma;

%Matriz de carga

%%PREENCHER
Zn = 1; 
%%

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
%%

%Circuito com neutro aterrado
I = inv(Z_rede + Z_carga)*V_Y_positivo





