function [x, y, z] = RK4_3PT(fun1, fun2, fun3, t0, tn, x0, y0, z0, h)
% PHUONG PHAP RK4 GIAI HE PHUONG TRINH VI PHAN 3 PHUONG TRINH
% xo -> to
% xn -> tn
% h: do chia

% INPUT
%   fun1 = @(t, x, y, z) sigma * ( y - x);
%   fun2 = @(t, x, y, z) rho * x - y - x*z;
%   fun3 = @(t, x, y, z) x * y - beta * z;
%   RK4_3PT(fun1, fun2, fun3, 0, 100, 1, 1, 1, 0.01)
%   or RK4_3PT('fun1', 'fun2', 'fun3', 0, 100, 1, 1, 1, 0.01)

if nargin < 9
    h = 0.01;
end
t = (t0:h:tn)';
n = length(t);
x = x0*ones(n, 1);
y = y0*ones(n, 1);
z = z0*ones(n, 1);

for i = 2:n
    
    k1 = h*feval(fun1, t(i-1), x(i-1), y(i-1), z(i-1));
    l1 = h*feval(fun2, t(i-1), x(i-1), y(i-1), z(i-1));
    h1 = h*feval(fun3, t(i-1), x(i-1), y(i-1), z(i-1));
    
    
    k2 = h*feval(fun1, t(i-1) + h/2, x(i-1) + k1/2, y(i-1) + l1/2, z(i-1) + h1/2);
    l2 = h*feval(fun2, t(i-1) + h/2, x(i-1) + k1/2, y(i-1) + l1/2, z(i-1) + h1/2);
    h2 = h*feval(fun3, t(i-1) + h/2, x(i-1) + k1/2, y(i-1) + l1/2, z(i-1) + h1/2);
    
    
    k3 = h*feval(fun1, t(i-1) + h/2, x(i-1) + k2/2, y(i-1) + l2/2, z(i-1) + h2/2);
    l3 = h*feval(fun2, t(i-1) + h/2, x(i-1) + k2/2, y(i-1) + l2/2, z(i-1) + h2/2);
    h3 = h*feval(fun3, t(i-1) + h/2, x(i-1) + k2/2, y(i-1) + l2/2, z(i-1) + h2/2);
    
    
    k4 = h*feval(fun1, t(i-1) + h, x(i-1) + k3/2, y(i-1) + l3/2, z(i-1) + h3/2);
    l4 = h*feval(fun2, t(i-1) + h, x(i-1) + k3/2, y(i-1) + l3/2, z(i-1) + h3/2);
    h4 = h*feval(fun3, t(i-1) + h, x(i-1) + k3/2, y(i-1) + l3/2, z(i-1) + h3/2);
    
    x(i) = x(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
    y(i) = y(i-1) + (l1 + 2*l2 + 2*l3 + l4)/6;
    z(i) = z(i-1) + (h1 + 2*h2 + 2*h3 + h4)/6;
end
end
