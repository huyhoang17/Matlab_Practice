function [P, k] = newton_nonlinear_3(fun1, fun2, fun3, x0, y0, z0, esp, kmax)
% PHUONG PHAP NEWTON GIAI HE PHUONG TRINH PHI TUYEN 3 CHIEU
% fun1, fun2, fun3: 3 ham ban dau
% x0, y0, zo: 3 diem khoi tao ban dau
% esp: sai so tuong doi
% kmax: so buoc lap toi da

% INPUT
%   fun1 = @(x, y, z) x^2 - y^2 + z^2-11
%   fun2 = @(x, y, z) x*y + y^2 - 3*z-3
%   fun3 = @(x, y, z) x - x*z + y*z - 6
%   newton_nonlinear_3(fun1, fun2, fun3, 1, 1, 1, 1e-5, 100)
%   Output: P = [2 3 4], k = 8

if nargin < 8
    kmax = 100;
end

syms x y z;
P = [x0; y0; z0];
n = length(P);
saiso = 1;
k = 1;

JAB_sample = [
    diff(fun1, x) diff(fun1, y) diff(fun1, z);
    diff(fun2, x) diff(fun2, y) diff(fun2, z);
    diff(fun3, x) diff(fun3, y) diff(fun3, z)
];
JAB = zeros(n);

while (saiso > esp) && (k < kmax)
    F = [
        fun1(P(1), P(2), P(3));
        fun2(P(1), P(2), P(3));
        fun3(P(1), P(2), P(3))
    ];
    for i = 1:n
        for j = 1:n
            JAB(i, j) = subs(JAB_sample(i, j), [x y z], [P(1) P(2) P(3)]);
        end
    end
    deltaP = -inv(JAB) * F;
    P = P + deltaP;
    saiso = max(abs(F));
    k = k + 1;
end
end

