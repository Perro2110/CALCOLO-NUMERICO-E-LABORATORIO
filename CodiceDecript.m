% Leggi il contenuto del file
fileID = fopen('messaggioCifrato (3).txt', 'r');
content = fread(fileID, 'int16');
fclose(fileID);

% Estrai i valori di m, n e il messaggio trasformato
m = content(end-1);
n = content(end);

A = spdiags([-3*ones(m,1) 7*ones(m,1) -2*ones(m,1)],-1:1,m,m);
transformed_message = reshape(content(1:end-2),m,n);
transformed_message = double(transformed_message);
decoded_message = zeros(m,n);
[L, R, P, deter] = gauss2(A);

decoded_message(:,1:end) = A\transformed_message(:,1:end); %per non usare cicli

% for k=1:n
%     vettCol = transformed_message(:,k);
%     y = sollower(L,vettCol(P));
%     x = solupper(R,y);
%     decoded_message(:,k) = x;
% end

decoded_message = int16(decoded_message);
decoded_message = char(decoded_message(:))'

