function [rango,determinante,normainfinito] = miaDiade(r,s)
if isempty(r) ~= 0 | isempty(s) ~= 0
    disp("Almeno uno dei due vettori è vuoto!!")
else
    r = r (:);
    s= s(:);
    diade=r*s';
    size(diade)
    [Q,R] = qr(diade)
    DiagR=diag(R)
    rango=numel( find(abs(DiagR)> eps*(norm(diade,inf))) );
    determinante=det(Q)*det(R);
    normainfinito=norm(diade,"inf");
end
end