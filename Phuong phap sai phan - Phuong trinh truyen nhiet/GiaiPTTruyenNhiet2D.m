function [ v, epsimax ] = GiaiPTTruyenNhiet2D( f,gxa,gxb,gyc,gyd,a,b,c,d,N,M,epsi,lamda  )

% giai pt phan bo nhiet dung mien hinh chu nhat
if lamda < 1 || lamda > 2
    error(message('nhap lai lamda'));
end
v = zeros(M+1, N+1);
v_old = zeros(M+1, N+1);
epsimax = 0;

h = (a-b)/N;
k = (c-d)/M;
gama = (h/k)^2;
x = zeros(N+1,1);
y = zeros(M+1,1);
x(1) = a;
y(1) = c;
for i=1:N
    x(i+1) = a + i*h;
end
for i=1:M
    y(i+1) = c + i*k;
end

% tinh dieu kien tai bien
for i=1:M+1
    v(1,i) = feval(gxa,x(1),y(i) );
    v(N+1,i) = feval(gxb,x(N+1),y(i));
end
for i=1:N+1
    v(i,1,1) = feval(gyc,x(i),y(1) );
    v(i,M+1,1) = feval(gyd,x(i),y(M+1) );
end
% tinh v(i,j)
for i=2:N
    for j=2:M
        v(i,j) = 1/(2*(1+gama)) * (gama*v(i,j-1) + v(i-1,j) + v_old(i+1,j) + gama*v_old(i,j+1) - h^2*feval(f,x(i),y(j)) );
            v(i,j) = lamda*v(i,j)+(1-lamda)*v_old(i,j);
            if ( abs((v(i,j) - v_old(i,j))/v(i,j)) > epsimax )
                epsimax = abs((v(i,j) - v_old(i,j))/v(i,j));
            end
    end
end
v_old = v;

while (  epsimax > epsi )
    % tinh v(i,j)
    epsimax = 0;
    for i=2:N
        for j=2:M
            v(i,j) = 1/(2*(1+gama)) * (gama*v(i,j-1) + v(i-1,j) + v_old(i+1,j) + gama*v_old(i,j+1) - h^2*feval(f,x(i),y(j)) );
            v(i,j) = lamda*v(i,j)+(1-lamda)*v_old(i,j);
            if ( abs((v(i,j) - v_old(i,j))/v(i,j)) > epsimax )
                epsimax = abs((v(i,j) - v_old(i,j))/v(i,j));
            end
        end
    end
    v_old = v;
end
end