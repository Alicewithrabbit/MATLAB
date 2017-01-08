%----------------------------------------
%此程序用以仿真被拦截目标运动模型
%作者： Jiangfeng
%日期： 2011.4.11
%----------------------------------------
function [sys,x0,str,ts] = targetmov(t,x,u,flag)
global vt ;
global xt0 yt0 zt0 thetat psait;
switch flag,
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
  case 1,
    sys=mdlDerivatives(t,x,u);
  case {2,4,9},
    sys=[];
  case 3,
    sys=mdlOutputs(t,x);
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
global xt0 yt0 zt0;
sizes = simsizes;

sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);

x0=[xt0,yt0,zt0];

str = [];

ts  = [0 0];
%---状态方程----姿态运动学和动力学方程-----
function sys=mdlDerivatives(t,x,u)
global vt;
global thetat psait;
xt=x(1);yt=x(2);zt=x(3);
%--------------------
dxt=vt*cos(thetat)*cos(psait);
dyt=vt*sin(thetat);
dzt=-vt*cos(thetat)*sin(psait);

%-----------------------
sys =[dxt dyt dzt];


function sys=mdlOutputs(t,x)

xt=x(1);yt=x(2);zt=x(3);

sys =[xt yt zt];



