function p = SelectPop(Parent)
    % 锦标赛选择法
    % 锦标赛方法选择策略每次从种群中取出一定数量个体，然后选择其中最好的一个进入子代种群
    % 重复该操作，直到新的种群规模达到原来的种群规模
    n = numel(Parent); % 父代种群的个数
    index = randperm(n); % 随机打乱序列，选中前两个
    p1 = Parent(index(1));% 第一个
    p2 = Parent(index(2));% 第二个
    if p1.y < p2.y
        p = p1;
    else
        p = p2;
    end
end
