fator = sqrt(3)*exp(j/6);
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


V_linha_fonte = 13800;
V_fonte_fase = (V_linha_fonte/fator)*vetor_alfa_positivo;
