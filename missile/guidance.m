%----------------------------------------
%此程序用以仿真导弹导引系统
%作者： Jiangfeng
%日期： 2011.4.11
%----------------------------------------
function [q]=guidance(sitemandt)

sitet=sitemandt(1:3);
sitem=sitemandt(4:6);
xm=sitem(1);ym=sitem(2);zm=sitem(3);
xt=sitet(1);yt=sitet(2);zt=sitet(3);
qtheta=(yt-ym)/sqrt((xt-xm)^2+(zt-zm)^2);
qtheta=atan(qtheta);
qpsai=(zt-zm)/(xt-xm);
qpsai=-atan(qpsai);
R=sqrt((xm-xt)^2+(ym-yt)^2+(zm-zt)^2);
q=[qtheta qpsai R];

end
