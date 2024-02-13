%% es 1 1parz Sabato
clc
clear all
close all 
x0=input("Inserire numero reale positivo");
if x0 < 0
    disp("Errore non ha inserito numero positivo");
    return
end

p=[7 0 0 -4 0 1 1 -3 -5 -7];

[r1 , q1 ] = ruffiniHorner (p , x0 )
[r2 , q2 ] = ruffiniHorner (q1 ,x0 )
[r3 , q3 ] = ruffiniHorner (q2, x0 )

fprintf("Polinomio p(x0): %g \n",r1)
fprintf("Polinomio p'(x0): %g \n",r2)
fprintf("Polinomio p''(x0): %g \n",r3*2)

if polyval(p,x0) == r1
    fprintf("Esito positivo del controllo richiesto da teoria \n")
end