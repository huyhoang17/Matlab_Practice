function [x,k]=DayCung_for(f,a,b,x0,err,kmax)
% fun: ham so can xap xi
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

% f=inline(fun);

% truyen @ tu terminal hoac truyen tu ham
% feval: bieu thuc ham, a theo f
% argument: phai la string hoac function_handle
fa = feval(f,a);
fb = feval(f,b);    
fd = feval(f,d);    
 
if fa * fb > 0
    disp('(a,b) khong la khoang phan ly nghiem!');
elseif fa == 0
  x = a;
elseif fb == 0
  x = b;    
else
    for k = 1:kmax
        x = x0;
        x0 = x0-(d-x0)*feval(f,x0)/(fd-feval(f,x0));
        if abs(x-x0) < err
            x=x0;
            break;
        end
    end
end
end