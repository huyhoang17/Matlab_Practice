%       Giai bai tap phuong trinh vi phan thuong
disp('Chuong trinh giai phuong trinh vi phan thuong');
fprintf('\n');
syms y(t) t;
fun = input('Nhap ham y`(t) = ');
y0 = input('Nhap gia tri ban dau y0 = ');
t0 = input('Nhap diem dau t0 = ');
tn = input('Nhap diem cuoi tn =');
h = input('Nhap buoc nhay h = ');
disp('');
disp('Lua chon phuong phap giai');
fprintf('1. euler\n');
fprintf('2. euler cai tien\n');
fprintf('3. RK3 \n');
fprintf('4. RK4 \n');
nhap = input('Chon: ');
if nhap < 1 || nhap > 4
    disp('Can loi');
else
    switch nhap
         case 1
             [T,Y] = euler(@(t,y) fun,t0,tn,y0,h);
             %break;
         case 2
             [T,Y] = euler_nextlevel(@(t,y) fun,t0,tn,y0,h);
             %break;
         case 3
             [T,Y] = RK3(@(t,y) fun,t0,tn,y0,h);
             %break;
         case 4
             [T,Y] = RK4(@(t,y) fun,t0,tn,y0,h);
             %break;
    end
    hold on;
    plot(T,Y)
    disp('Ham chinh xac: ');
    f = dsolve(diff(y) == fun,y(0) == y0);
    ezplot(f,T)
    legend('nghiem gan dung','nghiem chinh xac')
end