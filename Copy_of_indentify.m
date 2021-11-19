clear
close all
tic

format long
%%%%%%%%% fourth order

% x=load('log1234.txt');
x=OO*10;
% y=-(Usj(1:end-1)+0.17)*8;
y=-(Usj(1:end-1))*8-2.85;
x=double(x);
y=double(y);
dt=0.004;
% y=x(:,end-2);
% x=x(:,4);

% x=filter1(0.001,x,0,40);
% y=filter1(0.001,y,0,40);
% x=x-mean(x);
% x=x*5;
% y=y-mean(y);
% y(1)=y(2);
% x(1)=x(2);
[Hs,www]=tfestimate(x,y,[],[],length(x)*10,1/0.004);
mag2=abs(Hs);
pha2=angle(Hs)/pi*180;

figure(1)
subplot(121)
plot(www,[mag2],'linewidth',1)
xlim([0 30])
hold on
subplot(122)
plot(www,[pha2],'linewidth',1)
xlim([0 30])
hold on


data=iddata(y,x,dt);
G=tfest(data,2,1);
damp(G)
t=[1:length(x)]*dt-dt;
 y1=lsim(G,x,t);
 figure(2)
plot(t,[x,y,y1],'linewidth',1)
legend('com','resp','3^t^hmodel','location','best')
xlabel('t(s)');
ylabel('Dis.(mm)')


[mag,pha]=bode(G,www*2*pi);

 figure(1)
 subplot(121)
plot(www,mag(:),'linewidth',1)
xlim([0 30])
legend('ÊÔÑé','3½×´«µÝº¯Êý','location','best')
xlabel('w(Hz)');
ylabel('|Gst|')
 subplot(122)
plot(www,pha(:),'linewidth',1)
xlim([0 30])
xlabel('w(Hz)');
ylabel('<Gst(^o)')