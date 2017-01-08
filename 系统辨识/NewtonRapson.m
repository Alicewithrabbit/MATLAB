clc,clear

sigma=7.2;%均方差
epsilon=0.001;%迭代终止条件
total=16;
N=240;
n = 15;
a = 1;
%init 
error1 = zeros(1,4668);
error2 = zeros(1,4668);
error3 = zeros(1,4668);
error4 = zeros(1,4668);
error5 = zeros(1,4668);
error6 = zeros(1,4668);
v_error = zeros(1,4668);
y = zeros(1,243);
u = zeros(1,243);


V=sigma*randn(total,1); %噪声
%M序列产生


y1=1;y2=1;y3=1;y4=0;
for i=1:15
x1=xor(y3,y4);
x2=y1;
x3=y2;
x4=y3;
y(i)=y4;
if y(i)>0.5,u(i)=-1;
else u(i)=1;
end
y1=x1;y2=x2;y3=x3;y4=x4;
end
%最小二乘一般算法,产生初始估计值a1,a2,b1,b2;
z=zeros(1,total);
for k=3:total
z(k)=1.5*z(k-1)+0.7*z(k-2)+u(k-1)+0.5*u(k-2)+V(k);
end
%给样本系数矩阵
H=[-z(2) -z(1) u(2) u(1);-z(3) -z(2) u(3) u(2);-z(4) -z(3) u(4) u(3);-z(5) -z(4) u(5) u(4);-z(6) -z(5) u(6) u(5);-z(7) -z(6) u(7) u(6);-z(8) -z(7) u(8) u(7);
-z(9) -z(8) u(9) u(8);-z(10) -z(9) u(10) u(9);-z(11) -z(10) u(11) u(10);-z(12) -z(11) u(12) u(11);-z(13) -z(12) u(13) u(12);-z(14) -z(13) u(14) u(13);
-z(15) -z(14) u(15) u(14)];
Z=[z(3);z(4);z(5);z(6);z(7);z(8);z(9);z(10);z(11);z(12);z(13);z(14);z(15);z(16)];
c=(H'*H)\H'*Z;
a1=c(1);a2=c(2);b1=c(3);b2=c(4);
d1=0.1;
d2=0.1;
theta=[a1,a2,b1,b2,d1,d2]';%参数估计初值
theta = newtonAlgorithm(error1,error2,error3,error4,error5,error6,v_error,theta,epsilon,N,y1,y2,y3,y4,sigma,V,y);