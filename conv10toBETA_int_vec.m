function [STR] = conv10toBETA_int_vec(ALPHA, BETA)
%conv10toBETA_int_vec - Conversione intera da base 10 a base BETA > 1. Vers. vettoriale
% Questa funzione implementa l'algoritmo delle divisioni successive per
% la conversione di numeri interi positivi da base 10 a base BETA.
% VERSIONE VETTORIALE: accetta in input un vettore di interi da convertire.
%
% SYNOPSIS
%   [STR] = conv10toBETA_int_vec(ALPHA, BETA)
%
% INPUT
%   ALPHA (integer array) - Vettore di numeri interi positivi in base 10 da convertire
%   BETA  (integer)       - Nuova base, compresa tra 2 e 36
%
% OUTPUT
%   STR   (string cell)  - Cell array di stringhe che rappresentano i numeri interi nel
%                          vettore ALPHA espressi nella nuova base BETA

% E' opportuno inserire controlli sull'input...
if ( any(~isnumeric(ALPHA)) || any(ALPHA ~= fix(ALPHA)) || any(ALPHA < 0) )
    error('I numeri da convertire devono essere numeri interi positivi');
end
if ( ~isnumeric(BETA) || (BETA ~= fix(BETA)) ...
     || (BETA < 2) || (BETA > 36) )
    error('BETA deve essere un numero intero positivo fra 2 e 36');
end

% DA FARE: gestione di NaN e Inf

% cifre ammissibili per la nuova base BETA compresa tra 2 e 36
d = char( [double('0'):double('9'), double('A'):double('Z')] );

% algoritmo delle divisioni successive: versione vettoriale

q = ALPHA; D = zeros(size(q)); r = D;
STR = cellstr( repmat(' ', size(ALPHA)) );
indNZ = find( q ); % equivalente a find( q ~= 0 )
while ( ~isempty(indNZ) )
  D = fix( q(indNZ) / BETA);  % divisione intera
  r = q(indNZ) - D*BETA;      % resto della divisione intera
  q(indNZ) = D;               % quoziente intero
  STR(indNZ) = strcat(d(r+1)', STR(indNZ) ); % concatenazione di stringhe
  indNZ = find( q );
end

% Prima di uscire, inserisce '0' dove non c'e' parte intera
[STR{ strcmp( STR, '' ) }] = deal( '0' );

end