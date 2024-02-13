close all ; clear all; clc

a = -3; b = -a ; N = 200;
x = linspace (a , b , N);
param = [ a ; b ; N ];

for k = 1 : 0.25 : 10
    y = esercizio2 ( param , k ) ;
    ph = plot ( x , y) ;
    ylim ([ -12 , 12]) ;
    xlim ([-12,12])
    pause (0.1) ;
end
