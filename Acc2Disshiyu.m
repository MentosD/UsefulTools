% ֱ�ӶԼ��ٶȼ�¼���л��֣���ʱ���ڻ��֣����ٶ�ʱ�����ڿ������Ա仯
function [u]=Acc2Disshiyu(xg,dt)
xg=xg';xg=xg(:);
xg=xg-mean(xg);
%xg=xg(:)-mean(xg);
v=xg;
u=xg;
xg(1)=0;
u(1)=0;
v(1)=0;
for j=2:length(xg)
    v(j)=dt*(xg(j-1)+xg(j))/2+v(j-1);
    u(j)=dt^2*(xg(j)+2*xg(j-1))/6+v(j-1)*dt+u(j-1);%����������ü��ٶ�ֱ�ӻ��ֵõ���λ�ƽ��
end
%v=v-mean(v);
%for j=2:length(xg)
%u(j)=dt*(v(j-1)+xg(j))/2+u(j-1);
%end
u=u(:);
v=v(:);
u=Removeexcursion(u,dt);     