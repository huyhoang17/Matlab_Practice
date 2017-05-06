function lorenz_ode45(sigma, rho, beta)
% PHUONG PHAP RK4 GIAI HE PHUONG TRINH LORENZ DUNG HAM ODE45 CUA MATLAB
% LINKs: https://en.wikipedia.org/wiki/Lorenz_system
% sigma = 10;
% beta = 8/3;
% rho = 28;

% INPUT
%   lorenz_ode45(10, 13, 8/3);
%   lorenz_ode45(10, 14, 8/3);
%   lorenz_ode45(10, 15, 8/3);
%   lorenz_ode45(10, 28, 8/3);

f = @(t,a) [-sigma*a(1) + sigma*a(2); rho*a(1) - a(2) - a(1)*a(3); -beta*a(3) + a(1)*a(2)];
%'f' is the set of differential equations and 'a' is an array containing values of x,y, and z variables.
%'t' is the time variable
[~, a] = ode45(f,[0 100],[1 1 1]);%'ode45' uses adaptive Runge-Kutta method of 4th and 5th order to solve differential equations
plot3(a(:,1),a(:,2),a(:,3)) %'plot3' is the command to make 3D pl

end

