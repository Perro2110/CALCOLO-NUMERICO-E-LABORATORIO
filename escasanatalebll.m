clear
clc
clear all

A=[9 -3 -1;-2 9 0;-2 0 9]
D=[9 0 0;0 9 0;0 0 9]
L=[0 0 0;2 0 0;2 0 0]
U=[0 3 1;0 0 0;0 0 0]

b=[5,-2,3]'

J=D^-1 *(L+U)

G= (D-L)^-1 * U

Spettro_di_J=eig(J)
Spettro_di_G=eig(G)

RJ=max(abs(Spettro_di_J))
RG=max(abs(Spettro_di_G))

VelocitaJ=-log(RJ)
VelocitaG=-log(RG)

x=zeros(3,1)
maxit=100
tol=1.0e-5

[xj , kj ] = jacobi (A , b , x , maxit , tol )

[xg,kg]=gauss_seidel(A,b,x,maxit,tol)

fprintf("veloc...")

