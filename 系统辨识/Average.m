function y = Average(N,v)
%
% y = Sum(v)/N;
%

Sum = 0;
for i = 1:1:N
    Sum = v(i) + Sum;
end
y = Sum/N;
end