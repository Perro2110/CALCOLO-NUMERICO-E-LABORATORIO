function [yy] = splineLineare(x, y, xx)
% SPLINELINEARE - Valuta in xx la spline lineare interpolante x e y
% x (double array) - vettore dei nodi (ordinati in modo crescente)
% y (double array) - vettore delle osservazioni
% xx (double array) - vettore in cui valutare la spline lineare
% yy (double array) - vettore dei valori della spline nei punti xx
%
x = x(:); y = y(:); xx = xx(:);
for i = 1 : length(xx)
if ( xx(i) < x(1) || xx(i) > x(end) )
error(’punto non interno all’’intervallo di interpolazione’);
end
k = min( find( abs(x - xx(i)) < eps ) );
if ( ~isempty(k) )
yy(i) = y( k );
else
k = min( find( x > xx(i) ) );
yy(i) = ( y(k-1) * (xx(i)-x(k)) - y(k) * (xx(i)-x(k-1)) ) ...

/ ( x(k-1) - x(k) );

end
end
end