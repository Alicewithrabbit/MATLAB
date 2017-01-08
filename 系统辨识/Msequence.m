close all;
clear,clc;

n = 4;%移位寄存器个数
N = 2^n - 1;%周期
a = 0.5;%振幅
delta = 0.6;%离散步长
X = [0,0,0,0];%中间变量
A = [1,1,1,1];%寄存器初值

Output = zeros(1,3*N);
u = zeros(1,3*N);
t = zeros(1,3*N);

for i = 1:3*N
    Output(i) = A(4);
    t(i) = delta*i;
    if Output(i) == 1
        u(i) = a;
    else
        u(i) = -a;
    end
    X(1) = xor(A(3),A(4));
    X(2) = A(1);
    X(3) = A(2);
    X(4) = A(3);
    A(1) = X(1);A(2) = X(2);A(3) = X(3);A(4) = X(4);
end

stairs(t,u,'LineWidth',2,'Marker','d','MarkerFaceColor','c');
xlabel('t');ylabel('a');
title('四移位寄存器反馈产生的幅值为0.5，步长0.6的M序列');
axis([1 30 -0.6 0.6])

y = Average(3*N,t);

d = Different(y,3*N,t);




    
