function lorenz(sigma, rho, beta)
% PHUONG PHAP RK4 GIAI HE PHUONG TRINH LORENZ
%   sigma = 10;
%   beta = 8/3;
%   rho = 28;

% INPUT
%   lorenz_demo(10, 13, 8/3);
%   lorenz_demo(10, 14, 8/3);
%   lorenz_demo(10, 15, 8/3);
%   lorenz_demo(10, 28, 8/3);

fun1 = @(t, x, y, z) sigma * ( y - x);
fun2 = @(t, x, y, z) rho * x - y - x*z;
fun3 = @(t, x, y, z) x * y - beta * z;
[x, y, z] = RK4_3PT(fun1, fun2, fun3, 0, 100, 1, 1, 1, 0.001); 

plot3(x, y, z);
end