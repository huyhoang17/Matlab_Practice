function [T,Y] = RK3(fun,t0,tn,y0,h)
syms t y;
T(1) = t0;
Y(1) = y0;
i=1;
while T(i) < tn
    i = i+ 1;
    T(i) = T(i-1) + h;
    k1=h*subs(fun,[t y],[T(i-1) Y(i-1)]);
    k2=h*subs(fun,[t y],[(T(i-1)+h/2) (Y(i-1)+k1/2)]);
    k3=h*subs(fun,[t y],[(T(i-1)+h) (Y(i-1)-k1+2*k2)]);
    Y(i)=Y(i-1)+(k1+4*k2+k3)/6;
end
end