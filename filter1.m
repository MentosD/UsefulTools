%低通滤波或带通滤波
function new_a=filter1(dt,a,fmin,fmax)
%dt=t(2)-t(1);
n=length(a);
%t=(0:dt:dt*(n-1))';
nfft=2^nextpow2(n);
ni=round(fmin*nfft*dt+1);
na=round(fmax*nfft*dt+1);
y=fft(a,nfft);
a=zeros(1,nfft);
a(ni:na)=y(ni:na);
a(nfft-na+1:nfft-ni+1)=y(nfft-na+1:nfft-ni+1);
y=ifft(a,nfft);
new_a=(real(y(1:n)))';
