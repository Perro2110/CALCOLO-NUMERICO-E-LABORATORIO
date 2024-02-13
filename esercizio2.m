function [outputArg1] = esercizio2(VetABN,k)
%
%
if (length(VetABN) ~= 3)
    warning ("errore dimensione vet ") ;
return
end

if (k <1)
    warning ("valore di k non consono") ;
    return
end

if (k > 10)
    warning ("valore di k non consono") ;
    return
end

a=VetABN(1)
b=VetABN(2)
N=VetABN(3)
xx=linspace(a,b,N)
f = @(x) (((1+k).*sin(k*(1-3.*x))).*exp(-x.^2))
outputArg1=f(xx)
end