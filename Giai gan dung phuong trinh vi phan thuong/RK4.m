function [x, y] = RK4(fun, x0, xn, y0, h)
% GIAI PT, HPT VP theo RK4
% fun: ham ve phai, hoac co the nhap tu 1 function `fun`
% x0: diem dau
% x1: diem cuoi
% y0: gia tri ban dau tai y(x0)
% h: buoc chia

% NOTE
%   dy/dx = diff(f(x)) = fun(x, y)
%   y(x0) = y0

% INPUT
%   fun = @(x, y) x + y 
%   RK4(fun, 0, 0.5, 1, 0.01)
%   or RK4('fun', 0, 0.5, 1, 0.1) neu truyen tu file .m

if nargin < 5
    h = 0.01;
end

x = (x0:h:xn)';
n = length(x);
y = y0 * ones(n,1);

for i=2:n
    k1 = h*feval(fun, x(i-1), y(i-1));
    k2 = h*feval(fun, x(i-1) + h/2, y(i-1) + k1/2);
    k3 = h*feval(fun, x(i-1) + h/2, y(i-1) + k2/2);
    k4 = h*feval(fun, x(i-1) + h, y(i-1) + k3);
    y(i) = y(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
% plot(x,y);

% USING: dsolve
% syms y(t) t
% eqn = y(t) == 2 * exp(t) - t - 1
% dsolve(eqn)
% OR
% syms y(t) z(t)
% eqns = [diff(y,t)==z, diff(z,t)==-y];
% sol = dsolve(eqns)

end