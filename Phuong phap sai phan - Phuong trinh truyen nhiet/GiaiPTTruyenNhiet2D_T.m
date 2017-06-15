%VD test
% f = @(x,y,t) cos(x+y+t) + 2*sin(x+y+t);
% gxa = @(y,t) sin(y+t)
% gxb = @(y,t) sin(y+t+1)
% gyc = @(x,t) sin(x+t)
% gyd = @(x,t) sin(x+t+1)
% uxy0 = @(x,y) sin(x+y)
% uxy = @(x,y,t) sin(x+y+t)
function [ var, epsimax, u ] = GiaiPTTruyenNhiet2D_T( f,gxa,gxb,gyc,gyd,uxy0,a,b,c,d,N,M, T, P,uxy  )

% giai pt truyen nhiet theo thoi gian mien hinh chu nhat
v = zeros(N+1, M+1, P+1);
epsimax = 0;

h = (b-a)/N;
k = (d-c)/M;
to = T/P;
r = to/h^2;
s = to/k^2;
%lambda1 = 1/h^2;
%lambda2 = 1/k^2;
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
        v(:,:,1) = feval(uxy0,x(i),y(j));
    end
end

A1 = 0.5*r*ones(M-1,1);
B1 = A1;
A1(1) = 0;
B1(N-1) = 0;
C1 = (1+r)*ones(M-1,1);

A2 = 0.5*s*ones(N-1,1);
B2 = A2;
A2(1) = 0;
B2(M-1) = 0;
C2 = (1+s)*ones(N-1,1);


for n=1:P
    % giai bai toan theo x
    v_temp = zeros(N+1,M+1);
    for j=1:M+1
        %v_temp(1,j) = 1/2*(feval(gxa,y(j),t(n+1)) + feval(gxa,y(j),t(n))) - to/4*lambda2*(feval(gxa,y(j),t(n+1))-feval(gxa,y(j),t(n)));
        %v_temp(N+1,j) = 1/2*(feval(gxb,y(j),t(n+1)) + feval(gxb,y(j),t(n)))-to/4*lambda2*(feval(gxb,y(j),t(n+1))-feval(gxb,y(j),t(n)));
        v_temp(1,j) = feval(gxa,y(j),t(n)+to/2);
        v_temp(N+1,j) = feval(gxb,y(j),t(n)+to/2);
    end
    for i=1:N+1
        F = zeros(M-1,1);
        for j=2:M
            F(j-1) = 0.5*s*v(i,j-1,n) + (1-s)*v(i,j,n) + 0.5*s*v(i,j+1,n) + 0.5*to*feval(f,x(i),y(j),t(n)+to/2);
            if j==2
                F(j-1) = F(j-1) + v_temp(1,i)*0.5*s;
            end
            if j==M
                F(j-1) = F(j-1) + v_temp(N+1,i)*0.5*s;
            end
        end
        v_temp(i,:) = GiaiHePT3DuongCheo(M-1,A1,B1,C1,F,v_temp(1,i),v_temp(N+1,i));
    end
    %disp(v_temp);
    % giai theo y
    v_temp2 = zeros(N+1,M+1);
    for i=1:N+1
        v_temp2(i,1) = feval(gyc,x(i),t(n+1));
        v_temp2(i,M+1) = feval(gyd,x(i),t(n+1));
    end
    for j=1:M+1
        G = zeros(N-1,1);
        for i=2:N
            G(i-1) = 0.5*r*v_temp(i-1,j) + (1-r)*v_temp(i,j) + 0.5*r*v_temp(i+1,j) + 0.5*to*feval(f,x(i),y(j),t(n)+to/2);
            if i==2
                G(i-1) = G(i-1) + v_temp2(j,1)*0.5*r;
            end
            if i==M
                G(i-1) = G(i-1) + v_temp2(j,M+1)*0.5*r;
            end
        end
        v_temp2(:,j) = GiaiHePT3DuongCheo(N-1,A2,B2,C2,G,v_temp2(j,1),v_temp2(j,M+1));
    end
    v(:,:,n+1)=v_temp2;
end

u = zeros(N+1,M+1);
for i=1:N+1
    for j=1:M+1
        u(i,j) = feval(uxy,x(i),y(j),T);
        if epsimax < abs(u(i,j)-v(i,j,P+1))
            epsimax = abs(u(i,j)-v(i,j,P+1));
        end
    end
end
var = v(:,:,P+1);
end