clc
clear all
close all

c0= -sqrt(-log(3/1e5))
c1= 9.0534
c2=min([ sin(5.7), 71.6*exp(-4) , 2.3/(pi^2) ])
c3=0
c4= (1/4)*max(exp(pi),pi^exp(1))
c5=0
c6=log2(acos(1.64-exp(0.7)))
c7=abs(tan(4.2*pi - 2.8))

p7=[c7 c6 c5 c4 c3 c2 c1 c0]'

a=input("inserire valore x0: ")

[r1 , q1 ] = ruffiniHorner (p7 , a )
[r2 , q2 ] = ruffiniHorner (q1 , a )
[r3 , q3 ] = ruffiniHorner (q2 , a )

fprintf("valore in p_7 (x0): %g \n ",r1)     %factorial di 0
fprintf("valore in p'_7 (x0): %g \n ",r2)    %factorial di 1
fprintf("valore in p''_7 (x0): %g \n ",r3*2) %factorial di 2

fplot(@(x)(polyval(p7,x)),[-2.5,1.1])
