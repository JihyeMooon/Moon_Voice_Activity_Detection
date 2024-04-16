clc
clear all;

[xp, fs]=audioread('data.wav'); 

%% Jihye's Scratch filtering
LPF_predata = 0;
cutoff = 128; %128, 256, 512   
tau = 1 / (cutoff * 2 * pi);
size=length(xp);
p=1;
ts = 1 / fs;

for i = 1:size
   sig(i) = (tau * LPF_predata + ts* xp(i)) / (tau + ts);
   LPF_predata = sig(i);
end  

%% Proposed HOEDO-based voice activity detection

order = 3;
[PH, DF, DF_]=Scratch_HOEDO(sig*fs, fs, order, cutoff);   

thr1=1500;
thr2=800000;
for n=1:length(DF)-1
    if DF(n)<thr1
        pitch(n)=0;
        sig_E(n)=0;
    elseif DF(n)>thr2
        pitch(n)=0;
        sig_E(n)=0;
    else 
        pitch(n)=PH(n);
        sig_E(n)=sig(n);
    end
end 
 
HOEDO = filter(ones(300,1)/300,1,pitch); 
 
%% Jihye's scratch AMDF-based voice activity detection
 
r2 = 64; %minimum F0 is r2
[AMDF]=Scratch_AMDF(sig, cutoff, r2);  

%% Jihye's scratch ACF-based voice activity detection
r1 = 300;
r2 = 64; %F0 ranges from r1 to r2
[ACF]=Scratch_ACF(sig, cutoff, r1, r2); 
  
%% HOEDO vs. AMDF vs. ACF
figure,
subplot(4,1,1)
plot(sig)
xlim([0,length(sig)])
xlabel('Speech Signal')
subplot(4,1,2)
hold on
grid on
plot(HOEDO*fs) 
xlim([0,length(HOEDO)]) 
ylim([0,600])
legend('HOEDO')  
xlabel('HOEDO')
subplot(4,1,3)
hold on 
grid on
plot(AMDF) 
xlim([0,length(AMDF)])
ylim([0,600])  
legend('AMDF')  
xlabel('AMDF')
subplot(4,1,4)
hold on 
grid on 
plot(ACF) 
xlim([0,length(ACF)])
ylim([0,600]) 
legend('ACF')  
xlabel('ACF')

 
