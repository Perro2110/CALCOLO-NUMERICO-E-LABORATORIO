function [x] = utrisol2(R,b)
% RTRISOL - Soluzione di sistema triang. sup. (per colonne) per n b

n = length(b);
x = b; % Qui NON si puoz evitare di fare questa assegnazione!!
x(n,:) = x(n,:)./R(n,n);
for j = n-1 : -1 : 1
% SAXPY - BLAS1
x(1:j, :) = x(1:j, :) - R(1:j, j+1)*x(j+1,:);
x(j,:) = x(j,:)/R(j,j);
end
end