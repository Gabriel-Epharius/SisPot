%Carga
%PREENCHER
Zab = 1;
Zbc = 1;
Zac = 1;
%%

Zsoma = Zab + Zac + Zbc;

Za = Zab*Zac/Zsoma;
Zb = Zab*Zbc/Zsoma;
Zc = Zac*Zbc/Zsoma;

Ya = 1/Za;
Yb = 1/Zb;
Yc = 1/Zc;


Z_carga = [
    Za  0   0   
    0   Zb  0
    0   0   Zc
];

Y_carga = [
    Ya  0   0
    0   Yb  0
    0   0   Yc
];

Y_abc = [
    Ya  Yb  Yc
    Ya  Yb  Yc
    Ya  Yb  Yc
]/(Ya+Yb+Yc);

Y_t = eye(3) - Y_abc;


%Matriz de rede

%%PREENCHER
Z_rede = [
    1   j   1
    1   1   1
    j   j  1
];

%Determinação correntes de fase
I_fase = inv(Y_t*Z_rede + Z_carga)*Y_t*V_Y_positivo;

%Tensão na carga
V_carga = V_Y_positivo - Z_rede*I_fase;

%Tensão do neutro da carga isolada
Vnlinha_n = Y_abc*V_carga;

%Queda de Tensão na linha
V_queda = V_Y_positivo - V_carga;
