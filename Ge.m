function Parent=Ge(soup,ricedishes,nooddishes,soupdata,ricedata,...
    nooddata,soupingre,riceingre,noodingre,rice,noodles,xuqiu,zhu,num,znood,znooddata,znoodingre)
%%%%%%%%%%%%%%%%%%%%%%%�Ŵ��㷨

nVar = rice*4+noodles*2; % x�ĳ���
nPop = 40;  % ��Ⱥ��ģ��СΪ30
maxIt = 2000; % ����������
nPc = 0.8; % �Ӵ���ģ�ı���
nC = round(nPop * nPc/2)*2;% �Ӵ���ģ�Ĵ�С round(���ó���ӽ�������,ͬʱ����ż��������
nMu = 0.99; % �������Ϊ0.99

% �ýṹ�巽ʽ���洢������ʹ��x,y��һ���󶨵Ĺ�ϵ
template.x = []; % ģ��
template.y = []; % ģ��
% repmat������Ҫ�����ڿ��ٵĲ���һ����ľ���
Parent = repmat(template,nPop,1); % ��Ⱦɫ�壬����һ��30*1�ľ���ÿ�а���x��y

% ��ʼ����Ⱥ
for i = 1 : nPop
    Parent(i).x = initpop(rice,noodles,nVar,size(ricedishes,2),...
        size(soup,2),size(nooddishes,2),size(znood,2)); 
    Parent(i).y = fun3(Parent(i).x,nooddata,soupdata,ricedata,noodles,rice,xuqiu,zhu,soupingre,riceingre,znooddata,znoodingre,noodingre); % ������Ӧ�ȣ�Ҳ����Ŀ�꺯��
end
[~,so]= sort([Parent.y],'ascend');
fit=Parent(so(1)).y;


for It = 1 : maxIt
    Offspring = repmat(template,nC/2,2); % �ֳ�����Ϊ�˺ý������ݵĽ������
    for j = 1 : nC/2
        p1 = SelectPop(Parent);
        p2 = SelectPop(Parent);
        [Offspring(j,1).x, Offspring(j,2).x] = crossPop(p1.x, p2.x,noodles,rice); % ���н������
    end
    Offspring = Offspring(:); % ����е���ʽ,����дforѭ��

    for k = 1 : nC
        Offspring(k).x = mutatePop(Offspring(k).x,nMu,noodles,rice,size(nooddishes,2),...
        size(soup,2),size(ricedishes,2),size(znood,2)); % ���б������
%         Offspring(k).y = fun(Offspring(k).x,unitprice,nutrition,price,nu,rio);
         Offspring(k).y = fun3(Offspring(k).x,nooddata,soupdata,ricedata,noodles,rice,xuqiu,zhu,soupingre,riceingre,znooddata,znoodingre,noodingre);
    end
    newPop = [Parent;Offspring]; % �µ���Ⱥ
    % ~�ǲ�����˲�����sort���صĵ�һ����������ֵ��С���ڶ�������������ascend��Ϊ��������
    [~,so]= sort([newPop.y],'ascend'); % ��С�����yֵ��������
    newPop = newPop(so); % ˢ����Ⱥ����
    Parent = newPop(1 : nPop);
    fit=[fit Parent(1).y];
            disp(['����������',num2str(It), ', ��СֵΪ�� ', num2str(Parent(1).y)])
end
plot(fit)