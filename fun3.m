function y=fun3(x,nooddata,soupdata,ricedata,noodles,rice,xuqiu,zhu,soupingre,riceingre,znooddata,znoodingre,noodingre)
znood=x(1:noodles);
nood=x(noodles+1:2*noodles);
soup=x(1+2*noodles:2*noodles+rice);
ri=x(1+2*noodles+rice:end);
zhu=zhu+sum(nooddata(nood(nood>0),[1:13 15:20]),1)...
     +sum(soupdata(soup(soup>0),[1:13 15:20]),1)...
     +sum(ricedata(ri(ri>0),[1:13 15:20]),1)...
     +sum(znooddata(znood(znood>0),[1:13 15:20]),1);%计算当前食谱的价格和营养元素
zhu(4)=zhu(4)*9/zhu(2);%%计算脂肪占比
zhu(5)=zhu(5)*4/zhu(2);%%计算碳水占比
yy=abs(zhu-xuqiu);%%当前食谱与标准的差值
yy(6)=yy(6)*4.3;%%%%提高Ca的权重
if yy(1)>2.5    %%%%每日价格浮动上下0.5元，大于此范围加入惩罚项
    yy(1)=yy(1)*100;
end
y=sum(yy./xuqiu); %%%偏差求和
hs=ricedata(ri(ri>0),24);
a1=sum(hs==1);
a2=sum(hs==2);
if a1<rice || a2<rice %%%%%若荤菜或素材数量小于米饭的天数 加入惩罚
    y=y+100;
end
b1=soupingre(soup(soup>0),:);
b2=riceingre(ri(ri>0),:);
b=[b1;b2];
numPercClass = sum(histc(b,[1:100]),2);%%%%若同一天推荐的菜中有重复主菜，加入惩罚
y=y+sum(numPercClass>rice)*300;

b3=znoodingre(znood(znood>0),:);
b4=noodingre(nood(nood>0),:);
b=[b3;b4];
numPercClass = sum(histc(b,[1:100]),2);
y=y+sum(numPercClass>noodles)*300;

