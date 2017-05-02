function [x,k] = Jacobi2(A,b,x0,err,kmax)
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

for i = 1:length(A)
    b(i) = b(i) / A(i,i);
    A(i,:) = A(i,:) / A(i,i);
end

B = eye(length(A)) - A;
g = b;
q = norm(B, inf);
x = B*x0 + g;
k = 1;
while (norm((x - x0), inf) > ((1-q)*err)/q)&&(k<kmax)
    x0 = x;
    x  = B*x0 + g;
    k  = k + 1;
end

    
    