%% Baseline Udregninger
clear

%% Loader data
A = load('Baseline_30sek_0g')

%% Gennemsnitsv�rdi
Offset = mean(A.data)
ForsoegsTid = 30;

%% FFT
Fs = 500;
T = 1/Fs;
L = length(A.data)                                                               % Datapunkter
NFFT = 2^nextpow2(L);                                                   % Næste faktor 2 fra L (1024) - bruges til Fast Fourier Transform (fft)

Y1 = fft(Offset,NFFT)/L;                                             % Fast Fourier-analyse (fft) på den ene skulder (fft er en transformation fra tidsdomænet til frekvensdomænet)
f = Fs/2*linspace(0,1,(NFFT/2)+1);

plot(f,2*abs(Y1(1:NFFT/2+1)))                                           % Plotter et ufiltreret frekvensspektrum for EMG-signalet (H�jre)
ylabel('|Y(t)|')                                                        % Y aksens navn
xlabel('Frekvens(Hz)')                                                  % X aksens navn
title('Ufiltreret frekvensspektrum')                                    % Titlen