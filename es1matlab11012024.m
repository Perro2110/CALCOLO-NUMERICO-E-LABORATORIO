%%  es 1 parte matlab
%  matrice: 184789 


clc
close all
clear all

c0=min(exp(-2), max(sin(7.2*pi),3.1)+1/2)
c1=sqrt(log(factorial(7)))
c2=tan(pi/3 - log2(4.17))
c3=0
c4=55/100 * abs(sin((5*pi)/8)*exp(1/3))
c5=max([3.7*1e-2 ,tan(2*pi),-log10(0.314),0.7/(pi^3)])
c6=cos(3*asin(-sqrt(exp(1)/pi)))

a=-0.5
b=1.4
p=[c6 c5 c4 c3 c2 c1 c0]'
x0=input("inserire prefissato x0: ");

[r1 , q1 ] = ruffiniHorner (p,x0)
[r2 , q2 ] = ruffiniHorner (q1,x0)
[r3 , q3 ] = ruffiniHorner (q2,x0)

fprintf("il valore del polinomio p6(x0): %g   \n ",r1)
fprintf("il valore del polinomio p6'(x0): %g  \n ",r2)
fprintf("il valore del polinomio p6''(x0): %g \n ",r3*2)
fplot(@(x)(polyval(p,x)),[a,b])