function [pF0, F1, F2]=Scratch_HOEDO(x, fs, k, cutoff)
%% K Order Differential Energy Operator
ts = 1 / fs; 
LPF_predata = 0;
tau = 1 / (cutoff * 2 * pi);
size=length(x);
p=1; 

LPFdata=x;
F(1) = 0;
F2(1)=0; F1(1)=0;
for n = 2:size-2
        F2(n) = (LPFdata(n) * LPFdata(n)) - (LPFdata(n - 1) * LPFdata(n + 1));
        F1(n) = (LPFdata(n) * LPFdata(n + 1)) - (LPFdata(n - 1) * LPFdata(n + 2));  
end
for m = 2:size-2
		preF1 = (F1(m) + F1(m - 1)) / 2;
		preF2 = (F2(m)) * 2;
        cpreF = acos(preF1 / preF2);
        cpreF=real(cpreF);
        pF0(p) = cpreF*(1 / (2 * pi))*(1 / (k - 1));
        p=p+1;
end
 
