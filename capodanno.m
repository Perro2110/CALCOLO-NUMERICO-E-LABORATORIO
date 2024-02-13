clear
clc
clear all


z0=2*cos(1/8 * pi)+2
z1=2*cos(3/8 * pi)+2
z2=2*cos(5/8 * pi)+2
z3=2*cos(7/8 * pi)+2

f=@(x) sqrt(x+4)-(pi/6)*sin(2*x)
fx0=f(z3)
fx1=f(z2)
fx2=f(z1)
fx3=f(z0)

fver=f(1.5)


x=sym("x");
f=@(x) sqrt(x+4)-(pi/6)*sin(2*x)
f1=diff(sym(f));
f2=diff(sym(f1));
f3=diff(sym(f2));
f4=diff(sym(f3))

m=max(abs(f4))


% (M) (3 punti) Scrivere un M-script file che calcoli il polinomio pn(x) di grado n interpolante la funzione f(x) in
% [a, b] sugli n+ 1 nodi di Chebychev, utilizzando a tale scopo la function polyNewton in allegato. Lo script generi
% poi in uno stesso grafico le due curve f(x) e pn(x), evidenziando nodi e punti di interpolazione e dotando il grafico
% di titolo, etichette degli assi e legenda. Lo script valuti infine l’errore relativo percentuale en(x) = |pn(x) −
% f(x)|/|f(x)| negli N punti di un campionamento uniforme dell’intervallo [a, b], disegnando il corrispondente
% grafico in una seconda finestra grafica. Utilizzare un campionamento di [a, b] con N ≥ 201. Evidenziare
% opportunamente in tale grafico i nodi di interpolazione.
% Provare lo script con [a, b] = [−2, 5], n + 1 = 6 ed N = 201.

clear
clc
clear all

gradon=3
numNodi=gradon+1
a=0
b=4
nodi=zeros(numNodi,0)'

for i=1:numNodi
    nodiChebychev=cos( (2*(i-1)+1)*pi / (2* (gradon+1)) );
    nodi(i) = 0.5*( nodiChebychev *( b - a ) + ( a + b ))
end

f=@(x) sqrt(x+4)-(pi/6)*sin(2*x)

j=numNodi
for i=1:numNodi
    x(i)=nodi(j)
    j=j-1
end

for i=1:numNodi
    y(i)=f(x(i))
end
xx=linspace(a,b,100)

[yy, coeff] = polyNewton(x, y, xx);

yyy=f(xx)

hold on

plot(yy)
plot(yyy)









