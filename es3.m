clc
clear all
close all
format short
% Scrivere poi un M-script file che calcoli la fattorizzazione QR della matrice A di cui sopra e risolva il
% sistema lineare Ax = b con termine noto il vettore b di cui sopra, sfruttando la fattorizzazione ottenuta
% e la funzione solupper in allegato. 
% Controllare i risultati con quelli ottenuti al punto 1. 
% 
% Calcolare inoltre
% la norma infinito della differenza fra la soluzione del sistema ottenuta con la fattorizzazione QR e la
% soluzione che si ottiene sfruttando la fattorizzazione LU di Matlab e le M-functions sollower e solupper
% in allegato. 
% Lo script visualizzi a console il valore di tale norma con un’istruzione di stampa formattata.
% Le due soluzioni coincidono? Motivare il risultato, considerando anche la differenza relativa.
% Successivamente, lo script provi la M-function miaDiade di cui sopra, passandole come vettori di ingresso,
% rispettivamente, la prima colonna della matrice Q e la prima riga della matrice R della fattorizzazione QR
% di A precedentemente ottenuta. Quanto risulta il rango della diade? È corretto? Motivare la risposta.

A=[1 0 -1 0;0 3 0 1;1 0 2 0;0 1 0 2]
b=[0 -1 0 -1]'
mieSol=[0 -1/5 0 -2/5]';
[Q,R] = qr(A)
y=Q'*b
xsolQr=solupper(R,y)
fprintf("Differenza tra parte 1(teoria) e parte due matlab con fattorizzazione QR %g \n",max(abs(mieSol-xsolQr)));

[L,U,P] = lu(A)
yy=sollower(L,P*b)
xsolLU=solupper(U,yy)
normaInfinitoDiffSolQReLaSolLU=norm(xsolQr-xsolLU,inf);
fprintf("la norma infinito della differenza fra la soluzione del sistema \n ottenuta con la fattorizzazione QR e" + ...
    " le soluzione che si ottiene sfruttando la fattorizzazione LU\n di Matlab e le M-functions sollower e solupper: %g \n",normaInfinitoDiffSolQReLaSolLU)
DiffRelativa = max (abs((xsolLU-xsolQr))./abs(xsolQr));
DiffRelativa

% soluzioni coincidono? No 
% differiscono al piu della precisione macchina
% dovuta all' aritmetica finita e quindi alla diversa "ottimizzazione" nei
% due algorimi 

% Successivamente, lo script provi la M-function miaDiade di cui sopra, passandole come vettori di ingresso,
% rispettivamente, la prima colonna della matrice Q e la prima riga della matrice R della fattorizzazione QR
% di A precedentemente ottenuta. Quanto risulta il rango della diade? È corretto? Motivare la risposta.

[rango,determinante,norminf]=miaDiade2(Q(:,1),R(1,:))
% rango risulta essere 1 come da "teoria" essendo che il rango di una diade
% sara sempre 1, non valutando l'errore macchina (in tal caso non ho avuto tale problema essendo 
% i valori della diagonale estratta dalla fattorizzazione qr al piu diversi dalla precisione macchina)




