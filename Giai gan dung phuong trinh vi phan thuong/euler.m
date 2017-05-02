function [x, y] = euler(fun, x0, xn, y0, h)
% GIAI PT, HPT VP theo Euler
% fun: ham ve phai, hoac co the nhap tu 1 function `fun`
% x0: diem dau
% x1: diem cuoi
% y0: gia tri tai y(x0)
% h: buoc chia

% NOTE
%   dy/dx = fun1(x, y)
%   x0 <= x <= xn
%   y(x0) = y0

% INPUT
%   fun = @(x, y) y - (2*x)/y
%   euler(fun, 0, 0.5, 1, 0.1)

if nargin < 5
    h = 0.01;
end

if nargin < 4
    error('vui long nhap dung input');
end

x = (x0:h:xn)';
n = length(x);
y = y0*ones(n,1);
for i = 2:n
    y(i) = y(i-1) + h*feval(fun, x(i-1), y(i-1));
end

% plot(x,y);
end

