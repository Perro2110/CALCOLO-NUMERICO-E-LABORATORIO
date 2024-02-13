function [STR] = conv10toBETA_fraz_vec(ALPHA, BETA, N)
%conv10toBETA_fraz_vec - Conversione parte frazionaria da base 10 a base BETA > 1. Vers. vettoriale
% Questa funzione implementa l'algoritmo delle moltiplicazioni successive
% per la conversione di numeri frazionari da base 10 a base BETA
% VERSIONE VETTORIALE: accetta in input un vettore di numeri frazionari da convertire.
%
% SYNOPSIS
%   [STR] = conv10toBETA_fraz(ALPHA, BETA, N)
%
% INPUT
%   ALPHA (double array)  - Vettore di numeri positivi < 1
%   BETA  (integer)       - Nuova base compresa tra 2 e 36 nella quale si vuole
%                           convertire il numero ALPHA
%   N     (integer)       - Numero massimo di cifre per la parte frazionaria
%                           nella nuova base
%
% OUTPUT
%   STR   (string cell)  - Cell array di stringhe che rappresentano i numeri 
%                          frazionari nel vettore ALPHA espressi nella nuova base BETA

% E' opportuno inserire controlli sull'input...
if ( any(~isnumeric(ALPHA)) || (any(ALPHA >= 1)) || (any(ALPHA < 0)) )
    error('ALPHA deve essere un numero decimale positivo');
end
if ( ~isnumeric(BETA) || (BETA ~= fix(BETA)) ...
     || (BETA < 2) || (BETA > 36) )
    error('BETA deve essere un numero intero positivo fra 2 e 36');
end

% DA FARE: gestione di NaN e Inf

% cifre ammissibili per la nuova base BETA compresa tra 2 e 36
d = char( [double('0'):double('9'), double('A'):double('Z')] );

% algoritmo delle moltiplicazioni successive

p = ALPHA;
STR = cellstr( repmat('.', size(ALPHA) ) );
i = 0;
indNZ = find( p ); % equivalente a find( p ~= 0 )
while ( ~isempty(indNZ) && (i < N) )
    r = fix( p(indNZ)*BETA );                  % parte_intera
    p(indNZ) = p(indNZ)*BETA - r;              % parte_frazionaria
    STR(indNZ) = strcat(STR(indNZ), d(r+1)');  % concatenazione di stringhe
    indNZ = find( p );
    i = i+1;
end

% Prima di uscire, rimuove il punto radice dove non c'e' parte frazionaria
[STR{ strcmp( STR, '.' ) }] = deal( [] );

end