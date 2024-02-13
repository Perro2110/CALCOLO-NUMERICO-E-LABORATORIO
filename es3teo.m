p1=[0 1 0 0;1 0 0 0;0 0 1 0;0 0 0 1]
p2=[1 0 0 0;0 0 1 0;0 1 0 0;0 0 0 1]
p3=[1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0]
p3*p2*p1


s=1/sqrt(1+(-1/3)^2)
c=(-1/3)*s
G12=[c s;-s c]
A2=[1 -1 ; -3 2]
G12*A2

clc
clear all 
clear
%% Parte Matlab richiesta
% 2) (M) (3 punti) Realizzare un M-script file che controlli la soluzione ottenuta nel punto precedente, utilizzando le
% M-function gauss2, sollower e solupper in allegato. Stampare a video soluzione e residuo normalizzato (in norma
% infinito). Calcolare poi la matrice B = ATA e verificare se essa è definita positiva, eseguendo la fattorizzazione di
% Cholesky mediante la M-function chol di Matlab. Stampare a video il risultato. Nel caso B sia definita positiva,
% risolvere il sistema Bx = c, con c = (7/3, 1, 2, −5/6)T
% 
% , usando il fattore di Choleski e le M-function in allegato.


A=[1 -1 2 0;-3 2 0 4; 0 -5 1 -2;0 0 2 1];
b=[0;-2;1;0];
[L, R, P, deter] = gauss2(A);
[y] = sollower(L, b(P));
[xsol] = solupper(R,y);
format rat;
disp(xsol);
xteo=[-14/15;8/15;11/15;-22/15];
format shorte
max(abs(xsol-xteo)); %confronto
Residuo_normalizzato=(b-A*xsol)/(norm(b,"inf"));
disp(Residuo_normalizzato)
B=A'*A
[L,flag]=chol(B,"lower");
c=[7/3, 1, 2, -5/6]';
if(flag == 0)
    fprintf("Def pos");
    sol=rtrisol(L',ltrisol(L,c))
end


