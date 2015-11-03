clear

%% Loader data
A = load('Baseline_30sek_0g')

%% Gennemsnitsværdi
Offset = mean(A.data)

%% FFT
Fs = 500;
T = 1/Fs;
N = length(A.data)

xdft = fft(A.data-Offset)/N;

freq = linspace(0,Fs/2,length(A.data)/2+1);

plot(freq,abs(xdft));

%A1 = fft(A.data, NFFT)/L;

%meanfreq(A.data)



A1 = fft(A.data)
