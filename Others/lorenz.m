function lorenz()
sigma=10;
beta=8/3;
rho=28;
f = @(t,a) [-sigma*a(1) + sigma*a(2); rho*a(1) - a(2) - a(1)*a(3); -beta*a(3) + a(1)*a(2)];
[t,a] = ode45(f,[0 100],[1 1 1]); %'ode45' uses adaptive Runge-Kutta method of 4th and 5th order to solve differential equations
%plot(a(:,1),'--r');
%hold on;
%plot(a(:,2),'*b');
%plot(a(:,3),':g');
plot3(a(:,1),a(:,2),a(:,3));
end