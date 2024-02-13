clc 
clear all
close all
clear

N=3
grado= 3
rho=1.2
omega=rand()*(-rho/2 - rho/2)+(rho/2)
intervallo = 10 * N
h=@(x) (rho .* sqrt(x+4)-(pi/6) .* sin(2 .* x) + omega)

a=0;
b=3;
N = 3;
punti =10*N

rng(5)
xx=rand(punti,1) *(b-a)+a
xx=sort(xx)
yy=h(xx)
A=[xx.^(grado:-1:0)]
val=A'*A
yy=A'*yy
[L,flag]=chol(val,"lower")
zstar=rtrisol(L',ltrisol(L,yy))
zConff= A\h(xx)

plot(xx,h(xx),"r+")
hold on
fplot(@(x)polyval(zstar,x),[a,b])

