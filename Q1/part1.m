x=load('attr.txt');
[m,n]=size(x)
bestinit=zeros(6,n);
minerror=realmax;
initi=0;
while(initi<10)
    initi=initi+1

u=zeros(6,n);
ran=randi(m,6,1);
for i=[1:6]
 
    u(i,:)=x(ran(i),:);
    initval=u;
end
counter=0;
c=zeros(m,1);
prevc=zeros(m,1);

while(counter<50)
    counter=counter+1;
    for i=[1:m]
        matr=double(zeros(6,1));
        for j=[1:6]
            
            matr(j,1)=norm(x(i,:)-u(j,:));
            
        end
        
        
        
        
        temp=find(matr==min(matr));
        c(i,1)=temp(1,1);
        
        
    end
   
    for i=[1:6]
        count=sum(c==i);
        summ=u(i,:);
        if(count>0)
        summ=zeros(1,n);
        for j=[1:m]
            if(c(j,1)==i)
                summ=summ+x(j,:);
            end
           
        end
        summ=summ/count;
 
        end
        u(i,:)=summ;
        
    
    end
    if(prevc==c)
        break
    else
        prevc=c;
    end
    
    
    
end

finalc=zeros(m,1);
for i=[1:m]
    vals=zeros(6,1);
    for j=[1:6]
        vals(j,1)=sumsqr(x(i,:)-u(j,:));
    end
    temp1=find(vals==min(vals));
    finalc(i,1)=temp1(1,1);
    
end


Jvalues=zeros(6,1);
for i=[1:m]
    index=finalc(i,1);
    Jvalues(index,1)=Jvalues(index,1)+sumsqr(x(i,:)-u(index,:));
end
 err=sum(Jvalues)
if(err<minerror)
    minerror=err;
    bestinit=initval;
end
end
%bestinit
minerror





