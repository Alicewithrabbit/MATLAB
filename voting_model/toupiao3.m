row_2=28;%矩阵重构需要
if(find(a>27&a<43))%排除43后排序
        t=sort(a);%矩阵a排序
        [p]=find(a>27&a<43,psx-ruxuanrenshu);%找出大于2/3选票的候选人
        t=[p]
        rxrs=[rxrs,p]%更新入选人矩阵
        g1=size(t);%取得入选人数矩阵大小
        ruxuanrenshu=ruxuanrenshu+g1(2);%入选人数更新
%         agree_vector_2=agree_vector_2-g1(2);%赞成矩阵更新,如果赞成票上限是随机的，就注释掉
        if(ruxuanrenshu<11&&ruxuanrenshu>0)%第一轮入选人数大于0小于11
            for k=1:1:g1(2)
                indices = find(B==t(k));
                B(indices)=[];%找出后从总人数中去除
                row_2=row_2-1;%更新列数
            end
       B=reshape(B,row_2,colume);%重构偏好矩阵
       B=[
            B;
            zeros(g1(2),colume);%将去除部分变为全0
         ]        
       row=row-g1(2);%总候选人数更新
       ruxuan=ruxuan-g1(2);%待入选人数更新
       t1=sort(a);
       [p1]=find(a==t1(1),m);
       t1=[p1]
       t4=sort(a);
       [p4]=find(a==43);
       a(p4)=0;
       row %显示当前还剩余多少候选人
       ruxuanrenshu %显示已入选人数
       else%如果第一轮有11个入选，则结束投票
            fprintf('投票结束');
            toupiao_stop=1;%置位终止判断标志
            rxrs %入选人矩阵
       end       
else %第一轮入选人数为0
       t1=sort(a);
       [p1]=find(a==t1(1),m);
       t1=[p1]
       t4=sort(a);
       [p4]=find(a==43);
       a(p4)=0;
       row
       ruxuanrenshu
end    