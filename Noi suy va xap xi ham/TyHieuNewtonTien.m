function d = TyHieuNewtonTien(x, y)
% TY HIEU NEWTON TIEN 
% Dung giai thuat de quy de tinh ti hieu cua newton tien

n=length(x);
if(n < 3)
    d = (y(2)-y(1)) / (x(2)-x(1));
else
    d = (TyHieuNewtonTien(x(2:n),y(2:n)) - ...
    	TyHieuNewtonTien(x(1:n-1),y(1:n-1))) / ...
					(x(n)-x(1));
end

end

