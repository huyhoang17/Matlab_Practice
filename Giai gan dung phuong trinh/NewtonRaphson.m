function x = NewtonRaphson(f, x0, tol, kmax)
% GIAI GAN DUNG PHUONG TRINH
% f : ham can tinh xap xi
% x0: diem xuat phat
% tol: dieu kien dung cua |x_n - x_n-1|
% kmax: buoc lap toi da

% ALGO:
%   1. Cho x0
%   2. Tinh deltaX = -f(x) / f'(x)
%   3. x = x + deltaX
%   4. --> abs(deltaX) < tol --> STOP

% INPUT:
%   fun = x^4 - 3*x^2 + 75*x - 10000
%   diff(fun) --> 4*x^3 - 6*x + 75
%   NewtonRaphson(fun, -11, 1e-5, 100)


df = diff(f);
% for k = 1:kmax
%     dx = -subs(f,x0)/subs(df,x0);
%     x = x0 + dx;
%     x0 = x;
%     if abs(dx) < tol
%         x = x0; 
%         break
%     end
% end

dx = -subs(f, x0) / subs(df, x0);
k = 1;
while abs(dx) > tol && k < kmax
    dx = -subs(f, x0) / subs(df, x0);
    x = x0 + dx;
    x0 = x;
    k = k + 1;
end
% fprintf('Nghiem cua phuong trinh: %.3f', x);
x = double(x);
end



