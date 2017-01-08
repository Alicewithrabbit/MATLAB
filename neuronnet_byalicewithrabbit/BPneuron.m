%BPneuron 算法实现
%@Author：alicewithrabbit
%email：imroxaswc@gmail.com
%release date：2016/9/6
%未采用最新的feedforwardnet函数，感觉不太好用
%读取训练数据
clc;clear;
fid=fopen('Iris_train_data.txt');
train_data=textscan(fid, '%f%f%f%f%f',75);
f1=cell2mat(train_data(1));
f2=cell2mat(train_data(2));
f3=cell2mat(train_data(3));
f4=cell2mat(train_data(4));
class=cell2mat(train_data(5));
%[f1,f2,f3,f4,class] = textread('Iris_train_data.txt' , '%f%f%f%f%f',75);
%textread（） 被弃用，转用textscan（）
%特征值归一化
[input,ps] = mapminmax( [f1 , f2 , f3 , f4 ]') ;%建议使用mapminmax（）
%构造输出矩阵
s = length( class) ;
output = zeros( s , 3  ) ;
for i = 1 : s 
   output( i , class( i )  ) = 1 ;%得到期望输出矩阵
end
%创建神经网络
net = newff( minmax(input) , [10 3] , { 'tansig' 'purelin' } , 'traingdx' ) ; %第一层用双极型S型激活函数
                                                                              %第二层用线性激活函数
%设置训练参数
net.trainparam.show = 50 ;%显示中间结果的周期
net.trainparam.epochs = 500 ;%最大迭代次数
net.trainparam.goal = 0.01 ;%目标误差
net.trainParam.lr = 0.01 ;%学习率
%开始训练
net = train( net, input , output' ) ;
%读取测试数据
fid1=fopen('Iris_test_data.txt');
train_data=textscan(fid1, '%f%f%f%f%f',75);
t1=cell2mat(train_data(1));
t2=cell2mat(train_data(2));
t3=cell2mat(train_data(3));
t4=cell2mat(train_data(4));
class_2=cell2mat(train_data(5));
%[t1,t2,t3,t4,class_2] = textread('Iris_test_data.txt' , '%f%f%f%f%f',75);
%测试数据归一化
testInput = mapminmax( 'apply',[t1,t2,t3,t4]',ps) ;
%仿真
Y = sim( net , testInput ); 
%统计识别正确率
[s1 , s2] = size( Y ) ;
hitNum = 0 ;
for i = 1 : s2
    [m , Index] = max( Y( : ,  i ) ) ;
    if( Index  == class_2(i)   ) 
        hitNum = hitNum + 1 ; 
    end
end
sprintf('识别率是 %3.3f%%',100 * hitNum / s2 )