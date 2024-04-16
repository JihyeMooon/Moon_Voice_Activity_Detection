function [FinishF0] = Scratch_ACF(Ddata, wd, r1, r2)  
pos=1; nsample=round(wd); %512 %256 %128
m=1;
full=length(Ddata); 
fh=str2func('boxcar');  
W=window(fh,10);
Covdata=conv(Ddata, W); 
while (pos+nsample < full) 
     R=Covdata(pos:pos+nsample-1);
     [F0(m),standard(m)] = Final_Auto(R); 
     pos = pos + round(wd/2); %256 %128 %64
     m = m + 1;
     if standard<0.64 | standard>1000
         F0(m)=0;
     end
end 
Fcount=1; 
finish=1;
while (finish+3<length(F0))
    Detection=F0(finish:finish+2);
    MAX=max(Detection); MIN=min(Detection); MEAN1=mean(Detection(1:2));MEAN2=(Detection(1)+Detection(3))/2;MEAN3=mean(Detection(2:3));
    Comparison=Detection(2);
    for mp=1:3
        if (Detection(mp)<MAX & Detection(mp)>MIN) 
            FinishF1(finish)=Detection(mp);
        elseif (Detection(mp)==MEAN1 | Detection(mp)==MEAN2)
            FinishF1(finish)=Detection(mp);
        elseif (Detection(mp)==MEAN3)
            FinishF1(finish)=Detection(mp);
        end
    end  
    finish=finish+1;
end
FinishF1=8000./FinishF1;
finish=1;
for n=1:length(FinishF1)
    ROUND=FinishF1(n)*100; ROUND=round(ROUND)/100;
    CROUND=62.7450980392157*100; CROUND=round(CROUND)/100; 
if (FinishF1(n) < r1 & FinishF1(n) > r2)
        FinishF0(finish) = FinishF1(n);
        finish=finish+1;
else
    FinishF0(finish) = 0;
        finish=finish+1;
end
end
FinishF0=FinishF0';
for n=1:length(FinishF0)
    if FinishF0(n)>249
        FinishF0(n)=0; 
    else 
        FinishF0(n)=FinishF0(n);
    end
end  
end  