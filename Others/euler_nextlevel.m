function [T,Y] = euler_nextlevel(fun,t0,tn,y0,h)
    syms t y;
    Y(1) = y0;
    T(1) = t0;
    i = 1;
    while T(i) <= tn
        i = i+1;
        T(i) = T(i-1) + h; % xi = x(i-1) + h
        z = Y(i-1) + h*subs(fun,[t y],[T(i-1) Y(i-1)]); %z = y_(i-1) +h*(f(x_(i-1),y_(i-1)) )
        Y(i) = Y(i-1) +h/2*(subs(fun,[t y],[T(i-1) Y(i-1)]) + subs(fun,[t y],[T(i),z]));
        % y_(i) = y_(i-1) + h/2(f(x_(i-1),y_(i-1) + f(x_i,z)));
    end
end