function [ temp ] = fun_xyz(x, y, z)
% nhap ham vao function
% khi truyen tham so, truyen duoi dang RK4('fun_xyz', ...)

% RK
% temp = x + y;
temp = -x*z + y;

% Euler
% temp = y - (2*x)/y;

% hoac neu nhap tu terminal: fun = @(x, y, z) -x*z + y;
end