%Matlab ModalAnalysis 模态分析
%振型和频率按照阶数排序
%《结构动力学》P106页算例

M = [2 0 0;
    0 1.5 0
    0 0 1];
K = 600* [5 -2 0;
          -2 3 -1;
          0 -1 1];

[V,D]=eig(inv(M)*K);
freq=diag(D).^0.5;
[Bc,ord] = sort(freq);          %ord为记录顺序的向量
wsc=freq(ord);                  %角（圆）频率 rad/s
fsc=wsc/2/pi;                   %频率 Hz
V=V(:,ord);                     %振型按频率阶数排序  一阶振型是第一列
