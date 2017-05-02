function [x,y,z] = RK4_xyz(fun1,fun2,x0,xn,y0,z0,h)
% GIAI PT, HPT VP theo RK4
% fun1, fun2: ham ve phai, hoac co the nhap tu 1 function `fun`
% x0: diem dau
% xn: diem cuoi
% y0: gia tri tai y(x0)
% z0: gia tri tai z(x0)
% h: buoc chia

% NOTE
%   dy/dx = fun1(x, y, z)
%   dz/dx = fun2(x, y, z)
%   y(x0) = y0
%   z(x0) = z0

% INPUT
%   fun1 = @(x, y, z) z
%   fun2 = @(x, y, z) -x*z - y
%   RK4_xyz(fun1, fun2, 0, 0.5, 0, 1, 0.1)
%   or RK4_xyz('fun1', 'fun2', 0, 0.5, 0, 1, 0.1)

% fun1 = @(x, y, z) ((23*x - y -x*z) / (10 * (y - x)))
% fun2 = @(x, y, z) ((x*y - 8/3*z) / (10 * (y - x)))

if nargin < 7
    h = 0.01;
end
x = (x0:h:xn)';
n = length(x);
y = y0*ones(n,1);
z = z0*ones(n,1);

for i = 2:n
    k1 = h*feval(fun1, x(i-1), y(i-1), z(i-1));
    l1 = h*feval(fun2, x(i-1), y(i-1), z(i-1));
    k2 = h*feval(fun1, x(i-1) + h/2, y(i-1) + k1/2, z(i-1) + l1/2);
    l2 = h*feval(fun2, x(i-1) + h/2, y(i-1) + k1/2, z(i-1) + l1/2);
    k3 = h*feval(fun1, x(i-1) + h/2, y(i-1) + k2/2, z(i-1) + l2/2);
    l3 = h*feval(fun2, x(i-1) + h/2, y(i-1) + k2/2, z(i-1) + l2/2);
    k4 = h*feval(fun1, x(i-1) + h, y(i-1) + k3, z(i-1) + l3);
    l4 = h*feval(fun2, x(i-1) + h, y(i-1) + k3, z(i-1) + l3);
    y(i) = y(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
    z(i) = z(i-1) + (l1 + 2*l2 + 2*l3 + l4)/6;
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