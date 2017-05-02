function P = Lagrange(a,b)
% NOI SUY VA XAP XI HAM
% a, b: vecto moc noi suy va cac gia tri ham so tuong ung
% P: da thuc noi suy

% INPUT
%   a = [1 2 3 4 7]
%   b = [17 17.5 76 210.5 1970]
%   Lagrange(a, b)

syms x;
n = length(a);
if length(a) ~= length(b)
    disp('Dieu kien dau vao khong phu hop !!');
else
   P = 0;
   for i = 1:n
       L = 1;
       for j = 1:n
           if j ~= i
                L = L * (x-a(j)) / (a(i)-a(j)); 
           end
       end
       P = P + b(i)*L;
   end
end

% from
% 19*(x/2 - 1/2)*(x - 2)*(x - 4)*(x - 7) - ......
% to 
% 2*x^4 - 17*x^3 + 81*x^2 - (307*x)/2 + 209/2
% expand: Expand an expression: don gian bieu thuc
P = expand(P);  

end