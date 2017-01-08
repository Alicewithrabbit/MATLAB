close all
clc;clear;

%The first problem
n = 3;
[A,B,C,D] = rmodel(n);

sys = ss(A,B,C,D);

Wcct = gram(sys,'c')
Wcob = gram(sys,'o')

if(rank(Wcct) == n)
    Y = 'Controllable'
else
    N = 'Uncontrollable'
end

if(rank(Wcob) == n)
    Y = 'Observable'
else
    N = 'Unobservable'
end
[A1,B1,C1,D1,T] = canon(A,B,C,D,'companion')

[Abar,Bbar,Cbar,T,k] = obsvf(A,B,C)

%The second problem

num = [1 3 2];
den = [1 6 11 6];
[A2,B2,C2,D2] = tf2ss(num,den)

sys1 = ss(A2,B2,C2,D2);

Wcct1 = gram(sys1,'c')
Wcob1 = gram(sys1,'o')

if(rank(Wcct1) == n)
    Y = 'Controllable'
else
    N = 'Uncontrollable'
end

if(rank(Wcob1) == n)
    Y = 'Observable'
else
    N = 'Unobservable'
end

%The third problem
num1 = 10.*[0.2 1];
den1 = conv([1 0],conv([0.1 1],[0.5 1]));

sys2 = tf(num1,den1)

sys3 = feedback(sys2,1)

[A3,B3,C3,D3] = tf2ss(cell2mat(sys3.num),cell2mat(sys3.den))
sys4 = ss(A3,B3,C3,D3)
[Abar1,Bbar1,Cbar1,T1,k1] = ctrbf(A3,B3,C3)