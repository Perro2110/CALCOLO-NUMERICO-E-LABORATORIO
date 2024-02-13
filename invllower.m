function [S] = invllower(S)
% INVUPPER - Sovrascrive una matrice triang. inf. invert. con la propria inversa
% SYNOPSIS:
% [S] = invllower(S)
% INPUT:
% S (double array) - Matrice triangolare INFERIORE da invertire
% OUTPUT:
% S (double array) - La matrice in input sovrascritta con la propria inversa

[m, n] = size(S);
if ( isempty( find( diag(S) == 0 ) ) ) % oppure find( ~diag(R) )
  S(n,n) = 1 / S(n,n);
  for j = n-1 : -1 : 1
    S(j,j) = 1 / S(j,j);
    for i = n : -1 : j+1
    S(i,j) = -( S(i, i+1:j)*S(i+1:j, j) )*S(i,i);
    end
  end
else
error("la matrice e’ singolare");
end