function [yy] = valSpline(C, x, xx)
% VALSPLINE - Valutazione di una spline cubica interpolante
% Calcola i valori yy in xx della spline cubica interpolante sui
% nodi x, con coeff. nelle colonne di C, usando lo schema di Horner
% INPUT
% C (double array) - matrice dei coefficienti della spline cubica
% sulla partizione x, nella forma ’pp’ (in
% colonna 1 il coeff. della potenza 3).
% x (double array) - vettore (ORDINATO) dei nodi di interpolazione
% xx (double array) - vettore dei punti in cui calcolare la spline
% OUTPUT
% yy (double array) - vettore dei valori della spline nei punti xx
%
x = x(:); xx = xx(:); m = size(C,1); yy = zeros(size(xx));
for i = 1 : length(xx)
if ( xx(i) < x(1) || xx(i) > x(end) )
error(sprintf('xx(%d) esterno all intervallo',i));
end
if ( xx(i) == x(end) )
k = m;
else
k = min( find( x > xx(i) ) ) - 1;
end
yy(i) = ( ( C(k,1) * (xx(i) - x(k)) + C(k,2) ...
) * (xx(i) - x(k)) + C(k,3) ...
) * (xx(i) - x(k)) + C(k,4); % oppure, yy(i) = ...
end
end