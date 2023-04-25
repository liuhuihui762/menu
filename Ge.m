function Parent=Ge(soup,ricedishes,nooddishes,soupdata,ricedata,...
    nooddata,soupingre,riceingre,noodingre,rice,noodles,xuqiu,zhu,num,znood,znooddata,znoodingre)
%%%%%%%%%%%%%%%%%%%%%%%遗传算法

nVar = rice*4+noodles*2; % x的长度
nPop = 40;  % 种群规模大小为30
maxIt = 2000; % 最大迭代次数
nPc = 0.8; % 子代规模的比例
nC = round(nPop * nPc/2)*2;% 子代规模的大小 round(）得出最接近的整数,同时进行偶数化操作
nMu = 0.99; % 变异概率为0.99

% 用结构体方式来存储变量，使得x,y有一个绑定的关系
template.x = []; % 模板
template.y = []; % 模板
% repmat函数主要是用于快速的产生一个大的矩阵
Parent = repmat(template,nPop,1); % 父染色体，产生一个30*1的矩阵，每行包括x和y

% 初始化种群
for i = 1 : nPop
    Parent(i).x = initpop(rice,noodles,nVar,size(ricedishes,2),...
        size(soup,2),size(nooddishes,2),size(znood,2)); 
    Parent(i).y = fun3(Parent(i).x,nooddata,soupdata,ricedata,noodles,rice,xuqiu,zhu,soupingre,riceingre,znooddata,znoodingre,noodingre); % 计算适应度，也就是目标函数
end
[~,so]= sort([Parent.y],'ascend');
fit=Parent(so(1)).y;


for It = 1 : maxIt
    Offspring = repmat(template,nC/2,2); % 分成两列为了好进行数据的交叉操作
    for j = 1 : nC/2
        p1 = SelectPop(Parent);
        p2 = SelectPop(Parent);
        [Offspring(j,1).x, Offspring(j,2).x] = crossPop(p1.x, p2.x,noodles,rice); % 进行交叉操作
    end
    Offspring = Offspring(:); % 变成列的形式,便于写for循环

    for k = 1 : nC
        Offspring(k).x = mutatePop(Offspring(k).x,nMu,noodles,rice,size(nooddishes,2),...
        size(soup,2),size(ricedishes,2),size(znood,2)); % 进行变异操作
%         Offspring(k).y = fun(Offspring(k).x,unitprice,nutrition,price,nu,rio);
         Offspring(k).y = fun3(Offspring(k).x,nooddata,soupdata,ricedata,noodles,rice,xuqiu,zhu,soupingre,riceingre,znooddata,znoodingre,noodingre);
    end
    newPop = [Parent;Offspring]; % 新的种群
    % ~是不输出此参数，sort返回的第一个参数是数值大小，第二个是索引，’ascend’为升序排列
    [~,so]= sort([newPop.y],'ascend'); % 从小到大对y值进行排列
    newPop = newPop(so); % 刷新种群排序
    Parent = newPop(1 : nPop);
    fit=[fit Parent(1).y];
            disp(['迭代次数：',num2str(It), ', 最小值为： ', num2str(Parent(1).y)])
end
plot(fit)