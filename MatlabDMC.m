lambda=10;
D=20;
N=30;
Nu=30;

 % pytanie co z tym, moze trzeba sobie zrobic ala PUSTY
load("Odpowiedz skokowa 1000.mat")
s = 0;
l = 0;

for i=1:500
    if(y(i)>48 && y(i) < 1037)
        l =  l+1
        i

        s(l) = y(i);
    end
end
s= s/1000;

M=zeros(N,Nu); 
for i=1:N
 for j=1:Nu
  if (j<=i)           
   M(i,j)=s(i-j+1);
  end
 end
end

I=eye(Nu);            
K=(M'*M+lambda*I)\M';  
Mp=zeros(N,D-1);  

for i=1:N
 for j=1:D-1
  if i+j<=D
   Mp(i,j)=s(i+j)-s(j);
  else
   Mp(i,j)=s(D)-s(j);
  end    
 end
end
%plot(s)
%title("Odpowiedz skokowa")
%To do mikrokontrolera
Ke=sum(K(1,:))       
Ku=K(1,:)*Mp;   
strjoin(arrayfun(@(x) num2str(x),Ku,'UniformOutput', false), 'f, ')