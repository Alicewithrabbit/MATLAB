function y = Different(E,N,V)

Sum = 0;

for i = 1:1:N
    
    Sum = (E - V(i))^2 + Sum;
end

y = Sum/N;
end