close all
clc;clear;

T = 0.1;
the = [2 1 0.5 0.1 0.01];

num = 1;
den0 = [T^2,2*T*the(1),1];
den1 = [T^2,2*T*the(2),1];
den2 = [T^2,2*T*the(3),1];
den3 = [T^2,2*T*the(4),1];

sys0 = tf(num,den0)
sys1 = tf(num,den1);
sys2 = tf(num,den2);
sys3 = tf(num,den3);

[z,p,k] = tf2zp(num,den0)

[mag,phase,wout] = bode(sys0);

num2 = [1 1];
den22 = conv([1,0,0],[0.1 1]);
sys22 = tf(num2,den22);







% 
figure(1)
text(0.5,-4,'0dB/dec')
text(13,-10,'-20dB/dec')
text(186,-49,'-40dB/dec')
hold on
asymp(sys0)
hold off
figure(2)
text(0.5,-4,'0dB/dec')
text(100,-35,'-40dB/dec')
hold on
asymp(sys1)
hold off

figure(3)
text(0.8,-4,'0dB/dec')
text(89,-32,'-40dB/dec')

hold on
asymp(sys2)
hold off

figure(4)
text(2.4,-4,'0dB/dec')
text(30,-13,'-20dB/dec')
hold on
asymp(sys3)
hold off


figure(5)
bode(sys0,sys1,sys2,sys3)

figure(6)
margin(sys0)
figure(7)
margin(sys1)
figure(8)
margin(sys2)
figure(9)
margin(sys3)
figure(10)
margin(sys22)

%%
%选作部分：
num3 = 1;
num4 = [0.5 1];
den4 = [0.1 1];

num5 = 1;
den5 = [1 1 0];

syss1 = tf(conv(num3,num5),den5);
syss2 = tf(conv(num4,num5),conv(den4,den5));
figure(11)
margin(syss1)
figure(12)
margin(syss2)
figure(13)
bode(syss1,syss2)

