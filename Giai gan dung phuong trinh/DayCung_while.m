function [x,k] = DayCung_while(f, a, b, x0, err, kmax)
% f: ham so can xap xi
% (a,b): khoang phan ly
% err: dieu kien dung (sai so tuong doi)
% kmax: buoc lap toi da
% [x,k]: Nghiem xap xi + Buoc lap can thiet

% INPUT: 
%   fun = @(x)x^4-3*x^2+75*x-10000
%   DayCung_for(fun, -11, -10, -11, 1e-5, 100)

if nargin < 6
    kmax= 100;
end

if x0 == a
	d = b;
else 
	d = a;
end

% subs: Symbolic substitution
fa = subs(f,a);
fb = subs(f,b);
fd = subs(f,d);

k = 0;
if fa * fb>0
  disp('Khoang [a,b] khong co nghiem.');
elseif fa == 0
  x = a;
elseif fb == 0
  x = b;
else
  x = x0 - ((d - x0)/(fd - subs(f,x0)))*subs(f,x0);
  while ((abs((x - x0)/x0) > err) &&(k<kmax))
    x0 = x;
    x = x0 - ((d - x0)/(fd - subs(f,x0)))*subs(f,x0);
    k = k+1;
  end
end

x = double(x);
% disp(x);
end