f= @(x) (2.2-(sqrt(x+4)-(pi/6)*sin(2*x)))
%% per parte T)
fp=@(x)(pi*cos(2*x))/3 - 1/(2*(x + 4)^(1/2))

%% per parte M)
clc
close all

grado = 3
a=0
b=3
N=10*grado

vetx=(linspace(a,b,N))';
rho = 1.2
rng(5)
omega = rand()*(rho/2 + rho/2) - (rho/2)
h = @(x) (rho*(sqrt(x+4)-(pi/6)*sin(2*x))+omega)
A=[vetx.^[grado:-1:0]]

Val=A'*A
yy=A'*(h(vetx))

[L]=chol(Val,"lower");
coeffP=rtrisol(L',ltrisol(L,yy))
hold("on")
plot(vetx,h(vetx))
fplot(@(x)polyval(coeffP,x),[a,b])





