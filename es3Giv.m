clc
clear all
close all
format rat
%% punto 1 - teo
A=[1/3 0 1/2 -1;0 3 1/4 0;1/2 0 2 0;1 0 -1 1/3]
b=[0 -1/3 1 1/4]'
s=3*sqrt(13)/13
c=2*sqrt(13)/13
G13=[c 0 s 0;0 1 0 0;-s 0 c 0;0 0 0 1]
format short
A2=G13*A
t=0.6009
s=1/sqrt(1+t^2)
c=s*t
G14=[c 0 0 s;
     0 1 0 0;
     0 0 1 0;
    -s 0 0 c; 
    ]
A3=G14*A2

t=0.6934/-2.1792
s=1/sqrt(1+t^2)
c=s*t
G34=[1 0 0 0;0 1 0 0;0 0 c s;0 0 -s c]
R=G34*A3
Q=G13'*G14'*G34'
y=Q'*b
XTeo=solupper(R,y)

%% punto 2 - Pratico M
A=[1/3 0 1/2 -1;0 3 1/4 0;1/2 0 2 0;1 0 -1 1/3]
b=[0 -1/3 1 1/4]'
[Q,R] = qr(A)
XMatQr=solupper(R,Q'*b)
disp("Differenza tra punto 1 e qr di matlab:")
diffTeo_Qr=max(abs(XTeo-XMatQr))

[L,U,P] = lu(A) %uso quella con permutazione avendo notato che altrimenti avrei problemi di instabilità
tlu=ltrisol(L,P*b)
xMatLu=rtrisol(U,tlu)
normInff=norm(XMatQr-xMatLu,"inf");
fprintf("norma infinito della differenza fra la soluzione del sistema ottenuta con la fattorizzazione QR \n e la soluzione che si ottiene ..." + ...
    "sfruttando la fattorizzazione LU di Matlab: %g \n",normInff);
normaRelDiffSol = normInff / norm ( XMatQr , inf )
[rango,determinante,normainfinito] = miaDiade(Q(:,1),R(1,:))


