clear

%% Loader data
A = load('Baseline_30sek_0g')

%% Gennemsnitsværdi
Offset = mean(A.data)

%% FFT
Fs = 500;
T = 1/Fs;
N = length(A.data)

Y = fft(A.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
f = Fs*(0:(N/2))/N;
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')


%xdft = fft(A.data-Offset)/N;

%freq = linspace(0,Fs/2,length(A.data)/2+1);

%plot(freq,abs(xdft));

