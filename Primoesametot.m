clc
clear
clear all

% ES 1 (M)
%

x0=input("inserire valore x0:");

p7 = zeros (8 ,1) ;
p7 (1) = abs( tan( 4.2* pi - 2.8 ) ) ; % c7
p7 (2) = log2 ( acos ( 1.64 - exp (0.7) ) ) ; % c6
p7 (4) = 0.25* max ( exp (pi) , pi ^( exp (1) ) ) ; % c4
p7 (6) = min( min(sin(5.7) , 71.6* exp( -4)), 2.3/pi^2 ) ; % c2
p7 (7) = 9.0534; % c1
p7 (8) = -sqrt( -log( 3.0/10^(5) ) ); % c0

[ r , q ] = ruffiniHorner ( p7 , x0 ) ;
[ derp , q1 ] = ruffiniHorner ( q , x0 ) ;
[ ders , q2 ] = ruffiniHorner ( q1 , x0 ) ;


fprintf (" nValore del polinomio in x0 = %g: p(x0) = %g\n", x0 , r ) ;
fprintf (" nDerivata prima del polinomio in x0: p’'(%g) = %g\n", x0 , derp ) ;
fprintf (" nDerivata seconda del polinomio in x0: p’’'(%g) = %g\n\n", x0 , 2* ders ) ;


ph = fplot ( @ ( x) ( polyval ( p7 , x ) ) , [ -2.5 ,1.1] ) ;

clc
clear
clear all

x=sym("x");
pi=sym("pi");

(x*log(pi))/(x*log(pi)-sqrt((2+x)/5)) + ( x/(2*(x+2)) * (-sqrt((2+x)/5))/(x*log(pi) - sqrt((2+x)/5)) )

x*log(pi)-sqrt((2+x)/5)


clc
clear 
clear all


% 2) (M) (3 punti) Realizzare un M-script file che controlli la soluzione ottenuta nel punto precedente, sia utilizzando
% le M-function gauss2, rtrisol e ltrisol in allegato, sia usando l’opportuna funzione predefinita di Matlab.
% Stampare a video soluzione e residuo normalizzato (in norma infinito).

% Calcolare poi la matrice B = AA'
% e verificare se essa è definita positiva, eseguendo la fattorizzazione di Cholesky mediante la M-function chol
% di Matlab. Stampare a video il risultato. Nel caso B sia definita positiva, risolvere il sistema Bx = c, con
% c = (8/3, −1/5, 3/10, −9/5)T , usando il fattore di Cholesky e le M-function in allegato.

A=[2 0 0 1;-1 1/2 0 0;3/10 0 3/5 0;-3 1/5 -1/10 1/2]
b=[0 -2 -1 0]'
[L, R, P, deter] = gauss2(A)

[ x ] = rtrisol (R , ltrisol(L,b(P)) )  %ha confermato..
x2=A\b; %con matlab

xstar=( max( abs ( x - x2 ) ) ) ;

residuo= (b-A*x)/norm(b,inf)

B=A*A'
c=[8/3, -1/5, 3/10, -9/5]'
[Lchol,flag]=chol(B,'lower')

if(~flag)
    fprintf("def. pos");
end

Sol=rtrisol(Lchol',ltrisol(Lchol,c))



clc
clear all
clear

format rational

A=[8/3 -1 1/2;2/5 7/3 1/2;3/5 -1/3 4]
D=[8/3 0 0;0 7/3 0;0 0 4]
Dinv=[1 0 0;0 1 0;0 0 1] * 1./diag(D)
L=[0 0 0;-2/5 0 0;-3/5 1/3 0]
U=[0 1 -1/2;0 0 -1/2;0 0 0]

b = [1, -5, -2]'
tol=1e-5
maxit=50
x0=[1;-2; 1]


J=Dinv*(L+U)
G=(D-L)^(-1) * U

roJ=max(abs(eig(J)))
roG=max(abs(eig(G)))

VelocitaConvergenzaJ=-log2(roJ)
VelocitaConvergenzaG=-log2(roG)

numIterazioniNecessarieJ=1/VelocitaConvergenzaJ
numIterazioniNecessarieG=1/VelocitaConvergenzaG

fprintf("Rho J = %d, VelocitaConvergenza di J: %d, numero iterazioni necessarie: %d \n ",roJ,VelocitaConvergenzaJ,numIterazioniNecessarieJ)
fprintf("Rho G = %d, VelocitaConvergenza di G: %d, numero iterazioni necessarie: %d \n",roG,VelocitaConvergenzaG,numIterazioniNecessarieG)

[xj , kj ] = jacobi (A , b , x0 , maxit , tol )
xj
fprintf("con iterazioni: %d \n",kj)

format long

w=1.27
m1=(D-w*L)^(-1);
m2=((1-w)*D+w*U);
SOR=m1*m2

x1=1
x2=-2
x3=1

x1=-0.27*x1+0.47*x2-0.24*x3+0.47625
x2=0.5*x1-0.3736*x2-0.22*x3-2.83
x3=0.058*x1-0.13*x2-0.25*x3-1.025

x1=-0.27*x1+0.47*x2-0.24*x3+0.47625
x2=0.5*x1-0.3736*x2-0.22*x3-2.83
x3=0.058*x1-0.13*x2-0.25*x3-1.025

clc
clear all
clear

%
% (M) (3 punti) Scrivere un M-script file che calcoli il polinomio pn(x) di grado n interpolante la funzione f(x) in
% [a, b] sugli n+ 1 nodi di Chebychev, utilizzando a tale scopo la function polyNewton in allegato.
% Lo script generi
% poi in uno stesso grafico le due curve f(x) e pn(x), evidenziando nodi e punti di interpolazione e dotando il grafico
% di titolo, etichette degli assi e legenda. Lo script valuti infine l’errore relativo percentuale 
% en(x) = |pn(x) − f(x)|/|f(x)| negli N punti di un campionamento uniforme dell intervallo [a, b], disegnando il corrispondente
% grafico in una seconda finestra grafica. Utilizzare un campionamento di [a, b] con N ≥ 201. Evidenziare
% opportunamente in tale grafico i nodi di interpolazione.
% Provare lo script con [a, b] = [−2, 5], n + 1 = 6 ed N = 201.
%

a=-2
b=5
N=201

nGrado=5
nNodi=nGrado+1

for k=0:nNodi-1
    t=cos(((2*k + 1)/ (2*(nGrado+1))) * pi)
    z(k+1)=(b-a)/2 * t + (b+a)/2
end    



f= @(x) (sqrt(x+4)-(pi/6)*sin(2*x))
y=f(z)

xx=linspace(a,b,N)

[y2, d] = polyNewton(z, y, xx)

figure(99)
 hold on
% plot(xx,y2)
% fplot(f)


plot(xx,y2,xx,f(xx),z,y,"r+")
title(sprintf("p_%g(x)",nGrado))
xlabel("Valori di x")
ylabel("Valori di y")
legend(["Polinomio interpolante","Funzione","Punti di cherb"])


clc
clear all
clear 

rho =  1.2
rng(5)
a=0
b=3
N=3
Nnodi=N+1
Punti=10*N

f= @(x) (sqrt(x+4)-(pi/6)*sin(2*x))

omega=rand*(rho/2 + rho/2) - rho/2

h = @(x) rho*f(x)+omega


vet=rand(Punti,1)*(b-a)+a
vet=sort(vet)
y=h(vet)
A=[vet.^(N:-1:0)]
yy=A'*y
B=A'*A
[L , R , p , deter ] = gauss2 ( B )
z=rtrisol(R,ltrisol(L,yy(p)))

zControllo = A\(y)

xx=linspace(a,b,2000)
figure(32)
plot(xx,polyval(z,xx),vet,y,"r+")










