%% Marco Perrotta 
%% Matricola 184789
clc
clear all 
clear
format rational 

A=[2 0 0 1;-1 1/2 0 0;3/10 0 3/5 0;-3 1/5 -1/10 1/2]
b=[0;-2;-1;0]
xTeo=[-38/213;-928/213;-112/71;76/213]

[L, R, P, deter] = gauss2(A);

y=ltrisol(L,b(P));
xMyMat=rtrisol(R,y)

xMatlab=A\b

format shorte
disp("Gauss2 vs Carta")
max(abs(xMyMat-xTeo)) %al piu di errore macchina

disp("Predefinita matlab vs Carta")
max(abs(xMatlab-xTeo)) %al piu di errore macchina
format rat
disp("determinante A: ")
disp(deter);
disp("Soluzioni:")
disp(xMyMat);
residuonormalizzatoinnormainfinito = (b-A*xMyMat)/norm(b,inf);
disp("residuo normalizzato (in norma infinito):")
disp(residuonormalizzatoinnormainfinito);

%% parte due

B=A*A'
c=[8/3 -1/5 3/10 -9/5]'
[Lchol,flag]=chol(B,'lower');
if flag == 0
    disp("Definita positivamente");
    risultato=rtrisol(Lchol',ltrisol(Lchol,c));
    disp("Il risultato è: ")
    disp(risultato)
else 
    disp("No definita positivamente");
end




