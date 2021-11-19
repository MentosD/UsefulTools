% 直接对加速度记录进行积分，在时域内积分，加速度时间间隔内考虑线性变化
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
    u(j)=dt^2*(xg(j)+2*xg(j-1))/6+v(j-1)*dt+u(j-1);%这个代码是用加速度直接积分得到的位移结果
end
%v=v-mean(v);
%for j=2:length(xg)
%u(j)=dt*(v(j-1)+xg(j))/2+u(j-1);
%end
u=u(:);
v=v(:);
u=Removeexcursion(u,dt);     