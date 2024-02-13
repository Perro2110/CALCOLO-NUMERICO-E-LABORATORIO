%% es 5
clc
clear 
clear all
format short

f=@(x) (log(x+5)-1).*cos(x) 
nodi=[-4.5;-3.5;-2.5]
f(nodi)
a=-4.5
b=-2.5
n=5


t0=cos( ((2*0)+1)/(2*(n+1)) * pi)
t1=cos( ((2*1)+1)/(2*(n+1)) * pi)
t2=cos( ((2*2)+1)/(2*(n+1)) * pi)
t3=cos( ((2*3)+1)/(2*(n+1)) * pi)
t4=cos( ((2*4)+1)/(2*(n+1)) * pi)
t5=cos( ((2*5)+1)/(2*(n+1)) * pi)

z0=(b-a)/2 *t0 + (a+b)/2
p(1)=f(z0)

z1=(b-a)/2 *t1 + (a+b)/2
p(2)=f(z1)

z2=(b-a)/2 *t2 + (a+b)/2
p(3)=f(z2)

z3=(b-a)/2 *t3 + (a+b)/2
p(4)=f(z3)

z4=(b-a)/2 *t4 + (a+b)/2
p(5)=f(z4)
z5=(b-a)/2 *t5 + (a+b)/2
p(6)=f(z5)

%% es matlab

clear all 
clear 
clc

% 2) (M) (3 punti) Costruire una M-script che generi un numero N ≥ 5 di punti casuali xj , j = 1, . . . , N, nell’intervallo
% [a, b] del punto precedente, campionando da una distribuzione uniforme. Lo script calcoli poi i valori yj , j =
% 1, . . . , N, della funzione f(x) in tali punti di campionamento e costruisca esplicitamente il sistema delle equazioni
% normali per il polinomio algebrico q
% ∗
% 2
% (x), di grado al più 2, di migliore approssimazione di tali dati {(xj , yj )}j=1,...,N
% nel senso dei minimi quadrati. Lo script determini i coefficienti di tale polinomio, controlli i risultati con l’opportuna
% funzione predefinita di Matlab e disegni in un’unica finestra grafica la funzione f(x), i punti (xj , yj ), j = 1, . . . , N,
% e il polinomio q
% ∗
% 2
% (x), etichettando opportunamente gli assi. 


N=10
n=2
a=-4.5
b=-2.5

f=@(x) (log(x+5)-1).*cos(x) 
xx = rand(N,1).*(b-a)+a
yy=f(xx)
A=[xx.^(n:-1:0)]

V=A'*A
Vy=A'*yy
p=V\Vy
pp = polyfit(xx,yy,n)
disp("aaaaaaaaaaaaaaaaaaaaa")
disp(max(abs(pp'-p)))
hold on
fplot(@(x)(polyval(p,x)),[a,b])
plot(xx,yy,"r+",linspace(a,b,100),f(linspace(a,b,100)))
legend("polinomio regressione","punti","funzione")
xlabel("asse x")
ylabel("asse y")







