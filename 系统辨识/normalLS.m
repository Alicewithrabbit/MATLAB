close all;
clear;clc;

%@author:alicewithrabbit
%release date:16/10/6
%email:imroxaswc@gmail.com

sigma = sqrt(0.1);

v = normrnd(0,sigma,16);

n = 4;
y = [1,1,1,1];
delta = 1;
a = 5;
u = Mfunction(y,n,a,delta);

figure
stem(u),grid on
title('输入信号M序列')

% 最小二乘辨识程序 
z = zeros(1,16); %定义输出观测值的长度
for k=3:16 
    z(k) = -1.6*z(k-1) - 0.7*z(k-2) + u(k-1) + 0.4*u(k-2) + 1*v(k); %观测值
end

figure(2)
plot(1:16,z)
title('输出观测值')
figure(3)
stem(z),grid on
title('输出观测值z的经线图形')

%给样本系数矩阵
H = [-z(2) -z(1) u(2) u(1);-z(3) -z(2) u(3) u(2);-z(4) -z(3) u(4) u(3);-z(5) -z(4) u(5) u(4);-z(6) -z(5) u(6) u(5);-z(7) -z(6) u(7) u(6);-z(8) -z(7) u(8) u(7);-z(9) -z(8) u(9) u(8);-z(10) -z(9) u(10) u(9);-z(11) -z(10) u(11) u(10);-z(12) -z(11) u(12) u(11);-z(13) -z(12) u(13) u(12);-z(14) -z(13) u(14) u(13);-z(15) -z(14) u(15) u(14)];
%给出样本观测矩阵
Z = [z(3);z(4);z(5);z(6);z(7);z(8);z(9);z(10);z(11);z(12);z(13);z(14);z(15);z(16)];
%计算参数
c = (H'*H)\H'*Z;
%分离参数
a1 = c(1); a2 = c(2);b1 = c(3); b2 = c(4);
theta = [c(1),c(2),0,c(3),c(4)];
