close all
clear,clc;
K = 10;
num = K;
den = conv([0.5 0],[0.2 1]);
G = tf(num,den);
t = 0:0.01:3;
figure(1)
step(G,t);
xlabel('t'),ylabel('c(t)'),title('step response');
figure(2)
impulse(G,t);
xlabel('t'),ylabel('c(t)'),title('impulse response');
figure(3)
u = t;
lsim(G,u,t,0);
xlabel('t'),ylabel('c(t)'),title('ramp response');
figure(4)
[u,t] = gensig('square',4,10,0.1);
lsim(G,u,t);
xlabel('t'),ylabel('c(t)'),title('square response');
[p,z] = pzmap(G);
figure(5)
pzmap(G);
figure(6)
rlocus(G);
rlocfind(G)





