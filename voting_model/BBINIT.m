% @author： alicewithrabbit
% @gmail：imroxaswc@gmail.com
% @date：2016/8/27
clc,clear;
n=12;%根据每次的赞成票数上限定
row=28;%行数，重构矩阵用
ruxuan=12;%待入选数
m=1;%投票上限与入围数上限的差，用于第二轮淘汰多少人
psx=11;%投票上限
toupiao_stop=0;%终止判断标志
colume=42;%列数，重构矩阵用
rank=[1:1:28];%若无2/3多数票时最终入围人数
char r;
ruxuanrenshu=0;%有2/3多数票时统计人数用
rxrs=[];%2/3多数票入选矩阵
agree=rand(1,42);%生成42列随机数，用于生成随机赞成票数
LEVEL_A=[1;2;3;4];%候选人七级平价
LEVEL_B=[5;6;7;8];
LEVEL_C=[9;10;11;12];
LEVEL_D=[13;14;15;16];
LEVEL_E=[17;18;19;20];
LEVEL_F=[21;22;23;24];
LEVEL_G=[25;26;27;28];
% B=[
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);    
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);
%     randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);randperm(28);
% ];%评委偏好矩阵
B=[ LEVEL_A(randperm(4),:); %一个评委的对七级选手们的偏好，由于对科研，对学术，对科研+学术的有偏好的
    LEVEL_B(randperm(4),:); %评委平均，所以采用均匀随机生成。
    LEVEL_C(randperm(4),:);
    LEVEL_D(randperm(4),:);
    LEVEL_E(randperm(4),:);
    LEVEL_F(randperm(4),:);
    LEVEL_G(randperm(4),:);
    ]
for i=1:1:41   
B=[B [ LEVEL_A(randperm(4),:); %所有评委偏好矩阵
    LEVEL_B(randperm(4),:);
    LEVEL_C(randperm(4),:);
    LEVEL_D(randperm(4),:);
    LEVEL_E(randperm(4),:);
    LEVEL_F(randperm(4),:);
    LEVEL_G(randperm(4),:);
    ] ];
end
% B=B';
% agree_vector_2=[
%    11,11,11,11,11,11,11,...
%    11,11,11,11,11,11,11,...
%    11,11,11,11,11,11,11,...
%    11,11,11,11,11,11,11,...
%    11,11,11,11,11,11,11,...
%    11,11,11,11,11,11,11,...
% ]
agree_vector_1=ruxuan*agree;
agree_vector_2=round(agree_vector_1);%不同的评委每次投的赞成票数量随机（0，11）
