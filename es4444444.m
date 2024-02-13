clc
clear all
close all
format rat
A=[9/4 0 -1/3 1/2;0 -3/2 0 3/2; -1/2 1/3 7/4 0;1/2 0 0 -3/2]
D=diag(diag(A))
L=-(tril(A)-D)
U=-(triu(A)-D)
J=D\(L+U)
GS=(D-L)\U
w=sym("w");
Sor1=(D-w*L)
Sor2=((1-w)*D+w*U)

lam=sym("lam")
det(GS-eye(4)*lam)
pause();
% Con l’aiuto di Matlab, determinarne i raggi spettrali ρ(J) e ρ(G) e, se possibile, le rispettive velocità asintotiche
% di convergenza.
clc
format short
rhoJ=max(abs(eig(J)))
VelJ=-log(rhoJ)

rhoGS=max(abs(eig(GS)))
VelGS=-log(rhoGS)

z=((cos([1:4] + 1 ) )./([ 1:4 ] ))'
yJ=D\z
yGs=(D-L)\z
x=[1 -1 1 -1]'
maxit=50
tol=1e-5

for k=1:maxit
    xtemp=x;
    x=J*x+yJ;
    if norm(xtemp-x,inf)<tol*norm(x,inf)
        break
    end
end

disp("Iterazioni:")
disp(k)
disp("Risultati: ")
disp(x)
    

