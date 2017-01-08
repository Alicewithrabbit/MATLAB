function [h,X] = duli(V)
%
%独立性检验函数
%卡方检验: X^2 = SUM k^2/N(nij - N/k^2)^2
%
n = size(V);

k = 5;

Nij = zeros(k,k);%各区间点数记录MATRIX
N = n(2);%所有点个数
Ni = zeros(1,N/2);
Nj = zeros(1,N/2);
for i = 1:N/2
    Ni(i) = V(2*i);%y
end
for i = 1:N/2
    Nj(i) = V(2*i-1);%x
end

for i = 1:N/2
    
    if(0<Ni(i)&&Ni(i)<0.2||Ni(i) == 0.2)     
        for j = 1:N/2
            if(0<Nj(j)&&Nj(j)<0.1||Nj(j) == 0.2)
                Nij(1,1) = Nij(1,1) + 1;
            end
            if(0.2<Nj(j)&&Nj(j)<0.4||Nj(j) == 0.4)
                Nij(1,2) = Nij(1,2) + 1;
            end
            if(0.4<Nj(j)&&Nj(j)<0.6||Nj(j) == 0.6)
                Nij(1,3) = Nij(1,3) + 1;
            end     
             if(0.6<Nj(j)&&Nj(j)<0.8||Nj(j) == 0.8)
                Nij(1,4) = Nij(1,4) + 1;
             end
             if(0.8<Nj(j)&&Nj(j)<1||Nj(j) == 1)
                Nij(1,5) = Nij(1,5) + 1;
            end   
        end
    end
    
    if(0.2<Ni(i)&&Ni(i)<0.4||Ni(i) == 0.4)     
       for j = 1:N/2
            if(0<Nj(j)&&Nj(j)<0.1||Nj(j) == 0.2)
                Nij(2,1) = Nij(2,1) + 1;
            end
            if(0.2<Nj(j)&&Nj(j)<0.4||Nj(j) == 0.4)
                Nij(2,2) = Nij(2,2) + 1;
            end
            if(0.4<Nj(j)&&Nj(j)<0.6||Nj(j) == 0.6)
                Nij(2,3) = Nij(2,3) + 1;
            end     
             if(0.6<Nj(j)&&Nj(j)<0.8||Nj(j) == 0.8)
                Nij(2,4) = Nij(2,4) + 1;
             end
             if(0.8<Nj(j)&&Nj(j)<1||Nj(j) == 1)
                Nij(2,5) = Nij(2,5) + 1;
            end   
        end
     end
      
    if(0.4<Ni(i)&&Ni(i)<0.6||Ni(i) == 0.6)     
       for j = 1:N/2
            if(0<Nj(j)&&Nj(j)<0.1||Nj(j) == 0.2)
                Nij(3,1) = Nij(3,1) + 1;
            end
            if(0.2<Nj(j)&&Nj(j)<0.4||Nj(j) == 0.4)
                Nij(3,2) = Nij(3,2) + 1;
            end
            if(0.4<Nj(j)&&Nj(j)<0.6||Nj(j) == 0.6)
                Nij(3,3) = Nij(3,3) + 1;
            end     
             if(0.6<Nj(j)&&Nj(j)<0.8||Nj(j) == 0.8)
                Nij(3,4) = Nij(3,4) + 1;
             end
             if(0.8<Nj(j)&&Nj(j)<1||Nj(j) == 1)
                Nij(3,5) = Nij(3,5) + 1;
            end   
        end
    end
    
    if(0.6<Ni(i)&&Ni(i)<0.8||Ni(i) == 0.8)     
       for j = 1:N/2
            if(0<Nj(j)&&Nj(j)<0.1||Nj(j) == 0.2)
                Nij(4,1) = Nij(4,1) + 1;
            end
            if(0.2<Nj(j)&&Nj(j)<0.4||Nj(j) == 0.4)
                Nij(4,2) = Nij(4,2) + 1;
            end
            if(0.4<Nj(j)&&Nj(j)<0.6||Nj(j) == 0.6)
                Nij(4,3) = Nij(4,3) + 1;
            end     
             if(0.6<Nj(j)&&Nj(j)<0.8||Nj(j) == 0.8)
                Nij(4,4) = Nij(4,4) + 1;
             end
             if(0.8<Nj(j)&&Nj(j)<1||Nj(j) == 1)
                Nij(4,5) = Nij(4,5) + 1;
            end   
       end
    end
    
    if(0.8<Ni(i)&&Ni(i)<1||Ni(i) == 1)     
       for j = 1:N/2
            if(0<Nj(j)&&Nj(j)<0.1||Nj(j) == 0.2)
                Nij(5,1) = Nij(5,1) + 1;
            end
            if(0.2<Nj(j)&&Nj(j)<0.4||Nj(j) == 0.4)
                Nij(5,2) = Nij(5,2) + 1;
            end
            if(0.4<Nj(j)&&Nj(j)<0.6||Nj(j) == 0.6)
                Nij(5,3) = Nij(5,3) + 1;
            end     
             if(0.6<Nj(j)&&Nj(j)<0.8||Nj(j) == 0.8)
                Nij(5,4) = Nij(5,4) + 1;
             end
             if(0.8<Nj(j)&&Nj(j)<1||Nj(j) == 1)
                Nij(5,5) = Nij(5,5) + 1;
            end   
       end
    end    
    
end

    X = 0;
    Nk = (k^2/2)/N;
    
    for i = 1:k/2
        for j = 1:k/2
            X = X + Nk*(Nij(i,j)- 1/Nk)^2;
        end
    end

    if(X<26.3)
        h = 0;
    else
        h = 1;
    end
end





