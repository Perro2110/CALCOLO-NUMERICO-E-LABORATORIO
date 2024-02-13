function [x , k ] = sor (A , b , x , maxit , tol , omega )
% SOR - Metodo SOR (Gauss - Seidel estrapolato )
% Calcola un ’ approssimazione della soluzione xs del sistema Ax = b
% usando il metodo iterativo SOR con tolleranza d’ arresto tol sulla norma
% infinito della differenza di due iterati successivi , partendo dal punto
% iniziale x e con un massimo maxit di iterazioni . Il vettore inziale
% verra ’ sovrascritto in uscita con l’ approssimazione calcolata della
% soluzione .
% Il calcolo viene effettuato SENZA CALCOLO ESPLICITO E MEMORIZZAZIONE
% della matrice di iterazione , ma usando semplicemente gli elementi di A.
% SYNOPSIS :
% [x, k] = sor (A, b, x, maxit , tol , omega )
% INPUT
% A ( doble array ) - Matrice ( quadrata ) del sistema lineare
% b ( double vector ) - Vettore dei termini noti del sistema lineare
% x ( double vector ) - Iterato iniziale ( sovrascritto da xs in uscita )
% maxit ( integer ) - Numero massimo di iterazioni consentite
% tol ( double ) - Tolleranza del criterio di arresto
% omega ( double ) - Parametro di rilassamento del metodo SOR
% OUTPUT
% x ( double vector ) - Approssimazione della soluzione
% k ( integer ) - Numero di iterazioni effettivamente compiute
%
n = max( size ( A ) ) ;
arresto = 0; k = 0;
while ( ~ arresto )
xtemp = x ; k = k + 1;
for i = 1 : n
x (i)=(-A(i,[1:i-1,i+1:n]) *x([1:i-1,i+1:n])+b(i))/A(i,i ) ;
x ( i ) = (1 - omega ) * xtemp ( i ) + omega * x ( i ) ;
end
arresto = ( norm ( xtemp - x , inf ) < tol * norm (x , inf ) ) || ( k == maxit ) ;
end
if ( k == maxit )
warning ("convergenza non raggiunta ") ;
end
end % fine della function sor