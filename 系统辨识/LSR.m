close all;
clear,clc;

T = [20.5 26 32.7 40 51 61 73 80 88 95.7];
R = [765,790,826,850,873,910,942,980,1010,1032];

[p] = size(T);
N = p(2);
figure 
plot(T,R,'--gs','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);

%_________________________________
%t = T(i);
%tt = T(i)^2;
%tz = T(i)*R(i)
%z = R(i);
%_________________________________

t = 0;
tt = 0;
tz = 0;
z = 0;

%algorithm:LS
for i = 1:N
    t = t + T(i);
    tt = tt + T(i)^2;
    z = z + R(i);
    tz = tz + T(i)*R(i);
end

a = (z*tt - tz*t)/(N*tt - t^2);
b = (N*tz  - z*t)/(N*tt - t^2);

%grapher
A = polyfit(T,R,1);
z = polyval(A,T);

figure 
plot(T,z,'-r','LineWidth',2);
figure
plot(T,R,'--gs','LineWidth',1,'MarkerSize',5,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
hold on
plot(T,z,'-r','LineWidth',1);
hold off

