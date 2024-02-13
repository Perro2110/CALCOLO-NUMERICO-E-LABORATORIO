function [z, d] = polyNewton(x, y, xx)
% POLYNEWTON - Valuta in xx il polinomio di Newton interpolante su (x, y)
% Valuta nei punti xx il polinomio interpolante dei dati y sui nodi x
% nella forma di Newton , secondo lo schema di Horner generalizzato .
% SYNOPSIS
% [z, d] = polyNewton (x, y, xx)
% INPUT
% x ( double array ) - vettore dei nodi o punti di osservazione
% y ( double array ) - vettore delle osservazioni
% xx ( double array ) - vettore dei punti in cui calcolare il polinomio
% di Newton
% OUTPUT
% z ( double ) - valore del polinomio nei punti xx
% d ( double array ) - coefficienti del polinomio di Newton
%

n = length(x);
d = tabDiff(x,y);
z = d(n)*ones(size(xx));
for i = n-1 : -1 : 1
    z = z .* (xx - x(i)) + d(i);
end