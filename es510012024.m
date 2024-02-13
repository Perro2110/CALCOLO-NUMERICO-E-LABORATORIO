clc
close all
clear all

f=@(x) ( sqrt(x+4)-(pi/6) .* sin(2 .* x) )
gradoN=5
nodi=gradoN+1
a=-2
b=5
N=201
nodi=(b-a)/2 * (cos((2*[0:gradoN]+1)/(2*(gradoN+1)) * pi)) + (a+b)/2
xx=linspace(a,b,N)
x=nodi
y=f(nodi)
[yy, d] = polyNewton(x, y, xx);
figure(1)
plot(xx,yy,linspace(a,b,N),f(linspace(a,b,N)),x,y,"ro")
title("Grafico bello")
xlabel("Asse x")
ylabel("Asse y")
legend("Polinomio interpolante","Funzione effettiva","nodi di interpolazione")
en = abs(yy - f(xx))./abs(f(xx)) * 100 
figure(2)
semilogy(xx,en)

