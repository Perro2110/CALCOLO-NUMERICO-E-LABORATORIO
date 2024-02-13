clc
clear all
clear
%% es4 teo

A=[3 1/2 0;1/4 5/3 1/2;0 1/3 1]
D=diag(diag(A))
Dinversa=diag(1./diag(A))
U=-(triu(A)-D)
L=-(tril(A)-D)

J=Dinversa*(L+U)
lam=sym("lam")
det(J-lam*[1 0 0;0 1 0;0 0 1])
format short
rhoJ=max(abs(eig(J)))
VelJ=-log(rhoJ)

format rat
G=(D-L)\U
lam=sym("lam")
det(G-lam*[1 0 0;0 1 0;0 0 1])
format short
rhoG=max(abs(eig(G)))
VelG=-log(rhoG)

format short
w=2/(1+sqrt(1-rhoJ^2))
SOR= (D-w*L)\ ((1-w)*D + w*U)

clc
clear all
clear
%% Es 4 matlab


n=input("inserisci n: ")
An = spdiags ([ ones(n,1)*-1/2  ones(n,1)*4  ones(n,1)*2/3  ] , [2 0 -2] , n , n );
D=diag(diag(An))
Dinv=diag(1./diag(An))
J=Dinv*(-(tril(An)-D) + (-(triu(An)-D)) )

for k = 1:n
    if mod(k,2)==0
        b(k)=1/4
    else
        b(k)=-1
    end
end

tol = 1.0e-3;
maxit = 100;

xk=zeros(n,1)
y=Dinv*b'
for k=1:maxit
    xprec=xk
    xk=J*xk+y
    if norm(xprec-xk,inf)<tol*norm(xk,inf)
        break
    end
end

disp("Max val degli autoval: ")
max(abs(eigs(An)))



