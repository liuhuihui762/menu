function p = mutatePop(x,mu,noodles,rice,noodsize,soupsize,ricesize,znoodsize)
   % �������
   if noodles>0 && rand <= mu % ����һ��rand�ǵõ�һ����(0,1)֮����ȷֲ���α�����
       s = randi([1,noodles],1,1);
       d=randi([1,znoodsize],1,1);
       x(s)=d;
   end
   
   if noodles>0 && rand <= mu % ����һ��rand�ǵõ�һ����(0,1)֮����ȷֲ���α�����
       s = randi([noodles+1,2*noodles],1,1);
       d=randi([0,noodsize],1,1);
       x(s)=d;
   end
   if rice>0 && rand <= mu % ����һ��rand�ǵõ�һ����(0,1)֮����ȷֲ���α�����
       s = randi([1+2*noodles,2*noodles+rice],1,1);
       d=randi([1,soupsize],1,1);
       x(s)=d;
   end
   if rand <= mu % ����һ��rand�ǵõ�һ����(0,1)֮����ȷֲ���α�����
       s = randi([1+2*noodles+rice,size(x,2)],1,1);
       d=randi(ricesize,1,1);
       x(s)=d;
   end
   p = x;
   
end
