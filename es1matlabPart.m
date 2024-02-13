clc
clear all
clear

c6=log10(pi^(7/4)*max(exp(2)-5,tan(1/2)));
c5=cos((abs(-0.7*exp(-0.2)))^(1/3));
c4=0;
c3=-sin(0.2+exp(-1.6))
c2=0
c1=acos(3.7*10^(-1))+1/4
c0=log(sqrt(pi^3)+2/3)

p=[c6 c5 c4 c3 c2 c1 c0]
x0=input("inserisci x0: ")

[r1 , q1 ] = ruffiniHorner (p , x0);
[r2 , q2 ] = ruffiniHorner (q1 , x0);
[r3 , q3 ] = ruffiniHorner (q2 , x0);

fprintf("valore in p6(x0):  %g \n",factorial(0)*r1);
fprintf("valore in p6'(x0): %g \n",factorial(1)*r2);
fprintf("valore in p6''(x0):%g \n",factorial(2)*r3);

fplot(@(x)(polyval(p,x)),[-1.5,1.3])

