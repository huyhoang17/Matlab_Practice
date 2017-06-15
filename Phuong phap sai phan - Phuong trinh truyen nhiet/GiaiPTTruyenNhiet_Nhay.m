function [ v, epsimax, u ] = GiaiPTTruyenNhiet_Nhay( f,gxa,gxb,gyc,gyd,uxy0,a,b,c,d,N,M, T, P,uxy  )
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
% tinh bang pp nhay o

% tinh u dung va sai so
u = zeros(N+1,M+1);
for i=1:N+1
    for j=1:M+1
        u(i,j) = feval(uxy,x(i),y(j),T);
        if epsimax < abs(u(i,j)-v(i,j,P+1))
            epsimax = abs(u(i,j)-v(i,j,P+1));
        end
    end
end

end

