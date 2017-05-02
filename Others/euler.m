function [T,Y] = euler(fun,t0,tn,y0,h)
% function [T,Y] = euler(fun,t0,tn,y0,n)
    syms t y;
    Y(1) = y0;
    T(1) = t0;
    i = 1;
    while T(i) <= tn
        i = i+1;
        T(i) = T(i-1) + h;
        Y(i) = Y(i-1) + h*subs(fun,[t y],[T(i-1) Y(i-1)]);
    end
    
%     h = (tn-t0)/h;
%     for i=2:n+1
%         T(i) = T(i-1) + h;
%         Y(i) = Y(i-1) + h*subs(fun,[t y],[T(i-1) Y(i-1)]);
%     end
end