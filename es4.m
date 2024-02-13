clc
clear all
close all
format rat

A=[2 0 -1/2 -1/2;0 2 -1 -1;-1/2 -1 2 0;-1/2 -1 0 2];
b=[1 -1 -1 1]';
D=diag(diag(A));
L=-(tril(A)-D);
U=-(triu(A)-D);

J=D\(L+U);
G=(D-L)\U;
lam=sym("lam");
J-lam*eye(4);
det(J-lam*eye(4));
rhoJ=max(abs(eig(J)));

G-lam*eye(4);
det(G-lam*eye(4));
rhoG=max(abs(eig(G)));

SOR1=D-1.5*L;
SOR2=((1-1.5)*D+1.5*U);

%% spettro, raggio spettrale e, se possibile, velocità asintotica di convergenza di entrambi i metodi di Jacobi e di
%% Gauss-Seidel. Visualizzare a monitor i risultati con istruzioni di stampa formattate.

disp("Spettro di J:")
disp(eig(J))
fprintf("raggio spettrale di J: %g , velocità asintotica di convergenza: %g \n",rhoJ,(-log(rhoJ)))

cj=D\b;

disp("Spettro di G:")
disp(eig(G))
fprintf("raggio spettrale di G: %g , velocità asintotica di convergenza: %g \n\n",rhoG,(-log(rhoG)))

cg=(D-L)\b; 
x0J = [0 0 0 0]';
x0G = [0 0 0 0]';
x0SOR=[0 0 0 0]';
for k=0 : 6
    x0J=J*x0J+cj;
    x0G=G*x0G+cg;
end
    disp("sol jacoby:");
    disp(x0J);
    disp("sol Gauss-seidel");
    disp(x0G);

[x0SOR , k ] = sor (A,b, x0SOR,6,eps,1.5 );
    disp("sol SOR:");
    disp(x0SOR);

% Lo script calcoli poi un’approssimazione della soluzione x
% ∗ del sistema mediante la funzione sor in allegato,
% con tolleranza di arresto tol = 10−5
% , numero massimo di iterazioni maxit = 100 e lo stesso punto iniziale x(0).
[xSTAR , k ] = sor (A,b,[0;0;0;0],100,1e-5,1.5)
%  Infine, lo script calcoli, visualizzi e disegni in un grafico in scala logaritmica sulle ordinate i tre vettori
% differenza relativa:

rj=abs(x0J-xSTAR)./abs(xSTAR)
rg=abs(x0G-xSTAR)./abs(xSTAR)
rsor=abs(x0SOR-xSTAR)./abs(xSTAR)

xx=linspace(-100,100,length(rj))
semilogy ([ rj , rg , rsor ])
xlabel("Asse delle x (vari residui)")
ylabel("Asse delle y")
title("grafico in scala logaritmica sulle ordinate i tre vettori differenza relativa")
legend("r_j","r_(gs)","r_(sor)")

