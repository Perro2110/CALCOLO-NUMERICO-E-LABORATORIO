function [ STR ] = conv10toBETA( ALPHA, BETA, N )
%conv10toBETA - Conversione di numeri reali da base 10 a base BETA > 1. Vers. vettoriale
% Questa funzione usa l'algoritmo delle moltiplicazioni successive e l'algoritmo
% delle divisioni successive per la conversione di numeri reali da base 10 a
% base BETA > 1, con al piu' N posizioni frazionarie nella nuova base.
% VERSIONE VETTORIALE: accetta in input un array di numeri reali da convertire.
%
% SYNOPSIS
%   [STR] = conv10toBETA(ALPHA, BETA, N)
%
% INPUT
%   ALPHA (double array) - Array di numeri reali da convertire
%   BETA  (integer)      - Nuova base compresa tra 2 e 36 nella quale si vuole
%                          convertire i numeri in ALPHA
%   N     (integer)      - Numero massimo di cifre per la parte frazionaria 
%                          nella nuova base
%
% OUTPUT
%   STR   (cellstring)   - Cell array di stringhe che rappresentano i numeri 
%                          nel vettore ALPHA espressi nella nuova base BETA. Ha
%                          le stesse dimensioni dell'array ALPHA dato in input.

% controlli...

% DA FARE: gestione di NaN e Inf

sizeAlpha = size( ALPHA );
ALPHA = ALPHA(:);
segni = find( ALPHA < 0 );
ALPHA = abs(ALPHA);
if ( any(~ALPHA) )
    indNZ = find( ALPHA );
else
    indNZ = (1:numel(ALPHA))';
end
ALPHA_int = fix( ALPHA );
ALPHA_fraz = ALPHA - ALPHA_int;
STR = strcat( conv10toBETA_int_vec(ALPHA_int, BETA), ...
              conv10toBETA_fraz_vec(ALPHA_fraz, BETA, N)  );
STR(segni) = strcat( repmat('-', size(segni)), STR(segni) );

if ( sum( sizeAlpha > 1 ) > 1 )
    % Il cell array in ingresso non era solo una colonna: si ripristina di
    % conseguenza la stessa dimensione per l'array in uscita
    STR = reshape(STR, sizeAlpha);
end


end