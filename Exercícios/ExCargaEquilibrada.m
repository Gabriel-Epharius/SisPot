%Dados Exercício
cosfi = 0.82;
Zp = 0.2 +j*1.6;
S = 3E6*exp(j*acos(0.82));
V_delta = 13800; 


%%RESOLUÇÃo

%%Achando a impedância das cargas

S_1fase = S/3;
Z_delta = (V_delta)**2/conj(S_1fase);

%Convertendo Fonte_Delta para Fonte_Estrela

V_delta = 13800; %%PREENCHER

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

%Correntes de linha na fonte

M_alfas = [
    1   1   1
    1   alfa**2    alfa
    1   alfa    alfa**2
];

I_auxiliar = inv(M_alfas)*I_fase;

fator = sqrt(3)*exp(-j*pi*30/180);

M_auxiliar = [
    fator   conj(fator)
    fator*alfa**2 ,conj(fator)*alfa
    fator*alfa , conj(fator)*alfa**2
]/3;

I_fonte_linha = M_auxiliar*I_auxiliar(2:3);