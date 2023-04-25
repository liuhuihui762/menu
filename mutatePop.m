function p = mutatePop(x,mu,noodles,rice,noodsize,soupsize,ricesize,znoodsize)
   % 单点变异
   if noodles>0 && rand <= mu % 单独一个rand是得到一个在(0,1)之间均匀分布的伪随机数
       s = randi([1,noodles],1,1);
       d=randi([1,znoodsize],1,1);
       x(s)=d;
   end
   
   if noodles>0 && rand <= mu % 单独一个rand是得到一个在(0,1)之间均匀分布的伪随机数
       s = randi([noodles+1,2*noodles],1,1);
       d=randi([0,noodsize],1,1);
       x(s)=d;
   end
   if rice>0 && rand <= mu % 单独一个rand是得到一个在(0,1)之间均匀分布的伪随机数
       s = randi([1+2*noodles,2*noodles+rice],1,1);
       d=randi([1,soupsize],1,1);
       x(s)=d;
   end
   if rand <= mu % 单独一个rand是得到一个在(0,1)之间均匀分布的伪随机数
       s = randi([1+2*noodles+rice,size(x,2)],1,1);
       d=randi(ricesize,1,1);
       x(s)=d;
   end
   p = x;
   
end
