function [T,Y,Z] = RK4_NextLevel(f,g,t0,tn,y0,z0,h)
% T la vector diem cua x
% Y la vector diem cua y
% Z la vector diem cua z
% f la ham dy = f(x,y,z)
% g la ham dz = g(x,y,z)
% z0 la z(0)
% y0 la y(o)
% h la khoang cac giua cac xi
    syms x y z;
    T(0) = t0;
    Y(0) = y0;
    Z(0) = z0;
    i = 0;
    while T(i) < T(n)
          i = i + 1;
          T(i) = T(i-1) + h;
          k1 = h * subs(f,[x y z],[T(i-1) Y(i-1) Z(i-1)]);
          l1 = h * subs(g,[x y z],[T(i-1) Y(i-1) Z(i-1)]);
          k2 = h * subs(f,[x y z],[(T(i-1)+h/2) (Y(i-1)+k1/2) (Z(i-1)+l1/2)]);
          l2 = h * subs(g,[x y z],[(T(i-1)+h/2) (Y(i-1)+k1/2) (Z(i-1)+l1/2)]);
          k3 = h * subs(f,[x y z],[(T(i-1)+h/2) (Y(i-1)+k2/2) (Z(i-1)+l2/2)]);
          l3 = h * subs(g,[x y z],[(T(i-1)+h/2) (Y(i-1)+k2/2) (Z(i-1)+l2/2)]);
          k4 = h * subs(f,[x y z],[(T(i-1)+h) (Y(i-1)+k3) (Z(i-1)+l3)]);
          l4 = h * subs(g,[x y z],[(T(i-1)+h) (Y(i-1)+k3) (Z(i-1)+l3)]);
          Y(i) = Y(i-1) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
          Z(i) = Z(i-1) + 1/6*(l1 + 2*l2 + 2*l3 + l4);
    end
end
    
