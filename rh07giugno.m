clc
clear all
clear

fprintf("es 1 \n");

p(1)=3;
p(2)=-9;
p(3)=0;
p(4)=11;
p(5)=pi;
p(6)=0;
p(7)=-2

x0=input("inserire numero (reale) x0 \n");

[r1 , q1 ] = ruffiniHorner (p , x0 );
[r2 , q2 ] = ruffiniHorner (q1 , x0 );
[r3 , q3 ] = ruffiniHorner (q2 , x0 );

fprintf("Valore del polinomio in x0: p(x0) = %g \n",r1)
fprintf("Valore della derivata seconda in x0: p'(x0) = %g \n ",r2*factorial(1))
fprintf("Valore della derivata seconda in x0: p''(x0) = %g \n",r3*factorial(2))


