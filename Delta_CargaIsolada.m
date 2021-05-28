%Carga Delta
%PREENCHER
Zab = Zbc = Zac = Z_delta;
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
    Zp  0   0
    0   Zp  0
    0   0   Zp
];

%Determinação correntes de fase
I_fase = inv(Y_t*Z_rede + Z_carga)*Y_t*V_Y_positivo;

%Tensão na carga
V_carga_fase = V_Y_positivo - Z_rede*I_fase;

%Tensão do neutro da carga isolada
Vnlinha_n = Y_abc*V_carga_fase;

%Queda de Tensão na linha
V_queda = Z_rede*I_fase;

%Tensão linha na carga
V_carga_linha = [
    V_carga_fase(1) - V_carga_fase(2)
    V_carga_fase(2) - V_carga_fase(3)
    V_carga_fase(3) - V_carga_fase(1)
];

%Correntes de linha na carga
I_carga_linha = Y_carga*V_carga_linha;

