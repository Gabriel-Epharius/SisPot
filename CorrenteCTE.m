clear all; % profilaxia

% Dados
Z1    = 800 + 1i*600;
P2    = 70000;
fp2   = 0.9;
I3    = 6 - 1i*3;
zcirc = 4 + 1i*3;
Vf    = 10000;
erro  = 1E-4;

% Início
fi3   = 0 - angle(I3);
modI3 = abs(I3);
Vc1   = Vf;
Vc2   = Vf;

% Contador para evitar loop infinito
aux   = 1;


while (abs((Vc2-Vc1)/Vc2)>erro && aux<10000)
    Vc2 = Vc1;
    % Cálculo das correntes
    % Carga 1
    I1 = Vc2/Z1;
    % Carga 2
    S2 = P2 + 1i*P2*tan(acos(fp2));
    I2 = conj(S2/Vc2);
    % Carga 3
    ang3 = angle(Vc2) - fi3
    I3 = modI3*exp(1i*ang3);
    % Correção de Vc
    Vc1 = Vf - zcirc*(I1+I2+I3);
    aux++;
end

