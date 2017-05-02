function [T,Y] = RK4(fun,t0,tn,y0,h)
% function [T,Y] = RK4(fun,t0,tn,y0,n)
syms t y;
T(1) = t0;
Y(1) = y0;
i=1;
while T(i) < tn
    i = i + 1;
    T(i) = T(i-1) + h;
    k1 = h*subs(fun,[t y],[T(i-1) Y(i-1)]);
    k2 = h*subs(fun,[t y],[(T(i-1)+h/2) (Y(i-1)+k1/2)]);
    k3 = h*subs(fun,[t y],[(T(i-1)+h/2) (Y(i-1)+k2/2)]);
    k4 = h*subs(fun,[t y],[(T(i-1)+h) (Y(i-1)+k3)]);
    Y(i) = Y(i-1) +1/6*(k1 + 2*k2 + 2*k3 + k4);
end

% h = t(tn-to)/n;
% for i=1:n+1
%     T(i) = T(i-1) + h;
%     k1 = h*subs(fun,[t y],[T(i-1) Y(i-1)]);
%     k2 = h*subs(fun,[t y],[(T(i-1)+h/2) (Y(i-1)+k1/2)]);
%     k3 = h*subs(fun,[t y],[(T(i-1)+h/2) (Y(i-1)+k2/2)]);
%     k4 = h*subs(fun,[t y],[(T(i-1)+h) (Y(i-1)+k3)]);
%     Y(i) = Y(i-1) +1/6*(k1 + 2*k2 + 2*k3 + k4);
end