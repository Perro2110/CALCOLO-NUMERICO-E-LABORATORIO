A=[1/2 3/2 -1/2;1 2 2;4 7 -1]
b=[-1;-2;0]
xTeoria=[10/3;-2;-2/3]

[L, R, P, deter] = gauss2(A)
c=ltrisol(L,b(P))
y=rtrisol(R,c)

yMat=A\b

diffPercentuale=(abs(xTeoria-y)./abs(xTeoria))*100
residuoNormalizzato=(b-A*y)/norm(b,"inf")


% Calcolare poi la matrice B = AA'
% e verificare se essa è definita positiva, eseguendo la fattorizzazione di Cholesky mediante la M-function chol
% di Matlab. Stampare a video il risultato. Nel caso B sia definita positiva, risolvere il sistema Bx = c, con
% c = (3/5, −2/3, −1/7)T , usando il fattore di Choleski e le M-function in allegato
b=[3/5;-2/3;-1/7]
B=A*A'
[L,flag] = chol(B,"lower")
if(flag==0)
    fprintf("def pos")
    sol=rtrisol(L',ltrisol(L,b))
end


% 
% t=(3/2)/2
% s=1/sqrt(1+t^2)
% c=t*s
% G12=[c s;-s c]
% A=[3/2 -1/2; 2 2]
% G12*A
% 
