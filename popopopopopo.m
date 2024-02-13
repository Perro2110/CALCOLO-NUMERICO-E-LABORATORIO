clc
clear all
clear

a=-1.2;
b=0.1;
x0=input("inserire x0")

p7(1)=abs(sin(pi^3.06)-min(3/pi , 2/exp(1)))
p7(2)=0
p7(3)=log10(tan(0.4998*pi))
p7(4)=23/5 - acos(-sqrt(pi/7))
p7(5)=0
p7(6)=exp(-5.3*sin(0.25+3*pi))-factorial(6)/5^4
p7(7)=max(5.09E-02,max(3/17,max(log(2^6),tan(2.83))))
p7(8)=log(log10(log2(13.07^185)))

[r1 , q1 ] = ruffiniHorner (p7 , x0 )
[r2 , q2 ] = ruffiniHorner (q1 , x0 )
[r3 , q3 ] = ruffiniHorner (q2 , x0 )

fprintf("p7 (x0)= r1 = %g \n",r1)
fprintf("p7 ' (x0)= r2 = %g \n",r2)
fprintf("p7 ''(x0)= 2! r3 = %g \n",factorial(2)*r3)
x0=-0.63
fplot(@(x)(polyval(p7,x)),[a,b])

