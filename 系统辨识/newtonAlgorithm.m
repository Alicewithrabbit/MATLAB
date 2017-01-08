function theta = newtonAlgorithm(error1,error2,error3,error4,error5,error6,v_error,theta,epsilon,N,y1,y2,y3,y4,sigma,V,y)

v(1)=0;v(2)=0;
d_theta1=zeros(6,1);
d_theta2=zeros(6,1);
v_da1(1)=0;v_da2(1)=0;v_db1(1)=0;v_db2(1)=0;v_dd1(1)=0;v_dd2(1)=0; v_da1(2)=0;v_da2(2)=0;v_db1(2)=0;v_db2(2)=0;v_dd1(2)=0;v_dd2(2)=0;
j=1;
bef=zeros(6,1);

%执行算法
while sum(abs(theta-bef))>epsilon
%采集输入输出
for i=1:N+3
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
y(1)=0;y(2)=0;
V=sigma*randn(N+3,1); %噪声
y(1)=1;y(2)=0.01;
for k=3:N+3
y(k)=1.5*y(k-1)-0.7*y(k-2)+u(k-1)+0.5*u(k-2)+V(k)-V(k-1)+0.2*V(k-2);
end
J_d=0;
JJ_d=0;
a1=theta(1);a2=theta(2);
b1=theta(3);b2=theta(4);
d1=theta(5);d2=theta(6);
for k=3:N+3
v(k)=y(k)+a1*y(k-1)+a2*y(k-2)-b1*u(k-1)-b2*u(k-2)-d1*v(k-1)-d2*v(k-2);%求取v(k)
v_da1(k)=y(k-1)-d1*v_da1(k-1)-d2*v_da1(k-2);

v_da2(k)=y(k-2)-d1*v_da2(k-1)-d2*v_da2(k-2);
v_db1(k)=-u(k-1)-d1*v_db1(k-1)-d2*v_db1(k-2);
v_db2(k)=-u(k-2)-d1*v_db2(k-1)-d2*v_db2(k-2);
v_dd1(k)=-v(k-1)-d1*v_dd1(k-1)-d2*v_dd1(k-2);
v_dd2(k)=-v(k-2)-d1*v_dd2(k-1)-d2*v_dd2(k-2);
d_theta=[v_da1(k),v_da2(k),v_db1(k),v_db2(k),v_dd1(k),v_dd2(k)]'; J_d=J_d+v(k)*d_theta;
JJ_d=JJ_d+d_theta'*d_theta;
end
bef=theta;
theta=theta-(JJ_d)\J_d;
v(1)=v(N+1);v(2)=v(N+2);
v_da1(1)=v_da1(N+1);v_da2(1)=v_da2(N+1);v_db1(1)=v_db1(N+1);
v_db2(1)=v_db2(N+1);v_dd1(1)=v_dd1(N+1);v_dd2(1)=v_dd2(N+1);
v_da1(2)=v_da1(N+2);v_da2(2)=v_da2(N+2);v_db1(2)=v_db1(N+2);
v_db2(2)=v_db2(N+2);v_dd1(2)=v_dd1(N+2);v_dd2(2)=v_dd2(N+2);
%求取误差
error1(j)=-1.5-theta(1);
error2(j)=0.7-theta(2);
error3(j)=1-theta(3);
error4(j)=0.5-theta(4);
error5(j)=-1-theta(5);
error6(j)=0.2-theta(6);
v_error(j)=v(N+2);
j=j+1;
end
theta;%输出估计参数
%作图
figure(1);
plot(error1)
hold on
plot(error2)
hold on
plot(error3)
hold on
plot(error4)
hold on
plot(error5,'r')
hold on
plot(error6,'r')
title('参数估计误差')
xlabel('迭代次数')
ylabel('误差')
hold off
figure(2);
plot(-1.5-error1,'b');
hold on
plot(0.7-error2,'c')
hold on
plot(1-error3,'g')
hold on
plot(0.5-error4,'y')
hold on
plot(-1-error5,'m')
hold on
plot(0.2-error6,'r')
legend('a1','a2','b1','b2','d1','d2',-1)
title('参数估计值变化')
xlabel('迭代次数')
ylabel('参数')
hold off
