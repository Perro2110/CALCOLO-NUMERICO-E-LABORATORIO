function [S] = invtril(S)
% invtril - Sovrascrive una matrice triang. inf. invert. con la propria inversa
% SYNOPSIS:
% [S] = invtril(S)
% INPUT:
% S (double array) - Matrice triangolare INFERIORE da invertire
% OUTPUT:
% S (double array) - La matrice in input sovrascritta con la propria inversa

[m, n] = size(S);
if( any( diag(S) ) ) 
  S(n,n) = 1 / S(n,n);
  for j = n-1 : -1 : 1
    S(j,j) = 1 / S(j,j);
    for i = n : -1 : j+1
        S(i,j) = -( (S(j+1:i, j)')*S(i, j+1:i)' )*S(j,j);
    end
  end
else
error("Argomenti piccoli nella diagonale di S");
end
 