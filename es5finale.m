clc
close all
clear all


f= @(x) (sqrt(x+4)-(pi/6)*sin(2*x))

%% per parte T)
n=3 % grado
a=0
b=4
t=cos(((2*[0:n]+1)/(2*(n+1))) * pi)
z=(b-a)/2 * t + (b+a)/2

fp=diff(sym(f))
fs=diff(sym(fp))
ft=diff(sym(fs))
fq=diff(sym(ft))
fplot(fq,[0,4])
linspace(0,4,3)

clc
close all

%% per parte M)
n=5
nodi= n+1
N= 201
a= -2
b= 5

xx=linspace(a,b,N)

t=cos(((2*[0:n]+1)/(2*(n+1))) * pi)
x=(b-a)/2 * t + (b+a)/2
y=f(x)
[yy, d] = polyNewton(x,y,xx);
figure(1)
plot(xx,yy,xx,f(xx),x,zeros(size(x)),"k+",x,y,"ro",xx,zeros(size(xx)),"k--")
title(sprintf("Confronto tra polinomio interpolante di grado %g e f",n))
legend("Polinomio interpolante","funzione","nodi di interpolazione","punti di interpolazione","asse ascisse")
xlabel("asse x")
ylabel("asse y")

err=abs(yy-f(xx))./abs(f(xx))
figure(2)
plot(xx,err,x,zeros(size(x)),"ro")
