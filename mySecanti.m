function [x, it] = mySecanti(fname, fpname, x0, tolx, tolf, maxit)
% INPUT: fname (string o fhandle) - Function della funzione
% fpname (string o fhandle) - Function della derivata prima
% x0 (double) - Stima iniziale
% tolx (double) - Distanza minima fra iterati successivi
% tolf (double) - Soglia verso zero dei valori di f(x)
% maxit (integer) - Numero massimo di interazioni
% OUTPUT: x (double) - Approssimazione della soluzione
% it (integer) - Numero di iterazioni eseguite
tolfp = min( tolf, 10*eps );
% Metodo di Newton
x = x0; fx = feval(fname, x); it = 0;
stop = ( abs(fx) < tolf );
while ( ~stop )
    it = it + 1;
    t = fx0 / fx1;
    d = (x1 - x0) / (1 - t);
    x = x1 - d;
    fx = feval(fname, x);
    stop = ( (abs(fx) < tolf && abs(d) < tolx + eps*abs(x1)) || fx == 0 || it == maxit );
    fx0 = fx1;
    fx1 = fx;
    x0 = x1;
    x1 = x;
end
if ( it >= maxit )
    fprintf('\nRaggiunto il massimo numero di iterazioni.\n');
end
end