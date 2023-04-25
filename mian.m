clear
clc
Meals=1;%%%%餐次0：早餐，1：午餐，2：晚餐
rio=0.2;

%%%%%%%%%%%%%%%%%%%%数据处理%%%%%%%%%%%%%%%%%%%%%
%soup:汤的种类。ricedishes:米饭配菜种类。noodished：面条可选配菜种类
%soupdata:每种汤价格及营养元素，ricedata:每种米饭配菜价格及营养元素（荤素），nooddata:每种面条可选配菜价格及营养元素
%soupingre,riceingre,noodingre:每个菜所含原料
[soup,ricedishes,nooddishes,soupdata,ricedata,nooddata,soupingre,riceingre,noodingre,znood,znooddata,znoodingre]=redata2(Meals,rio);

num=size(ricedishes,2);%%可选米饭配菜数量
rice=4;                %%米饭数
noodles=1;             %%面条数
price=5*5;             %%五天总价格
nu=5*[68 1.7 0.05 0.575/5 30 0.4875 0.271875 18.75 0.0375 0.0375 2.5315];
ne=5*[0.10725,0.033,0.0825,0.00825,0.10725,0.0165,0.0099]; %%nu,ne五天总共需要的营养

xuqiu=[price nu ne];
zhuprice=rice*ricedata(num,1);
zhunu=rice*ricedata(num,2:12);
zhune=rice*ricedata(num,(12+[1 3 4 5 6 7 8]));
zhu=[zhuprice,zhunu,zhune]; %%%zhu：五天主食的价格及营养元素之和

Parent=Ge(soup,ricedishes,nooddishes,soupdata,ricedata,...
    nooddata,soupingre,riceingre,noodingre,rice,noodles,...
    xuqiu,zhu,num,znood,znooddata,znoodingre);%遗传算法返回推荐菜单

y=jieguo(Parent(1).x,nooddata,soupdata,ricedata,noodles,rice,zhu,znooddata);
duibi=[y/5;xuqiu/5];
duibi(:,4:5)=duibi(:,4:5)*5;
biaoge={'价格 ' '能量 ' '蛋白质 ' '脂肪 ' '碳水 ' 'Ca ' 'Fe' 'Zn' 'VitA' 'VitB1' 'VitB2' 'VitC' '谷物' '肉类' '奶制品'...
    '植物油' '蔬菜' '蛋类' '豆制品'}
for i=2:3
    for j=1:19
        biaoge(i,j)={duibi(i-1,j)};
    end
end
biaoge
x=Parent(1).x;
[y,yy]=daying(x,rice,noodles,ricedishes,nooddishes,soup,ricedata,...
    soupingre,riceingre,znood);
for i=1:rice+noodles
     str=['星期',num2str(i)];
     for j=1:5
         str=[str ' ' cell2mat(yy{i,j})];
     end
     disp([str]);
end
