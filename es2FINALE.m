clc
clear all
close all
%% per calcolo finale parte T)
format short
R=[-3 1/5 -1/10 1/2;0 13/30 1/30 -1/6;0 0 153/260 3/52;0 0 0 71/51]
y=[0 -2 -59/65 76/153]'
rtrisol(R,y)

%% parte M)
clc
clear all 
close all

A=[2 0 0 1 ; -1 1/2 0 0 ; 3/10 0 3/5 0;-3 1/5 -1/10 1/2]
b=[0 -2 -1 0]'
xSolT=[-38/213 -928/213 -112/71 76/213]'
[L, R, P, deter] = gauss2(A);
y=ltrisol(L,b(P))
xSolP_Gaus2=rtrisol(R,y)

%controllo soluzioni gaus2 rispetto carta parte teo
format shorte
max(abs(xSolP_Gaus2-xSolT))

format short
[L,U,P] = lu(A);
y=ltrisol(L,P*b);
xSolP_Lu=rtrisol(R,y);

%controllo soluzioni Lu rispetto carta parte teo
format shorte
max(abs(xSolP_Lu-xSolT))

format short
xSolP_Bslash=A\b;

%controllo soluzioni \ rispetto carta parte teo
format shorte
max(abs(xSolP_Bslash-xSolT))

format short
fprintf("La soluzione con l'utilizzo di gaus 2 è: \n");
disp(xSolP_Gaus2)
fprintf("Il residuo normalizzato rispetto alle sol di gauss2 è:\n");
res=(b-A*xSolP_Gaus2)/norm(b,inf);
disp(res)

% Calcolare poi la matrice B = AAT
% e verificare se essa è definita positiva, eseguendo la fattorizzazione di Cholesky mediante la M-function chol
% di Matlab. Stampare a video il risultato. Nel caso B sia definita positiva, risolvere il sistema Bx = c, con
% c = (8/3, −1/5, 3/10, −9/5)T , usando il fattore di Cholesky e le M-function in allegato.

B=A*A'
[L,flag] = chol(B,"lower")
if flag==0
    disp("definita positivamente")
    c=[8/3 -1/5 3/10 -9/5]';
    sol=rtrisol(L',ltrisol(L,c))
else
    disp("non definita positivamente")
end








