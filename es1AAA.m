p(1)=log(2^4)
p(2)=log(2^5)
p(3)=log(2^6)
p(4)=log(2^8)
p(5)=log(2^9)
p(6)=log(2^11)
p(7)=log(2^12)
x0=input("inserisci x0: ")

[r1 , q1 ] = ruffiniHorner (p , x0)
[r2 , q2 ] = ruffiniHorner (q1 , x0)
[r3 , q3 ] = ruffiniHorner (q2 , x0)

fprintf("polinomio (x0) %g \n",factorial(0)*r1)
fprintf("polinomio ' (x0) %g \n",factorial(1)*r2)
fprintf("polinomio '' (x0) %g \n",factorial(2)*r3)

fplot(@(x)(polyval(p,x)),[-1.4, 0.5]);


