function [h,X] = kafang(V)
%
%均匀性检验函数
%卡方检验: X^2 = (N/k - Ni)/(N/k)
%

n = size(V);

k = 10;

Ni = zeros(1,k);%各区间点数记录MATRIX
N = n(2);%所有点个数

for i = 1:N
    
    if(0<V(i)&&V(i)<0.1||V(i) == 0.1)
        
        Ni(1) = Ni(1) + 1;
 
    end
    
    if(0.1<V(i)&&V(i)<0.2||V(i) == 0.2)
        
        Ni(2) = Ni(2) + 1;
 
    end
    
    if(0.2<V(i)&&V(i)<0.3||V(i) == 0.3)
        
        Ni(3) = Ni(3) + 1;
 
    end
    
    if(0.3<V(i)&&V(i)<0.4||V(i) == 0.4)
        
        Ni(4) = Ni(4) + 1;
 
    end
    
    if(0.4<V(i)&&V(i)<0.5||V(i) == 0.5)
        
        Ni(5) = Ni(5) + 1;
 
    end
    
    if(0.5<V(i)&&V(i)<0.6||V(i) == 0.6)
        
        Ni(6) = Ni(6) + 1;
 
    end
    
    if(0.6<V(i)&&V(i)<0.7||V(i) == 0.7)
        
        Ni(7) = Ni(7) + 1;
 
    end
    
    if(0.7<V(i)&&V(i)<0.8||V(i) == 0.8)
        
        Ni(8) = Ni(8) + 1;
 
    end
    
    if(0.8<V(i)&&V(i)<0.9||V(i) == 0.9)
        
        Ni(9) = Ni(9) + 1;
 
    end
    
    if(0.9<V(i)&&V(i)<1||V(i) == 1)
        
        Ni(10) = Ni(10) + 1;
 
    end

end
    
    X = 0;

    for i = 1:k
        X = X + (N/10 - Ni(1))^2/(N/10);
    end

    if(X<16.919)
        h = 0;
    else
        h = 1;
    end
    
end