function [x,k]=jacobi(A,b,x,maxit,tol);
% metodo di jacobi
%in input servono: la matrice A, il termine noto b, il numero di iterazioni
%necessarie, la tolleranza e l' iterato iniziale x
n=size(A,1);
%memorizzo A in forma sparsa ed estraggo la diagonale principale
dd=spdiags(A,0);
D=spdiags(dd,0,n,n);
for k=1:maxit
xtemp=x;
x=(-A*x+D*x+b)./dd; % istruzione vettoriale
if norm(xtemp-x,inf)<tol*norm(x,inf)
break
end
end
if k == maxit
error('convergenza non raggiunta');
end