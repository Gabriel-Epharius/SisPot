%operador alfa
alfa = exp(1j*deg2rad(120));
%sequencia direta
seqdir = [1;alfa^2;alfa];

%parâmetros
Zp = 3+i*5.6;
Zm = i*2.5;
Vlinha = 13800;

%transformar delta pra estrela
Zab = 90+i*45;
Zbc = i*50;
Zca = i*50;

Z_soma = Zab+Zbc+Zca;

Za = Zab*Zca/Z_soma;
Zb = Zab*Zbc/Z_soma;
Zc = Zbc*Zca/Z_soma;

%matriz Y

Ya = 1/Za;
Yb = 1/Zb;
Yc = 1/Zc;
Y_soma = Ya+Yb+Yc;

matriz_Y = eye(3) -  [Ya/Y_soma, Yb/Y_soma, Yc/Y_soma;
                     Ya/Y_soma, Yb/Y_soma, Yc/Y_soma;
                     Ya/Y_soma, Yb/Y_soma, Yc/Y_soma];
                     
%Matriz Zrede e Zcarga
Zrede = [Zp, Zm, Zm;
        Zm, Zp, Zm;
        Zm, Zm, Zp];
        
Zcarga = [Za, 0, 0;
          0, Zb, 0;
          0, 0, Zc];
          
%Tensão fase
V = Vlinha/sqrt(3)*seqdir;

%Correntes na linha

I_linha = inv(matriz_Y*Zrede + Zcarga)*matriz_Y*V;

a = abs(I_linha(1));
b = arg(I_linha(1))*180/pi;
c = abs(I_linha(2));
d = arg(I_linha(2))*180/pi;
e = abs(I_linha(3));
f = arg(I_linha(3))*180/pi;

%Tensões de fase
Va_linha_b_linha = Za*I_linha(1) - Zb*I_linha(2);
Vb_linha_c_linha = Zb*I_linha(2) - Zc*I_linha(3);
Vc_linha_a_linha = Zc*I_linha(3) - Za*I_linha(1);

g = abs(Va_linha_b_linha);
h = arg(Va_linha_b_linha)*180/pi;
j = abs(Vb_linha_c_linha);
k = arg(Vb_linha_c_linha)*180/pi;
l = abs(Vc_linha_a_linha);
m = arg(Vc_linha_a_linha)*180/pi;

%Correntes de fase
Iab =Va_linha_b_linha/Zab;
Ibc =Vb_linha_c_linha/Zbc;
Ica =Vc_linha_a_linha/Zca;

n = abs(Iab);
o = arg(Iab)*180/pi;
p = abs(Ibc);
q = arg(Ibc)*180/pi;
r = abs(Ica);
s= arg(Ica)*180/pi;