clear,clc;
close all;
A = 5^17;M = 2^42 - 1;x0 = 1;N = 1000;%迭代次数
v = zeros(1,N);

%algorithm:
for i=1:N
    x1 = mod(A*x0,M);
    v1 = x1/M;
    v(:,i) = v1;
    x0 = x1;
end

%grapher:
figure(1)

plot((1:N),v);
xlabel('k'),ylabel('v');
title('乘同余法的(0,1)均匀分布的随机序列')

y = Average(N,v);

d = Different(y,N,v);

[h,X] = kafang(v);
[h1,X1] = duli(v);

[f,t] = ksdensity(v);
figure(2)
plot(t,f);
xlabel('x'),ylabel('f');
title('随机序列的概率密度图')




