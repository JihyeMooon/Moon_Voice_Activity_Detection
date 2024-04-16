function [F0] = Scratch_AMDF(Ddata, wd, r2)  
pos=1; nsample=round(wd); %512 %256 %128
m=1;
full=length(Ddata); 
fh=str2func('boxcar'); 
W=window(fh,10);
Covdata=conv(Ddata, W); 
while (pos+nsample < full) 
     R=Covdata(pos:pos+nsample-1);
     F0(m) = AMDF_Final(R);  
     pos = pos + round(wd/2); %256 %128 %64
     m = m + 1;
end 
Fcount=1; 
finish=1;
while (finish+3<length(F0))
    Detection=F0(finish:finish+2);
    MAX=max(Detection); MIN=min(Detection); MEAN1=mean(Detection(1:2));MEAN2=(Detection(1)+Detection(3))/2;MEAN3=mean(Detection(2:3));
    Comparison=Detection(2);
    for mp=1:3
        if (Detection(mp)<MAX & Detection(mp)>MIN) 
            F0(finish)=Detection(mp);
        elseif (Detection(mp)==MEAN1 | Detection(mp)==MEAN2)
            F0(finish)=Detection(mp);
        elseif (Detection(mp)==MEAN3)
            F0(finish)=Detection(mp);
        end
    end  
    finish=finish+1;
end
F0=8000./F0;  

for n=1:length(F0);
 if F0(n)<r2;
    F0(n)=0;
 end
 
F0=F0';
max(F0)
min(F0)
mean(F0)
end