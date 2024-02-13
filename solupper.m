function [x] = solupper(R,b)
% SOLUPPER - Soluzione di sistema triang. sup. (per righe)
n = length(b);
x = b; % si puo’ evitare con:
x(n) = x(n)/R(n,n); % x(n) = b(n)/R(n,n);
for i = n-1 : -1 : 1 % e poi mettendo
% SDOT - BLAS1 % dentro il ciclo:
x(i) = x(i) - R(i, i+1:n)*x(i+1:n); % x(i) = b(i) - R(i,...
x(i) = x(i)/R(i,i);
end
end

function [x] = rtrisol(R,b)
% RTRISOL - Soluzione di sistema triang. sup. (per colonne)
n = length(b);
x = b; % Qui NON si puo’ evitare di fare questa assegnazione!!
x(n) = x(n)/R(n,n);
for j = n-1 : -1 : 1
% SAXPY - BLAS1
x(1:j) = x(1:j) - R(1:j, j+1)*x(j+1);
x(j) = x(j)/R(j,j);
end
end