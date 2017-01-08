close all
clc;clear;

tspan = 0:0.01:80;
e0 = [1 0];[tspan,e] = ode45('defun',tspan,e0);

figure(1);
plot(e(:,1),e(:,2),'m','LineWidth',2);
xlabel('e');
ylabel('e1');
title('ϵͳ��켣ͼ');



