close all
clc;clear;

K = 2.6;
num = K*10;
den = [0.5 1 0];
sys = tf(num,den);
figure(1)
rlocus(sys);
axis([-25,5,-30,30])
hold on


wn = 20; zeta = 0.045;
x = -20:0.01:-zeta*wn;
y = -sqrt((1 - zeta^2)/zeta)*x;
xc = x;
c = sqrt(wn^2 - xc.^2);
%ªÊ÷∆‘ –Ì«¯”Ú

plot(x,y,'m',x,-y,'m',xc,c,'m',xc,-c,'m','LineWidth',2);



sys_b = feedback(sys,1);

[z,p,k] = tf2zp(20,[0.5 1 20]);

Kv = 20;
Kvd = 0.1;

b = Kv/Kvd;
T = 0.009;

num1 = [b*T 1];
den1 = [T 1];
sys_af = tf(conv(num,num1),conv(den,den1));
sys_b1 = feedback(sys_af,1);
figure(2)
step(sys_b1)

[z1,p1,k1] = tf2zp(num1,den1)