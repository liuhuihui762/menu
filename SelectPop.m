function p = SelectPop(Parent)
    % ������ѡ��
    % ����������ѡ�����ÿ�δ���Ⱥ��ȡ��һ���������壬Ȼ��ѡ��������õ�һ�������Ӵ���Ⱥ
    % �ظ��ò�����ֱ���µ���Ⱥ��ģ�ﵽԭ������Ⱥ��ģ
    n = numel(Parent); % ������Ⱥ�ĸ���
    index = randperm(n); % ����������У�ѡ��ǰ����
    p1 = Parent(index(1));% ��һ��
    p2 = Parent(index(2));% �ڶ���
    if p1.y < p2.y
        p = p1;
    else
        p = p2;
    end
end
