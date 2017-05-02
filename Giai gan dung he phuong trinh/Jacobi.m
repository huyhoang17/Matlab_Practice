function [x, k] = Jacobi(A, b, x0, err, kmax)
% GIAI GAN DUNG HE PHUONG TRINH
% giai he phuong trinh Ax=b voi A la ma tran cheo troi, vector cot b
% x0: gia tri ban dau theo cot
% err: sai so cho phep
% kmax: so buoc lap toi da
% output [x,k]: nghiem va so buoc lap
% Vong lap: x^{k+1} = b/A[i,i]+(-A/A[i,i]+I)*x^{k} 

% INPUT
%   A, B, x0 tu file
%	Jacobi(A, B, x0, 1e-5, 100)

if kiemtracheotroi(A)~=1
    disp('Ma tran khong cheo troi!');
    return;
end

% tinh chuan vo cung, cuc dai theo dong
% max(symsum(abs(a_ij))), 1 <= j <= n và i = 1..m
% https://phvu.net/2010/12/07/matrix-norm/
n = length(A);
for i = 1:n
  b(i) = b(i) / A(i,i);
  A(i, :) = A(i,:) / A(i,i);
  q = norm(eye(n) - A,inf);
end  
% --> khi do, he tren co dang: x = Ax + b

x = zeros(n, 1);
for k = 1:kmax   
  x(1) = b(1) - A(1, 2:n) * x0(2:n); 
  for i = 2:n-1
    x(i) = b(i) - A(i, 1:i-1) * x0(1:i-1) - A(i, i+1:n) * x0(i+1:n); 
  end
  x(n) = b(n) - A(n, 1:n-1) * x0(1:n-1);     
  if max(abs(x - x0)) < err*(1-q)/q  % sai so tuong doi: x_k vs x_k+1
    break;
  else
    x0 = x;
  end
end  
end