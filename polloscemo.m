function [x,temp] = polloscemo(alfa,n)
tic()
k=0;
x=0;
for k = 0 : n
    if(mod(k,2) == 0)
        %pari
        x=x+sin(k*alfa);
    end
    if(mod(k,2)~=0)
        %disp
        x=x+cos(k*alfa);
    end
end
temp=toc()
end