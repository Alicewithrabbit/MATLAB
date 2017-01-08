clc;
a=zeros(1,28);%生成一个1x28的全零阵统计票数
for i=1:1:colume
    if(agree_vector_2(i)==0)%判断是否全部为弃权票
        continue;
    else   
        for j=1:1:agree_vector_2(i)%统计赞成票数
            for d=1:1:row
                switch(B(j,i))
                    case rank(d)
                        a(rank(d))=a(rank(d))+1;%计票数          
                    otherwise;
                end
            end
        end
    end     
end

