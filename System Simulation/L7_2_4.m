close all
clc;clear;

num0 = 1;
den01 = [1 0];
den02 = [1 1];
den03 = [1 2];
den0 = conv(den01,conv(den02,den03));


num1 = [1 1];
den11 = [1 0];
den12 = [1 -1];
den13 = [1 4 16];
den1 = conv(den11,conv(den12,den13));

num2 = [1 3];
den21 = [1 0];
den22 = [1 2];

den2 = conv(den21,den22);


sys0 = tf(num0,den0)
sys1 = tf(num1,den1)
sys2 = tf(num2,den2)
figure(1)
rlocus(sys0,'m.',sys1,'r*',sys2,'g+')
[Gm,Pm,Wgm,Wpm] = margin(sys0);
[Gm1,Pm1,Wgm1,Wpm1] = margin(sys1);
[Gm2,Pm2,Wgm2,Wpm2] = margin(sys2);
grid on
legend('System a','System b','System c')

figure(2)
pzmap(sys0,'m',sys1,'b',sys2,'g')
legend('System a','System b','System c')