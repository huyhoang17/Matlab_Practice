function [P, k] = newton_nonlinear_2(fun1, fun2, x0, y0, esp, kmax)
% PHUONG PHAP NEWTON GIAI HE PHUONG TRINH PHI TUYEN 2 CHIEU
% fun1, fun2: 2 ham ban dau
% x0, y0: 2 diem khoi tao ban dau
% esp: sai so tuong doi
% kmax: so buoc lap toi da

% INPUT
%   fun1 = @(x, y) x^2 + y^2 - 10
%   fun2 = @(x, y)  2*x + y - 1
%   newton_nonlinear_2(fun1, fun2, 1, 1, 1e-5, 100)
%   Output: P = [-1 3], k = 8

if nargin < 6
    kmax = 100;
end

syms x y;
P = [x0; y0];
n = length(P);
saiso = 1;
k = 1;

JAB_sample = [
    diff(fun1, x) diff(fun1, y);
    diff(fun2, x) diff(fun2, y)
];
JAB = zeros(n);

while (saiso > esp) && (k < kmax)
    F = [
        fun1(P(1), P(2));
        fun2(P(1), P(2))
    ];
    for i = 1:n
        for j = 1:n
            JAB(i, j) = subs(JAB_sample(i, j), [x y], [P(1) P(2)]);
        end
    end
    deltaP = -inv(JAB) * F;
    P = P + deltaP;
    saiso = max(abs(F));
    k = k + 1;
end
end

