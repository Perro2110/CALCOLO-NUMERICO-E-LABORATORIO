function [C] = mySplineCompleta(x, y, z0, zf)
% MYSPLINECOMPLETA - Coefficienti della spline cubica completa interpolante
% INPUT
% x (double array) - vettore dei nodi di interpolazione
% y (double array) - vettore dei valori della funzione nei nodi
% z0 (double) - valori della derivata prima nel nodo iniziale
% zf (double) - valori della derivata prima nel nodo finale
% OUPUT
% C (double array) - matrice con tante righe quanti sono i
% sottointervalli e 4 colonne, contenenti i
% coeff. dei polinomi di grado 3, da quello
% della potenza 3 a quello della potenza 0
%
% C(i,1)*(x-x_i)^3 + C(i,2)*(x-x_i)^2 + C(i,3)*(x-x_i) + C(i,4)
%
% Rappresentazione ’pp’ (piecewise polynomial)
%
x = x(:); y = y(:);
m = length(x); mm1 = m - 1; mm2 = m - 2; % m = num. totale nodi
h = diff(x); % m-1 valori di h
d0 = 2 * ( h(1:mm2) + h(2:mm1) ); % diagonale principale
d1 = [0; h(1:(m-3))]; % prima sopradiagonale della matrice
dm1 = [h(3:(mm1)); 0]; % prima sottodiagonale della matrice
T = spdiags([dm1 d0 d1], [-1 0 1], mm2, mm2); % ordine m-2
r = ( ( y(2:mm1) - y(1:mm2) ) ./ h(1:mm2) ) .* h(2:mm1) + ...
( ( y(3:m) - y(2:mm1) ) ./ h(2:mm1) ) .* h(1:mm2);
r = 3 * r;
r(1) = r(1) - z0 * h(2);
r(mm2) = r(mm2) - zf * h(mm2);
z = T \ r; % risoluzione di un sistema tridiagonale
z = [z0; z; zf];
C = zeros(mm1, 4);
C(:,4) = y(1:mm1); % coeff. del termine costante
C(:,3) = z(1:mm1); % coeff. di x - x_i
C(:,1) = ... % coeff. di (x - x_i)^3
( z(2:m) + z(1:mm1) ) ./ ( h(1:mm1).^2 ) ...
- 2*( y(2:m) - y(1:mm1) ) ./ ( h(1:mm1).^3 );
C(:,2) = ... % coeff. di (x - x_i)^2
( ( y(2:m) - y(1:mm1) ) ./ h(1:mm1) ...
- z(1:mm1) ...
) ./ h(1:mm1) - C(:,1) .* h(1:mm1);
end