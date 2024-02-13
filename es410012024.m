%% Marco Perrotta 
%% Matricola 184789
clc
clear all 
clear
format rational 
%
% M) (3 punti) Realizzare un M-script file che controlli i risultati ottenuti al punto precedente, determinando
% spettro, raggio spettrale e, se possibile, velocità asintotica di convergenza di entrambi i metodi di Jacobi
% e di Gauss-seidel.
% 
% Visualizzare a monitor i risultati con istruzioni di stampa formattate. Successivamente,
% considerato il sistema lineare Ax = b con b = (1, −5, −2)T , lo script determini un’approssimazione x(J) della
% soluzione x∗ utilizzando la M-function jacobi (in allegato), con una tolleranza di arresto tol = 10−5, un
% numero massimo di iterazioni pari a maxit = 50 e vettore iniziale x(0) = (1, −2, 1)T . Lo script visualizzi a
% monitor il numero di iterazioni compiute e l’approssimazione calcolata. Infine, lo script costruisca la matrice
% di iterazione del metodo SOR utilizzando ω = 1.27 come parametro di rilassamento e visualizzi a console la
% seconda iterazione, partendo da x(0) = (1, −2, 1)T
%
A=[8/3 -1 1/2;2/5 7/3 1/2;3/5 -1/3 4]
D=diag(diag(A))
Dinv=diag(1./diag(A))
L=-(tril(A)-D)
U=-(triu(A)-D)

J=Dinv*(L+U)
G=(D-L)\U

w=sym("w")
Sor1=(D-w*L)
Sor2=((1-w)*D+w*U)
lam=sym("lam")
det(J-[lam 0 0;0 lam 0;0 0 lam]) %avrei potuto usare eye ma per mia legibiità preferisco esplicitare la matrice lam * I
det(G-[lam 0 0;0 lam 0;0 0 lam]) %avrei potuto usare eye ma per mia legibiità preferisco esplicitare la matrice lam * I

%% Parte matlab richiesta oltre a controlli
format short
spettro=eig(J);
RaggioSpettrale=max(abs(eig(J)));
VelJ=-log(RaggioSpettrale);
disp("Spettro:")
disp(spettro)
fprintf("raggio spettrale di J %g, velocità asintotica di convergenza di J %g \n",RaggioSpettrale,VelJ);

spettro=eig(G);
RaggioSpettrale=max(abs(eig(G)));
VelG=-log(RaggioSpettrale);
disp("Spettro:")
disp(spettro)
fprintf("raggio spettrale di G %g, velocità asintotica di convergenza di G %g \n",RaggioSpettrale,VelG);

 b = [1 -5 -2]'
 tol=1e-5
 maxit=50
 x=[1 -2 1]'
 [x,k]=jacobi(A,b,x,maxit,tol);
 fprintf("numero di iterazioni: %g, approsimazione calcolata: \n",k);
 disp(x)
 wdata=1.27;
 Gw1=(D-wdata*L);
 Gw2=((1-wdata)*D+wdata*U);
 Gw=Gw1\Gw2
 xGw=[1 -2 1]';
 yGw=(D-wdata*L) \ (wdata*b);
 xGw=Gw*xGw + yGw; % prima iterazione;
 xGw=Gw*xGw + yGw; % seconda iterazione;
 disp("Approssimagione con sor:")
 disp(xGw);
