% Giai phuong trinh vi phan cap cao

disp('Chuong trinh giai phuong trinh vi phan cap cao')
syms x y z;
f = input('Nhap ham f(x) = ');
g = input('Nhap ham g(x) = ');
t0 = input('Nhap diem t0 = ');
tn = input('Nhap diem tn = ');
y0 = input('Nhap diem y0 = ');
z0 = input('Nhap diem z0 = ');
h = input('Nhap khoang cach h = ');

[T,Y,Z] = RK4_NextLevel(@(x,y,z)f,@(x,y,z)g,t0,tn,y0,z0,h);
 hold on;
plot(T,Y)
plot(T,Z)
legend('f(x,y,z)','g(x,y,z)');