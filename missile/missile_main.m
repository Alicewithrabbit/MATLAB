%----------------------------------------
%此程序用以仿真导弹拦截过程
%作者： Jiangfeng
%日期： 2011.4.11
%----------------------------------------
close all;clear;clc;
tic;
bdclose all;
set_param(0,'CharacterEncoding','windows-1252');


%-----------------清屏-------------------
global vm g;
global xm0 ym0 zm0 thetam0 psaim0;%导弹
global vt;
global xt0 yt0 zt0 thetat psait;  %目标
global ktheta kpsai;              %控制系数

iteration_flag = 10;
plot_iteration = 100;

%--------------变量定义------------------
vm=300; g=9.8;
xm0=0;ym0=0;zm0=0;
thetam0=30;psaim0=-30;
vt=100;deg=180/pi;
xt0=1000;yt0=3000;zt0=3000;
thetat=0/deg;psait=120/deg;
Rmin=5;

while(iteration_flag~=0)
    

%---------------数据初始化----------------
ktheta=1000;      kpsai=-1000;
%--------------控制系数设定---------------
t0=0;tf=50;
[tout,stateout,yout]=sim('missile',[t0,tf]);
%--------------simulink仿真---------------
guidout=yout(:,7:12);
siteout=yout(:,1:6);
Rout=guidout(:,3);
[Rmin,N] = min(Rout-Rmin);
if Rmin<=0&&Rmin<Rout(end)
      fprintf('\n-----------------------------\n');
      fprintf('success to intercept the target!');
      fprintf('\n-----------------------------\n');
end
sitet=siteout(1:N,1:3);
sitem=siteout(1:N,4:6);
q=guidout(1:N,1:2);
xm=sitem(1:N,1);ym=sitem(1:N,2);zm=sitem(1:N,3);
xt=sitet(1:N,1);yt=sitet(1:N,2);zt=sitet(1:N,3);
xend=sitet(N,1);yend=sitet(N,2);zend=sitet(N,3);
qtheta=q(1:N,1);qpsai=q(1:N,2);
tout=tout(1:N); Rout=Rout(1:N);
%-----------------分离变量----------------
% figure;
plot3(xm(1,1),ym(1,1),zm(1,1),'g.');
hold on
plot3(xt(1,1),yt(1,1),zt(1,1),'b.');
legend('missile','target');
axis([0 7000 0 5000 0 4000]);
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
for x = 1:N
plot3(xm(x,1),ym(x,1),zm(x,1),'g.'),pause(0.00001);
hold on
plot3(xt(x,1),yt(x,1),zt(x,1),'b.'),pause(0.00001);
end
plot3(xend,yend,zend,'r*');
hold off

%---------------拦截轨迹-----------------
% figure;
% subplot(2,1,1);
% plot(tout,qtheta*deg,tout,qpsai*deg);
% legend('qh(高度角)','qv(方位角)');
% grid on;
% ylabel('弹目视线角度(deg)');
% %-------------弹目视线角度----------------
% subplot(2,1,2);
% plot(tout,Rout);
% grid on;
% ylabel('距离(m)');
% xlabel('时间(s)');
%---------------距离变化-----------------

%-----------------绘图-------------------
toc;
% while(plot_iteration ~= 0)
%     plot_iteration = plot_iteration - 10;
% end
%     plot_iteration = 100;
    
   xt0 = xt0 + 1000; 
   
   iteration_flag = iteration_flag - 2;
end









