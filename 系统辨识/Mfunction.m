function u = Mfunction(y,n,a,delta)
%________________________________
%M序列产生函数
%________________________________
N = 2^n - 1;
[m,n] = size(y);
X = zeros(1,n);%中间变量
Output = zeros(1,3*N);
u = zeros(1,3*N);
t = zeros(1,3*N);

for i = 1:4*N
    Output(i) = y(4);
    t(i) = delta*i;
    if Output(i) == 1
        u(i) = -a;
    else
        u(i) = a;
    end
    X(1) = xor(y(3),y(4));
    X(2) = y(1);
    X(3) = y(2);
    X(4) = y(3);
    y(1) = X(1);y(2) = X(2);y(3) = X(3);y(4) = X(4);
end

end