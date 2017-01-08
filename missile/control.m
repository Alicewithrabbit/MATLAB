%----------------------------------------
%此程序用以仿真导弹控制系统
%作者： Jiangfeng
%日期： 2011.4.11
%----------------------------------------
function [control]=control(dq)
global ktheta kpsai;
u1=ktheta*dq(1);
u2=kpsai*dq(2);
control=[u1 u2];
end