%----------------------------------------
%�˳������Է��浼������ϵͳ
%���ߣ� Jiangfeng
%���ڣ� 2011.4.11
%----------------------------------------
function [control]=control(dq)
global ktheta kpsai;
u1=ktheta*dq(1);
u2=kpsai*dq(2);
control=[u1 u2];
end