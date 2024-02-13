% Cognome Nome
% Matricola
close all
clear all
clc
% ----------------------------
% esercizio 1 - 26/01/2018
% ----------------------------
disp ("Esecizio 1") ;
p = [3 -9 0 11 -pi 0 -2]';
x0=input("inserire valore: ");
[r , q ] = ruffiniHorner (p,x0);
fprintf("Valore del polinomio in x0: p(x0) = %g \n",r)

[r2 , q2 ] = ruffiniHorner (q,x0);
fprintf("Valore del polinomio in x0: p'(x0) = %g \n",r2)

[r3 , q3 ] = ruffiniHorner (q2,x0);
fprintf("Valore del polinomio in x0: p'(x0) = %g \n",(r3*2))

fplot(@(x)(polyval(p,x)),[0,2])


