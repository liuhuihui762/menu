function [y1,y2] = crossPop(x1, x2,noodles,rice)
    %���㽻��
    
    n = numel(x1)-2*noodles-rice;% ����׷���˵ĳ���
    s1 = randi([1, n-1]);% ���ѡ��һ������㣬n-1��������Ϊ���ѡ�����һλ�����൱��û�н���
   
    
    
    y1 = [x1(1:s1+2*noodles+rice+1)  x2(s1+2*noodles+rice+2:end)];% ����
    y2 = [x2(1:s1+2*noodles+rice+1)  x1(s1+2*noodles+rice+2:end)];% ����
end
