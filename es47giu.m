clc
clear all
clear
close all
format short
A=[9 -3 -1;-2 9 0;-2 0 9];
D=diag(diag(A));
Dinv=diag(1./diag(A));
L=-(tril(A)-D);
U=-(triu(A)-D);
J=Dinv*(L+U);
lam=sym("lam");
MLamJ=[J-[lam 0 0; 0 lam 0; 0 0 lam]];
det(MLamJ);

rhoJ=max(abs(eig(J)));
VelocitaJ=-log(rhoJ);


fprintf("Jacoby: \n ")
spettro=eig(J)
fprintf("raggio spettrale: %g , velocità asintotica di convergenza: %g \n",rhoJ,VelocitaJ);

G=(D-L)\U;
lam=sym("lam");
MLamG=[G-[lam 0 0; 0 lam 0; 0 0 lam]];
det(MLamG);

rhoG=max(abs(eig(G)));
VelocitaG=-log(rhoG);
fprintf("\nGauss-seidel: \n ");
spettro=eig(G)
fprintf("raggio spettrale: %g , velocità asintotica di convergenza: %g \n",rhoG,VelocitaG);

% 
% Successivamente, considerato il sistema lineare Ax = b con b = (5, −2, 3)T
% , lo script determini un’approssimazione x(J) della soluzione x
% ∗ utilizzando la funzione jacobi (in allegato), con una tolleranza di arresto
% tol = 1.0e-5, un numero massimo di iterazioni pari a maxit = 100 e vettore iniziale x(0) = 0 ∈ R
% script visualizzi a monitor il numero di iterazioni compiute e l’approssimazione calcolata.
% Infine, lo script determini un’approssimazione x (GS) della soluzione x
% ∗ del sistema anche con il metodo di  Gauss-Seidel, usando il medesimo punto iniziale e i medesimi parametri di arresto e visualizzi a monitor anche
% in questo caso il numero di iterazioni compiute e l’approssimazione calcolata.
% Eseguire lo script e commentare brevemente quanto ottenuto con i due metodi, alla luce di quanto calcolato
% per ciascuno di essi.

b=[5 -2 3]';
tol=1.0e-5;
maxit=100;
x=zeros(3,1);
[XstarJ,Iterazioni_compiute_Jacoby]=jacobi(A,b,x,maxit,tol)

stop=0;
iterGs=0;
yg=(D-L)\b;
xG=zeros(3,1);

for iterGs=0:maxit
    xtemp=xG
    xG=G*xG+yg
    if norm(xtemp-xG,inf)<tol*norm(xG,inf)
    break;
    end
end
Iterazioni_compiteGauss_Seidel=iterGs
XstarG=xG


