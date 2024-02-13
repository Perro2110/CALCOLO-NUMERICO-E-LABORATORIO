% Cognome Nome
% Matricola
close all
clear all
% ----------------------------
% esercizio 3 - 26/01/2018
% ----------------------------
disp ("Esercizio 3") ;
%
% prima parte
%
A = [1 3 -1; 1 2 0.5; 5 10 -1];
b = [ -2 0.5 -1]';
[L , R , p ] = gauss2 ( A ) ;
x1 = solupper ( R , sollower (L , b ( p )) )
% Si puo ’ anche scrivere , equivalentemente :
% y1 = sollower (L, b(p));
% x1 = solupper (R, y1)
fprintf ('\nNorma residuo normalizzato = %g\n\n',norm ( b - A * x1 , inf ) / norm (b , inf ) ) ;
[ L1 , R1 , P1 ] = lu( A ) ;
disp ('[L1 , U1 , P1] = lu(A)')
fprintf ( '\nmax ( | L - L1 | ) = %g', max ( abs ( L (:) - L1 (:) ) ) ) ;
fprintf ( '\nmax ( | R - R1 | ) = %g', max ( abs ( R (:) - R1 (:) ) ) ) ;

%
% seconda parte
%
n = 30;
normInfSol = zeros (n ,1) ; normInfSol (1) = norm ( x1 , inf ) ;
c = b (p ) ; p2 = p (2) ;
for k = 2 : n
c ( p2 ) = 0.5 * c ( p2 ) ;
normInfSol ( k ) = norm ( R \ ( L \ c ) , inf ) ;
end
plot ( normInfSol ,'bo ') ;