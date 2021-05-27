
clear all;

%%Características Delta.

V_delta = ;

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
Zab = ;
Zbc = ;
Zac = ;

Zsoma = Zab + Zac + Zbc;

Za = Zab*Zac/Zsoma;
Zb = Zab*Zbc/Zsoma;
Zc = Zac*Zbc/Zsoma;

%Matrizes de carga

Zn = ;

Z = [
    Za  0   0   
    0   Zb  0
    0   0   Zc
]

Z_carga = Z + Zn;





