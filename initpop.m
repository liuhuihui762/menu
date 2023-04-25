function x=initpop(rice,noodles,nVar,ricesize,soupsize,noodsize,znoodsize)
x=zeros(1,nVar);
x(1:noodles)=randi([1,znoodsize],1,noodles);
x(noodles+1:2*noodles)=randi([0,noodsize],1,noodles);%面条配菜
x(1+2*noodles:2*noodles+rice)=randi([1,soupsize],1,rice);%米饭配汤
x(1+2*noodles+rice:end)=randi([0,ricesize],1,nVar-rice-2*noodles);%米饭配菜
