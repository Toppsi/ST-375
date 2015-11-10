clear

%% load data
EtV = load('1V');
ToV = load('2V');
TreV = load('3V');
FireV = load('4V');
FemV = load('5V');

%% Konstanter
Fs = 500;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f

%% Finder mean
EtVmean = mean(EtV.data)
ToVmean = mean(ToV.data)
TreVmean = mean(TreV.data)
FireVmean = mean(FireV.data)
FemVmean = mean(FemV.data)

%% Finder afvigelsen

EtVafv = ((EtVmean-1)/1)*100
ToVafv = ((ToVmean-2)/2)*100
TreVafv = ((TreVmean-3)/3)*100
FireVafv = ((FireVmean-4)/4)*100
FemVafv = ((FemVmean-5)/5)*100

%% FFT af baseline
fftEtV = fft(EtV.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2 = abs(fftEtV/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

 %Plot the single-sided amplitude spectrum P1.
figure
plot(f,P1)
axis([-10 250 0 1.1])
title('Frekvensspektrum for USB-isolator ved inputspænding på 1V') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

