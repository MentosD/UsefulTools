% 消除记录中的基线偏移

function [y]=Removeexcursion(x,dt)
%xg=xg';x=xg(:);
%取信号的长度
n=length(x);  
%建立离散时间列向量
t=0:dt:dt*(n-1);
t=t';
%读入拟合多项式阶数
m=20;
%计算趋势项待定系数向量
a=polyfit(t,x,m);
%用x减去多项式系数a生成的趋势项
y=x-polyval(a,t);