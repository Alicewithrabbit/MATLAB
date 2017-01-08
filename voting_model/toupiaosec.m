clc;
a=zeros(1,28);
for i=1:1:colume
    if(agree_vector_2(i)==0)%判断是否全部为弃权票
        continue;
    else   
        for j=1:1:agree_vector_2(i)%统计赞成票数
            for d=1:1:n
                switch(B(j,i))
                    case rank(d)
                        a(rank(d))=a(rank(d))+1;%计票数          
                    otherwise;
                end
            end
        end
    end     
end
t4=sort(a);
[p4]=find(a==0);
a(p4)=43;%为不影响后面排序暂时将0转换为43