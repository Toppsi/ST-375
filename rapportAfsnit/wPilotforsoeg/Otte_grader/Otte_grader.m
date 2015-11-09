clear

%% Loader data
OtteH = load('Otte_grader_30sek_hoejre');
OtteV = load('Otte_grader_30sek_venstre');

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f

%% Finder mean

OtteHmean = mean(OtteH.data)    %Mean af otte grader til højre 1.6202
OtteVmean = mean(OtteV.data)    %Mean af otte grader til venstre 1.5436

%% Mean med offset minusset fra

OtteHmeanUdenOffset = mean(OtteH.data) - 1.5817
OtteVmeanUdenOffset = mean(OtteV.data) - 1.5817

%% FFT af baseline ved 8 grader til højre side
fftOtteH = fft(OtteH.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2H = abs(fftOtteH/L);
P1H = P2H(1:L/2+1);
P1H(2:end-1) = 2*P1H(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
%Plotter vores frekvensgraf
figure
plot(f,P1H)
axis([-10 250 0 2])
title('Frekvensspektrum for baseline ved 8 grader til højre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% FFT af baseline ved 8 grader til venstre side

fftOtteV = fft(OtteV.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2V = abs(fftOtteV/L);
P1V = P2V(1:L/2+1);
P1V(2:end-1) = 2*P1V(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
figure
plot(f,P1V)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 8 grader til venstre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

