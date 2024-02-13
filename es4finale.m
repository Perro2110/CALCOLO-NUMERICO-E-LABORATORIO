clc
clear all
close all
A=[8/3 -1 1/2 ;2/5 7/3 1/2 ;3/5 -1/3 4];
format short
D=diag(diag(A));
Dinv=diag(1./diag(A));
L=-(tril(A,-1));
U=-(triu(A,+1));
J=Dinv*(L+U);
G=(D-L)\U;

w=sym("w");
sor1=D-w*L;
sor2=((1-w)*D+w*U);

spetroJ=eig(J);
spetroG=eig(G);

raggiospetraleJ=max(abs(eig(J)));
raggiospetraleG=max(abs(eig(G)));

velocitaJ=-log(raggiospetraleJ);
velocitaG=-log(raggiospetraleG);

fprintf("Lo spettro di J: \n")
disp(spetroJ)
fprintf("Il raggio spettrale di J :" + ...
    " %g con velocita asintotica di %g \n\n",raggiospetraleJ,velocitaJ)

fprintf("Lo spettro di G: \n")
disp(spetroG)
fprintf("Il raggio spettrale di G :" + ...
    " %g con velocita asintotica di %g \n",raggiospetraleG,velocitaG)

%% per opzionale teorico
lam=sym("lam");
detttJ=J-lam*eye(3);
det(J-lam*eye(3));

detttG=G-lam*eye(3);
det(G-lam*eye(3));
%% __________________

%% seconda parte matlab
b=[1 -5 -2]'
maxit=50;
tol=1e-5;
x0=[1 -2 1]';
[xJ,kJ]=jacobi(A,b,x0,maxit,tol);
fprintf("Compite %g iterazioni trovando il seguente risultato \n",kJ);
disp(xJ)

w=1.27;
sor1=D-w*L;
sor2=((1-w)*D+w*U);
Gw=sor1\sor2
x0=[1 -2 1]';
y=(D-w*L) \ (w*b);
%%potrei usare un for per due iterazioni ma essendo solo due tantovale
%%farle sequenzialmente con ctrl-c ctr-v
x0=Gw*x0+y;
x0=Gw*x0+y;
disp("seconda iterazione =")
disp(x0)






