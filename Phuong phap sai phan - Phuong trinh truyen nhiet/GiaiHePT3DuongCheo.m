function Y  = GiaiHePT3DuongCheo( N,A,B,C,F,y0,yn)
alpha = zeros(N,1);
beta = zeros(N,1);
Y = zeros(N+2,1);
alpha(1 )= B(1)/C(1);
beta(1) = F(1)/C(1);
for i=2:N
    alpha(i)=B(i-1)/( C(i-1)-A(i-1)*alpha(i-1) );
    beta(i)=(A(i-1)*beta(i-1) + F(i-1)) / (C(i-1) - A(i-1)*alpha(i-1));
end
%disp(beta);
%disp(alpha);
Y(N+1)=(A(N)*beta(N)+F(N))/(C(N)-A(N)*alpha(N));
for i=1:N-1
    Y(N+1-i) = alpha(N+1-i) * Y(N+2-i) + beta(N+1-i);
    %fprintf('%f %f %f\n',alpha(N+1-i),Y(N+2-i),beta(N+1-i));
    
end
Y(1) = y0;
Y(N+2) = yn;
end

