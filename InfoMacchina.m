function [] = InfoMacchina()

u = 1;
while (1 + u ~= 1)
u = u/2;
end
u = u*2;
fprintf("\nOrdine della precisione di macchina = %g", u);
b = 1;
while (b + u ~= b)
b = b + 1;
end
fprintf("\nBase = %g ", b);
u = 1;
while (1 + u ~= 1)
u = u/b;
end
u1 = u;
u = u*b;
if (1 + u) - u1 > 1
u = u/2;
fprintf("\nArrotondamento");
t = 1 - log10(2*u) / log10(b);
else
fprintf("\nTroncamento");
t = 1 - log10(u) / log10(b);
end
fprintf("\nPrecisione di macchina = %24.16e", u);
fprintf("\nNumero di bit per la mantissa = %g\n", t);
end