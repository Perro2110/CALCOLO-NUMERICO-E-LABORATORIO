function [outputArg1] = esercizio2(VetABN,k)
%
%
a=VetABN(1)
b=VetABN(2)
N=VetABN(3)
xx=linspace(a,b,N)
f = @(x) (((1+k).*sin(k*(1-3.*x))).*exp(-x.^2))
outputArg1=f(xx)
end