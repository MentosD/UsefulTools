% ������¼�еĻ���ƫ��

function [y]=Removeexcursion(x,dt)
%xg=xg';x=xg(:);
%ȡ�źŵĳ���
n=length(x);  
%������ɢʱ��������
t=0:dt:dt*(n-1);
t=t';
%������϶���ʽ����
m=20;
%�������������ϵ������
a=polyfit(t,x,m);
%��x��ȥ����ʽϵ��a���ɵ�������
y=x-polyval(a,t);