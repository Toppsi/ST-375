clear

%% Loader data
TrettenH = load('Tretten_grader_30sek_hoejre');
TrettenV = load('Tretten_grader_30sek_venstre');

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f

%% Finder mean
TrettenHmean = mean(TrettenH.data)    %Mean af A = 1.6441
TrettenVmean = mean(TrettenV.data)    %Mean af B = 1.5231

%% FFT af baseline ved 8 grader til højre side
fftTrettenH = fft(TrettenH.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2H = abs(fftTrettenH/L);
P1H = P2H(1:L/2+1);
P1H(2:end-1) = 2*P1H(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
%Plotter vores frekvensgraf
figure
plot(f,P1H)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 13 grader til højre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% FFT af baseline ved 8 grader til venstre side

fftTrettenV = fft(TrettenV.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2V = abs(fftTrettenV/L);
P1V = P2V(1:L/2+1);
P1V(2:end-1) = 2*P1V(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
figure
plot(f,P1V)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 13 grader til venstre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')