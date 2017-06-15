function P = NewtonTien(a, b)
% PHEP NOI SUY VA XAP XI HAM
% a: vecto moc noi suy
% b: gia tri tuong ung tai cac moc noi suy
% P: da thuc noi suy

% INPUT
%   a = [1 2 3 4 7]
%   b = [17 17.5 76 210.5 1970]
%   Lagrange(a, b)
syms x;
if length(a) ~= length(b)
	disp('Dau vao khong phu hop !!!');
else
   n=length(a);
   f=zeros(n,n);
   f(:,1)=b;
   for i=2:n
      for j=2:n
         if j<=i
            f(i,j)=(f(i,j-1)-f(i-1,j-1))/(a(i)-a(i-j+1)); 
         end
      end
   end
   P=0;
   k=1;
   % Thuc hien bang sai phan
   % f(i, i) la cac he so C0, C1, C2, ...Cn
   % k la phuong trinh theo x, vi du
   % phi1(x) = (x - x0) / h;
   % phi2(x) = (x - x0) * (x - x1) / (h^2 * 2!)
   % phin(x) = (x - x0) * ... * (x - x_n-1) / (h^n * n!)
   for i=1:n
       P=P+f(i,i)*k;
       k=(x-a(i))*k;
   end
end

% expand: don gian bieu thuc
P = expand(P);
end