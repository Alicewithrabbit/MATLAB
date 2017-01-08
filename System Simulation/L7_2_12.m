close all
clc;clear;

K = 1;
num = K*10;
den = [0.5 1 0];
sys = tf(num,den);
figure(1)
margin(sys);
[Gm,Pm,Wgm,Wpm] = margin(sys);
Kc = 2;wc0 = Wpm;wc = 5;c = 3.5;d = 2.5;b = 2;
h = 9;%h = w3/w2,w3 = c*wc w4 = c*d*wc w1 = 1/(a*b)*wc w2 = 1/a*wc
w3 = c*wc ;w2 = h/w3;
%w4 = (2~2.5)w3; a = 4.5
w4 = c*d*wc;

w1 = w2/b;

num1 = 20*[1/w2 1]
den1 = conv([1 0],conv([1/w2 1],conv([1/w3 1],[1/w4 1])));
sys_af = tf(num1,den1);
sys_jz = sys_af/sys
figure(2)
margin(sys_af);grid
figure(3)
asymp(sys_af)
figure(4)
sys_s = feedback(sys_af,1);
step(sys_s)