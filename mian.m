clear
clc
Meals=1;%%%%�ʹ�0����ͣ�1����ͣ�2�����
rio=0.2;

%%%%%%%%%%%%%%%%%%%%���ݴ���%%%%%%%%%%%%%%%%%%%%%
%soup:�������ࡣricedishes:�׷�������ࡣnoodished��������ѡ�������
%soupdata:ÿ�����۸�Ӫ��Ԫ�أ�ricedata:ÿ���׷���˼۸�Ӫ��Ԫ�أ����أ���nooddata:ÿ��������ѡ��˼۸�Ӫ��Ԫ��
%soupingre,riceingre,noodingre:ÿ��������ԭ��
[soup,ricedishes,nooddishes,soupdata,ricedata,nooddata,soupingre,riceingre,noodingre,znood,znooddata,znoodingre]=redata2(Meals,rio);

num=size(ricedishes,2);%%��ѡ�׷��������
rice=4;                %%�׷���
noodles=1;             %%������
price=5*5;             %%�����ܼ۸�
nu=5*[68 1.7 0.05 0.575/5 30 0.4875 0.271875 18.75 0.0375 0.0375 2.5315];
ne=5*[0.10725,0.033,0.0825,0.00825,0.10725,0.0165,0.0099]; %%nu,ne�����ܹ���Ҫ��Ӫ��

xuqiu=[price nu ne];
zhuprice=rice*ricedata(num,1);
zhunu=rice*ricedata(num,2:12);
zhune=rice*ricedata(num,(12+[1 3 4 5 6 7 8]));
zhu=[zhuprice,zhunu,zhune]; %%%zhu��������ʳ�ļ۸�Ӫ��Ԫ��֮��

Parent=Ge(soup,ricedishes,nooddishes,soupdata,ricedata,...
    nooddata,soupingre,riceingre,noodingre,rice,noodles,...
    xuqiu,zhu,num,znood,znooddata,znoodingre);%�Ŵ��㷨�����Ƽ��˵�

y=jieguo(Parent(1).x,nooddata,soupdata,ricedata,noodles,rice,zhu,znooddata);
duibi=[y/5;xuqiu/5];
duibi(:,4:5)=duibi(:,4:5)*5;
biaoge={'�۸� ' '���� ' '������ ' '֬�� ' '̼ˮ ' 'Ca ' 'Fe' 'Zn' 'VitA' 'VitB1' 'VitB2' 'VitC' '����' '����' '����Ʒ'...
    'ֲ����' '�߲�' '����' '����Ʒ'}
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
     str=['����',num2str(i)];
     for j=1:5
         str=[str ' ' cell2mat(yy{i,j})];
     end
     disp([str]);
end
