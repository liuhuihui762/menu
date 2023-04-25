function y=jieguo(x,nooddata,soupdata,ricedata,noodles,rice,zhu,znooddata)
znood=x(1:noodles);
nood=x(noodles+1:2*noodles);
soup=x(1+2*noodles:2*noodles+rice);
ri=x(1+2*noodles+rice:end);
zhu=zhu+(sum(nooddata(nood(nood>0),[1:13 15:20]),1)...
     +sum(soupdata(soup(soup>0),[1:13 15:20]),1)...
     +sum(ricedata(ri(ri>0),[1:13 15:20]),1))...
     +sum(znooddata(znood(znood>0),[1:13 15:20]),1);

zhu(4)=zhu(4)*9/zhu(2);
zhu(5)=zhu(5)*4/zhu(2);
y=zhu;