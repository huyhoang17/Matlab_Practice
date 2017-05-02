function [x, y] = Euler(fun, x0, xn, y0, n)
% GIAI PT, HPT VP theo Euler
% giai phuong trinh vi phan y'=f(x,y) trong khoang [x0,xn] 
%		voi dieu kien y(x0)=y0 va So nguyen n
% fun: ham ve phai, hoac co the nhap tu 1 function `fun`
% x0: diem dau
% x1: diem cuoi
% y0: gia tri tai y(x0)
% n: do chia
% OUTPUT
%   cap vector [x y] voi moi x tuong ung se tuong ung voi y

% NOTE
%   dy/dx = diff(f(x)) = fun(x, y)
%   y(x0) = y0

% INPUT
%   fun = @(x,y) x*y/2
%   [x y] = Euler(fun , 0, 0.5, 1, 5)

% f = inline(fun);

f = fun;
x = linspace(x0, xn, n+1);
y = zeros(1, n+1);
y(1) = y0;
h = (xn-x0)/n;
for i = 1:n
    y(i+1) = y(i) + h*feval(f, x(i), y(i));
end
end