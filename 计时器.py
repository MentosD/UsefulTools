import time
time_start = time.time()    #开始计时
for i in range (1 , 10):
  time.sleep(1)             #等待1秒
time_end = time.time()      #结束计时
print('计算结束,用时',time_end-time_start,'秒','平均每步用时',(time_end-time_start) / 100,'秒')
