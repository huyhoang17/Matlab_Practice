function [x, y] = RK3_v2(fun, x0, xn, y0, n)
% giai phuong trinh vi phan y'=fun(x,y) trong khoang [x0,xn] 
%		voi dieu kien y(x0)=y0 va So nguyen n
% fun: ham ve phai, hoac co the nhap tu 1 function `fun`
% x0: diem dau
% x1: diem cuoi
% y0: gia tri ban dau tai y(x0)
% n: do chia
% OUTPUT
%   cap vector [x y] voi moi x tuong ung se tuong ung voi y

% NOTE
%   dy/dx = diff(f(x)) = fun(x, y)
%   y(x0) = y0

% INPUT
%   fun = @(x, y) x + y 
%   [x, y] = RK3_v2(fun, 0, 0.5, 1, 6)
%   or RK3_v2('fun', 0, 0.5, 1, 6) neu truyen tu file .m

% f=inline(fun);

f = fun;
x = linspace(x0, xn, n+1);
y = zeros(1, n+1);
y(1) = y0;
h = (xn-x0)/n;
for i = 1:n
    k1 = feval(f, x(i), y(i));
    k2 = feval(f, x(i)+h/2, y(i)+k1/2);
    k3 = feval(f, x(i)+h, y(i)-k1+2*k2);
    y(i+1) = y(i) + h*(k1+4*k2+k3)/6;
end
end