clear
close all
tic

format long
%%%%%%%%% fourth order

x=load('log27.txt');

y=x(:,1);
x=x(:,2);

% x=filter1(0.001,x,0,40);
% y=filter1(0.001,y,0,40);
x=x-mean(x);
y=y-mean(y);
y(1)=y(2);
x(1)=x(2);
[Hs,www]=tfestimate(x,y,[],[],length(x),1000);
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


data=iddata(y,x,0.001);
G=tfest(data,4,0);
t=[1:length(x)]*0.001-0.001;
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