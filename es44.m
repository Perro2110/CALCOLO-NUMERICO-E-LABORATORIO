clc
clear all
clear
A=[2 0 1/2;0 4/3 -5/4;2/3 0 1]
D=diag(diag(A))
Dinv=diag(1./diag(A))
L=-(tril(A)-D)
U=-(triu(A)-D)
J=Dinv*(L+U)

format long
rhoJ=max(abs(eig(J)))
velJ=-log(rhoJ)
fprintf("rho(J): %g vel(J): %g \n",rhoJ,velJ);
format rat
G=(D-L)\U

format long
rhoG=max(abs(eig(G)))
velG=-log(rhoG)
fprintf("rho(G): %g vel(G): %g \n",rhoG,velG);

w=sym("w")
(D-w*L)
((1-w)*D+w*U)

b     = [1/3 -2 -1]'
xJ    = [1 1 1]'
tol   = 1e-5
maxit = 50

[x,k]=jacobi(A,b,xJ,maxit,tol);
fprintf("num iter: %g \n",k);
approsimazione_Calcolata=x

w        = 0.82
sor      = (D-w*L)\((1-w)*D+w*U)
xstar    = [1 1 1]'
for i=0:5
    xstar=sor*xstar+(D-w*L)\(w*b);
end
    xstar  
