function [soup,ricedishes,nooddishes,soupdata,ricedata,nooddata,soupingre,riceingre,noodingre,znood,znooddata,znoodingre]=redata2(Meals,rio)
Meals=num2str(Meals);
%%%%%%导入数据%%%%%%%%%%%%%
Ingredients=readtable('data.xlsx','sheet',1);
Menus=readtable('data.xlsx','sheet',2);
Prices=readtable('data.xlsx','sheet',3);
%%%%%%%%数据预处理%%%%%%%%%%
ingredients=table2cell(Ingredients);
menus=table2cell(Menus);
prices=table2cell(Prices);



t={0};
t1={};
soup={};
nooddishes={};
ricedishes={};
dj=0;
sj=0;
nj=0;
soupdata=zeros(1,23);
nooddata=zeros(1,23);
ricedata=zeros(1,24);
soupingre=zeros(1,5);
noodingre=zeros(1,5);
riceingre=zeros(1,5);



for i=1:size(menus,1)
    if ismember(Meals,cell2mat(menus(i,3)))
        if 3==cell2mat(menus(i,7))
            if isequal(t,{0})
                sj=1;
                soup={menus(i,2)};
                ing=find(ismember(ingredients(:,2),menus(i,5)),1);
                kg=cell2mat(menus(i,6));
                soupdata(sj,1)=soupdata(sj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                soupdata(sj,2:12)=soupdata(sj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                soupdata(sj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
                t=menus(i,2);
                continue;
            end
            if isequal(t,menus(i,2))
                ing=[ing find(ismember(ingredients(:,2),menus(i,5)),1)];
                kg=[kg cell2mat(menus(i,6))];
                soupdata(sj,1)=soupdata(sj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                soupdata(sj,2:12)=soupdata(sj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                soupdata(sj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=...
                    soupdata(sj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))+cell2mat(menus(i,6));
                continue
            end
            soup{end+1}=menus(i,2);
            if sj~=0
                kg=(find(kg/sum(kg)>rio));
                soupingre(sj,1:size(kg,2))=ing(kg);
                
            end
            ing=find(ismember(ingredients(:,2),menus(i,5)),1);
            kg=cell2mat(menus(i,6));
            sj=sj+1;
            soupdata(sj,1)=cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
            soupdata(sj,2:12)=cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
            soupdata(sj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
            t=menus(i,2);
        else
            if isequal(t,{0})
                ingr=find(ismember(ingredients(:,2),menus(i,5)),1);
                kgr=cell2mat(menus(i,6));
                dj=1;
                ricedata(dj,24)=cell2mat(menus(i,7));
                ricedishes={menus(i,2)};
                ricedata(dj,1)=ricedata(dj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                ricedata(dj,2:12)=ricedata(dj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                ricedata(dj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
                t=menus(i,2);
                continue;
            end
            if isequal(t,menus(i,2))
                ingr=[ingr find(ismember(ingredients(:,2),menus(i,5)),1)];
                kgr=[kgr cell2mat(menus(i,6))];
                ricedata(dj,1)=ricedata(dj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                ricedata(dj,2:12)=ricedata(dj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                ricedata(dj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=...
                     ricedata(dj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))+cell2mat(menus(i,6));
                continue
            end
            ricedishes{end+1}=menus(i,2);
            if dj~=0
                kgr=(find(kgr/sum(kgr)>rio));
                riceingre(dj,1:size(kgr,2))=ingr(kgr);
            end
            dj=dj+1;
            ingr=find(ismember(ingredients(:,2),menus(i,5)),1);
            kgr=cell2mat(menus(i,6));
            ricedata(dj,24)=cell2mat(menus(i,7));
            ricedata(dj,1)=cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
            ricedata(dj,2:12)=cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
            ricedata(dj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
            t=menus(i,2);
        end
        if cell2mat(menus(i,8))==1
            if isequal(t1,{0})
                ingn=find(ismember(ingredients(:,2),menus(i,5)),1);
                kgn=cell2mat(menus(i,6));
                nj=1;
                nooddishes={menus(i,2)};
                nooddata(nj,1)=nooddata(nj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                nooddata(nj,2:12)=nooddata(nj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                nooddata(nj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
                t1=menus(i,2);
                continue;
            end
            if isequal(t1,menus(i,2))
                ingn=[ingn find(ismember(ingredients(:,2),menus(i,5)),1)];
                kgn=[kgn cell2mat(menus(i,6))];
                nooddata(nj,1)=nooddata(nj,1)+cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
                nooddata(nj,2:12)=nooddata(nj,2:12)+cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
                nooddata(nj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=...
                    nooddata(nj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))+cell2mat(menus(i,6));
                continue
            end
            nooddishes{end+1}=menus(i,2);
            if nj~=0
                kgn=(find(kgn/sum(kgn)>rio));
                noodingre(nj,1:size(kgn,2))=ingr(kgn);
            end
            ingn=find(ismember(ingredients(:,2),menus(i,5)),1);
            kgn=cell2mat(menus(i,6));
            nj=nj+1;
            nooddata(nj,1)=cell2mat(menus(i,6))*...
                    cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
            nooddata(nj,2:12)=cell2mat(menus(i,6))...
                    *cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),7:17));
            nooddata(nj,12+cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5)),1),6)))=cell2mat(menus(i,6));
            t1=menus(i,2);
        end
   
    end
end
kg=(find(kg/sum(kg)>rio));
soupingre(sj,1:size(kg,2))=ing(kg);

kgr=(find(kgr/sum(kgr)>rio));
riceingre(dj,1:size(kgr,2))=ingr(kgr);

kgn=(find(kgn/sum(kgn)>rio));
noodingre(nj,1:size(kgn,2))=ingn(kgn);

znood=ricedishes(1,end);
znooddata=ricedata(end,:);
znoodingre=riceingre(end,:);

ricedishes=ricedishes(1,1:end-1);
ricedata=ricedata(1:end-1,:);
riceingre=riceingre(1:end-1,:);



% unitprice=zeros(1,size(dishes,2));
% nutrition=zeros(size(dishes,2),11);
% need=zeros(size(dishes,2),11);
% 
% soupunitprice=zeros(1,size(dishes,2));
% soupnutrition=zeros(size(dishes,2),11);
% soupneed=zeros(size(dishes,2),11);
% 
% 
% t=menus(1,2);
% j=1;
% unitprice(j)=cell2mat(menus(1,6))*cell2mat(prices(find(ismember(prices(:,2),menus(1,5))),3));
% nutrition(j,:)=cell2mat(menus(1,6))*cell2mat(ingredients(find(ismember(ingredients(:,2),menus(1,5))),7:17));
% need(j,cell2mat(ingredients(find(ismember(ingredients(:,2),menus(1,5))),6)))=cell2mat(menus(1,6));
% for i=2:size(menus,1)
%     if isequal(t,menus(i,2))
%         unitprice(j)=unitprice(j)+cell2mat(menus(i,6))*cell2mat(prices(find(ismember(prices(:,2),menus(i,5))),3));
%         nutrition(j,:)=nutrition(j,:)+cell2mat(menus(i,6))*cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5))),7:17));
%         need(j,cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5))),6)))=cell2mat(menus(i,6));
%         continue
%     end
%     j=j+1;
%     unitprice(j)=unitprice(j)+cell2mat(menus(i,6))*cell2mat(prices(find(ismember(prices(:,2),menus(i,5)),1),3));
%     need(j,cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5))),6)))=cell2mat(menus(i,6));
%     nutrition(j,:)=nutrition(j,:)+cell2mat(menus(i,6))*cell2mat(ingredients(find(ismember(ingredients(:,2),menus(i,5))),7:17));
%     t=menus(i,2);
% end
% rk=0;
% nk=0;
% for i=1:size(dishes,2)
%     if isequal(dishes{1,i},{'米饭'})
%         rk=i;
%     end
%       if isequal(dishes{1,i},{'青菜肉丝炒面'})
%         nk=i;
%     end
% end
% dishes(1,[rk,nk,size(dishes,2)-1,size(dishes,2)])=dishes(1,[size(dishes,2)-1,size(dishes,2),rk,nk]);
% mev(1,[rk,nk,size(dishes,2)-1,size(dishes,2)])=mev(1,[size(dishes,2)-1,size(dishes,2),rk,nk]);
% unitprice(1,[rk,nk,size(dishes,2)-1,size(dishes,2)])=unitprice(1,[size(dishes,2)-1,size(dishes,2),rk,nk]);
% nutrition([rk,nk,size(dishes,2)-1,size(dishes,2)],:)=nutrition([size(dishes,2)-1,size(dishes,2),rk,nk],:);
% need([rk,nk,size(dishes,2)-1,size(dishes,2)],:)=need([size(dishes,2)-1,size(dishes,2),rk,nk],:);
