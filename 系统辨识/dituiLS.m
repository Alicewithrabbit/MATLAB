close all;
clear;clc;

%@author:alicewithrabbit
%release date:16/10/6
%email:imroxaswc@gmail.com

sigma = sqrt(0.5);
v = normrnd(0,sigma,16);

n = 4;
y = [1,1,1,1];
delta = 1;
a = 5;
u = Mfunction(y,n,a,delta);

figure(1);
stem(u),grid on
title('输入信号M序列')

% 递推最小二乘辨识程序
z(2) = 0;z(1) = 0;
%观测值由理想输出值加噪声
for k = 3:60;%循环变量从3到15   
    z(k) = -1.6*z(k-1) - 0.7*z(k-2) + u(k-1) + 0.4*u(k-2) + 0.5*v(k); 
end

%RLS递推最小二乘辨识
c0 = [0.001 0.001 0.001 0.001]';
p0 = 10^3*eye(4,4);
E = 0.000000005;%相对误差
c = [c0,zeros(4,59)];%被辨识参数矩阵的初始值及大小
e = zeros(4,60);%相对误差的初始值及大小
lamt = 1;
for k = 3:60; 
    h1 = [-z(k-1),-z(k-2),u(k-1),u(k-2)]';
    k1 = (p0*h1)/(h1'*p0*h1 + 1*lamt);%求出K的值
    new=z(k)-h1'*c0; 
    c1 = c0 + k1*new;%求被辨识参数c
    p1 = 1/lamt*(eye(4) - k1*h1')*p0;
    e1 = (c1 - c0)./c0;%求参数当前值与上一次的值的差值
    e(:,k) = e1; %把当前相对变化的列向量加入误差矩阵的最后一列    
    c(:,k) = c1;%把辨识参数c 列向量加入辨识参数矩阵的最后一列 
    c0 = c1;%新获得的参数作为下一次递推的旧参数
    p0 = p1;
    if norm(e1) <= E 
        break;%若参数收敛满足要求，终止计算
    end
end
%分离参数
a1 = c(1,:); a2 = c(2,:); b1 = c(3,:); b2 = c(4,:); 
ea1 = e(1,:); ea2 = e(2,:); eb1 = e(3,:); eb2 = e(4,:); 
figure(2);
i=1:60;
plot(i,a1,'k',i,a2,'b',i,b1,'r',i,b2,'g') %画出辨识结果
legend('a1','a2','b1','b2');
title('递推最小二乘参数辨识')
figure(3); 
i=1:60; 
plot(i,ea1,'k',i,ea2,'b',i,eb1,'r',i,eb2,'g') %画出辨识结果的收敛情况
legend('a1','a2','b1','b2');
title('辨识精度')

