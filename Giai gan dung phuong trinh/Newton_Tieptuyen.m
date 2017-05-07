function [x, k] = Newton_Tieptuyen(fun, m1, M2, x0, esp, kmax)
% PHUONG PHAP NEWTON TIEP TUYEN GIAI GAN DUNG PHUONG TRINH
% fun: ham ve trai
% m1: can duoi
% M2: can tren
% x0: diem xuat phat
% esp: sai so tuong doi
% kmax: so phep lap toi da
% [x, n]: nghiem bai toan, so vong lap can thiet

% INPUT
%   fun = @(x) x^4 - 3*x^2 + 75*x - 10000
%   truyen theo symbolic expression: 
%       fun = x^4 - 3*x^2 + 75*x - 10000
%   Newton_Tieptuyen(fun, dfun, -11, -10, -11, 1e-5, 1000)

if nargin < 6
    kmax = 1e+3;
end
if nargin < 5
    esp = 1e-5;
end

syms a;
fun2 = sym(fun);  % chuyen tu function-handle sang symbolic expression
dfun = diff(fun2);
delta = sqrt(2*m1*esp/M2);
k = 1;
x = x0 - subs(fun, x0)/subs(dfun, x0);

while (abs(x-x0) >= delta) && (k < kmax)
    x0 = x;
    x = x0 - subs(fun, x0)/subs(dfun, x0);
    k = k + 1;
end

% format qua dai nen chuyen x sang kieu `double`
x = double(x);

end

