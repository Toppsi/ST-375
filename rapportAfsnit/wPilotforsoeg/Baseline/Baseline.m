clear

%% Loader data
B0 = load('Baseline_30sek_0g')

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f
%% Gennemsnitsværdi
Offset = mean(B0.data)

%% plot af baseline
figure
plot(B0.data)

%% FFT af baseline
fftB = fft(B0.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2 = abs(fftB/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

 %Plot the single-sided amplitude spectrum P1.
figure
plot(f,P1)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('frekvens (Hz)')
ylabel('volt (V)')




