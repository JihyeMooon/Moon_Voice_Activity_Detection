function [Result] = AMDF_Final(data)  
Full=length(data);
for k = 1:Full-1
    E = 0;
    for n = 1:Full - k - 1
        E = E + abs((data(n + k))-(data(n)));
    end 
    px3(k) = E;
end  
FirstData=px3(1); 
ind=0;
size=length(px3) -1;
i=2;
while i<size
    if px3(i-1)>px3(i) & px3(i)<px3(i+1)
        ind=i;
        break;
    end
    i=i+1;
end 
Result=i; 