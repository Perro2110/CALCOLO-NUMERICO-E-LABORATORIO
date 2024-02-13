%% Marco Perrotta 
%% Matricola 184789
clc
clear all 
clear
% es1 M)

% dati:
c0=-sqrt(-log(3/(1e5)))
c1=9.0534
c2=min( sin(5.7) , min( (71.6e-4) , 2.3/(pi^2) ) )
c3=0
c4=1/4 * max(exp(pi),pi^exp(1))
c5=0
c6=log2(acos(1.64-exp(0.7)))
c7=abs(tan(4.2*pi-2.8))

a= -2.5
b= 1.1


x0=input("inserire x0 : ")
p=[c7 c6 c5 c4 c3 c2 c1 c0]

[r1 , q1 ] = ruffiniHorner (p  , x0 )
[r2 , q2 ] = ruffiniHorner (q1 , x0 )
[r3 , q3 ] = ruffiniHorner (q2 , x0 )

fprintf(" il valore del polinomio p7(x0) : %g\n",factorial(0)*r1);
fprintf(" il valore del polinomio p7'(x0) : %g\n",factorial(1)*r2);
fprintf(" il valore del polinomio p7''(x0) : %g\n",factorial(2)*r3);

fplot(@(x)(polyval(p,x)),[a,b]);




