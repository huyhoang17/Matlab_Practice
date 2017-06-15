function [ v, epsimax, u ] = GiaiPTTruyenNhiet2D_Hien( f,gxa,gxb,gyc,gyd,uxy0,a,b,c,d,N,M, T, P,uchinhxac  )
% giai pt truyen nhiet theo thoi gian mien hinh chu nhat
%input 
%         f = f(x,y,t) pt can gian
%         gxa dieu kien bien x=a
%         gxb dieu kien bien x=b
%         gyc dieu kien bien y=c
%         gyd dieu kien bien y=d
%         uxy0 dieu kien ban dau
%         a<x<b     c<y<d
%         N,M so khoang chia x,y
%         T thoi gian can tinh
%         P so khoang chia theo thoi gian
%         uxy nghiem dung cua bai toan
%output
%         v nghiem xap xi
%         epsimax sai so tuyet doi
%         u nghiem dung cua bai toan
%VD test
% f = @(x,y,t) cos(x+y+t) + 2*sin(x+y+t);
% gxa = @(y,t) sin(y+t)
% gxb = @(y,t) sin(y+t+1)
% gyc = @(x,t) sin(x+t)
% gyd = @(x,t) sin(x+t+1)
% uxy0 = @(x,y) sin(x+y)
% uxy = @(x,y,t) sin(x+y+t)
% 0<x<1 0<y<1 T=1 N=M=5

epsimax = 0;
h = (b-a)/N;
k = (d-c)/M;
to = T/P;
r = to/h^2;
s = to/k^2;
if r+s > 1/2
    [ v, epsimax, u ] = GiaiPTTruyenNhiet2D_Hien( f,gxa,gxb,gyc,gyd,uxy0,a,b,c,d,N,M, T, P*2,uchinhxac  );
    return;
end
v_temp = zeros(N+1, M+1, P+1);
x = zeros(N+1,1);
y = zeros(M+1,1);
t = zeros(P+1,1);

for i=0:N
    x(i+1) = a + i*h;
end
for i=0:M
    y(i+1) = c + i*k;
end
for i=1:P
    t(i+1) = i*to;
end
% tinh dieu kien ban dau
for i=1:N+1
    for j=1:M+1    
        v_temp(:,:,1) = feval(uxy0,x(i),y(j));
    end
end

% cong thuc hien
for n=2:P+1
    for j=1:M+1
        v_temp(1,j,n) = feval(gxa,y(j),t(n-1));
        v_temp(N+1,j,n) = feval(gxb,y(j),t(n-1));
    end
    for i=1:N+1
        v_temp(i,1,n) = feval(gyc,x(i),t(n-1));
        v_temp(i,M+1,n) = feval(gyd,x(i),t(n-1));
    end
    for i=2:N
        for j=2:M
            v_temp(i,j,n) = (1-2*r-2*s)*v_temp(i,j,n-1)+r*(v_temp(i+1,j,n-1)+v_temp(i-1,j,n-1))+s*(v_temp(i,j-1,n-1)+v_temp(i,j+1,n-1))+to*feval(f,x(i),y(j),t(n-1)); 
        end
    end
end
% tinh u dung va sai so
u = zeros(N+1,M+1);

if nargin == 15
for i=1:N+1
    for j=1:M+1
        u(i,j) = feval(uchinhxac,x(i),y(j),T);
        if epsimax < abs(u(i,j)-v_temp(i,j,P+1))
            epsimax = abs(u(i,j)-v_temp(i,j,P+1));
        end
    end
end
else
for i=1:N+1
    for j=1:M+1
        if epsimax < abs(v_temp(i,j,P)-v_temp(i,j,P+1))
            epsimax = abs(v_temp(i,j,P)-v_temp(i,j,P+1));
        end
    end 
end
end
v = v_temp(:,:,P+1);
fprintf('So buoc chia P = %d',P);
end