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

%Correntes de linha na fonte
%NECESSITA Vetor com correntes de fase(I_fase)!!!

M_alfas = [
    1   1   1
    1   alfa**2    alfa
    1   alfa    alfa**2
];

I_auxiliar = inv(M_alfas)*I_fase;

fator = sqrt(3)*exp(-j*pi*30/180);

M_auxiliar = [
    [fator   conj(fator)]
    [fator*alfa**2 ,conj(fator)*alfa]
    [fator*alfa , conj(fator)*alfa**2]
];

I_fonte_fase = M_auxiliar*I_auxiliar(2:3);