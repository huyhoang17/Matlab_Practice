%Vi du test [a,b] = [0,1] N=M=10, T = 1
% f = @(x,t) x^2-x-2*t
% gx = @(x) 2
% ga = @(t) 2
% gb = @(t) 2
% uxt = @(x,t) (x^2-x)*t+2
function [v,u,epsi, epsimax] = GiaiPTTruyenNhiet( f, gx, ga, gb, a, b, N, T, M , uxt)
% giai phuong trinh truyen nhiet 1 chieu bang phuong phap sai phan an
%input  f: Lu
%       gx: u(x,0) dieu ban dau
%       ga: u(a,t), gb: u(b,t) dieu kien bien
%       uxt: nghiem dung cua bai toan
%   Luoi sai phan: 
%       [a,b] khoang nghiem
%       N khoang chia nghiem
%       T khoang thoi gian
%       M chia khoang thoi gian
%ouput  v: nghiem gan dung cua pt
%       u: nghiem dung
%       epsi: sai so tuyet doi
to = T/M;
h = (b-a)/N;

x = zeros(N+1,1);
t = zeros(M+1,1);
% tinh xi theo khong gian
x(1) = a;
for i=1:N
    x(i+1) = a + i*h;
end
% tinh tj theo thoi gian
for j=1:M
    t(j+1) = j*to;
end
% tinh v
v = zeros(M+1,N+1);
for i = 1:N+1
    v(1,i) = feval(gx, x(i));
end

for j = 1:M+1
    v(j,1) = feval(ga, t(j));
    v(j,M+1) = feval(gb, t(j));
end

A = to/h^2*ones(N-1, 1);
B = A;
B(N-1) = 0;
A(1) = 0;

C = 1+2*to/h^2*ones(N-1,1);
% Tinh F
F = zeros(M-1,N-1);
for j = 1:M
    
    for i = 1:N-1
        F(j,i) = v(j,i) + to * feval(f,x(i+1),t(j+1));
        if  i==1
            F(j,i) = F(j,i) + to/h^2*v(j,1);
        end
        if i==N-1
            F(j,i) = F(j,i) + to/h^2*v(j,M+1);
        end
        
    end
    
    %fprintf('%f, %f ',v(j+1,1),v(j+1,N+1));
    v(j+1,:) = GiaiHePT3DuongCheo(N-1,A,B,C,F(j,:),v(j+1,1),v(j+1,N+1)); 
    %fprintf('%f ',v(j,i));

end
%disp(F);

% sai so tuyet doi
u = zeros(M+1,N+1);
epsi = zeros(M+1,N+1);
epsimax = 0;
for j=1:M+1
    for i=1:N+1
        u(j,i) = feval(uxt,x(i),t(j));
        epsi(j,i) = abs(u(j,i)-v(j,i));
        if epsimax < epsi(j,i)
            epsimax = epsi(j,i);
        end
    end
end

end