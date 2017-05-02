function [ temp ] = fun_xy(x, y)
% nhap ham vao function
% khi truyen tham so, truyen duoi dang RK4('fun_xy', ...)

% RK
temp = x + y;
% temp = -x*z + y

% Euler
% temp = y - (2*x)/y;

% hoac neu nhap tu terminal: fun = @(x, y) x + y;
end