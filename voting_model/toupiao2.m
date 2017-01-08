g=size(t1)
row_1=28;
for i=1:1:g(2)
      indices_2 = find(B==t1(i));
      indices_3 = find(rank==t1(i));
      B(indices_2)=[]
      rank(indices_3)=[];
      row=row-1;%计数需要
      row_1=row_1-1;%矩阵重构需要
      B=reshape(B,row_1,colume);
end
B=[
     B;
     zeros(g(2),colume);
 ]      
  