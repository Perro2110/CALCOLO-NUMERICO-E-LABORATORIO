clc
clear all 
close all
format short
%% per parte teorica
f=@(x) exp(-x)
fp=diff(sym(f))
fs=diff(sym(fp))
fplot(fs,[0,1])
f(0)
f(0.0894)
f(0.1789)
%% parte matlab
clc
clear all
close all
% (M) (4 punti) Usando come nodi gli zeri di un opportuno polinomio di Chebyshev, realizzare un M-script che,
% usando la function tabDiff in allegato, determina il polinomio di interpolazione nella forma di Newton della
% funzione g(x) = e−x/2
% relativo a tali nodi nell’intervallo [0, 2], in modo tale che l’errore sia inferiore a 10−5
% Costruire il grafico del polinomio di Newton ottenuto e, nella stesa figura, mostrare il grafico della funzione
% g(x). In una seconda finestra grafica, mostrare il grafico del modulo dell’errore di interpolazione nello stesso
% intervallo.

f=@(x) exp(-x/2)
a=0
b=2
toll = 1e-5
n=0
r=10000000
g=1

while r > toll
    g=g/2
    r=(2*(g)/ factorial(n+1))*((b-a)/4)^(n+1)
    n=n+1
end

grado=n
nodi=n+1;
z=((b-a)/2) * (cos( (2*[0:n]+1)/(2*nodi)*pi)) + ((a+b)/2)
z=sort(z)
[d] = tabDiff(z, f(z))
p=@(k) (d(end))
for it=numel(z)-1:-1:1
    p=@(k) p(k).*(k-z(it))+d(it)
end
hold on
fplot(p,[a,b])
plot(linspace(a,b,201),f(linspace(a,b,201)))





