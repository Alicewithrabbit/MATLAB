%----------------------------------------
%此程序用以仿真导弹运动模型
%作者： Jiangfeng
%日期： 2011.4.11
%----------------------------------------
function [sys,x0,str,ts] = missilemov(t,x,u,flag)
global vm g;
global xm0 ym0 zm0 thetam0 psaim0;
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
global xm0 ym0 zm0 thetam0 psaim0;
sizes = simsizes;

sizes.NumContStates  = 5;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);

deg=180/pi;
x0=[xm0,ym0,zm0,thetam0/deg,psaim0/deg];

str = [];

ts  = [0 0];
%---状态方程----姿态运动学和动力学方程-----
function sys=mdlDerivatives(t,x,u)
global vm g;
xm=x(1);ym=x(2);zm=x(3);
thetam=x(4);psaim=x(5);
%--------------------
dxm=vm*cos(thetam)*cos(psaim);
dym=vm*sin(thetam);
dzm=-vm*cos(thetam)*sin(psaim);
dthetam=(-g*cos(thetam)+u(1))/vm;
dpsaim=-u(2)/(vm*cos(thetam));

%-----------------------
sys =[dxm dym dzm dthetam dpsaim];


function sys=mdlOutputs(t,x)

xm=x(1);ym=x(2);zm=x(3);
thetam=x(4);psaim=x(5);

sys =[xm ym zm];



