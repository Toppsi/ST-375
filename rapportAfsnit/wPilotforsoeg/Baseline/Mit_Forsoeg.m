% PotShift1 = Potentiale1 - 1;                                            % Flytter hele datasættet 1 enhed ned ad y-aksen. Dette gøres fordi loggerpro har centreret vores data omkring 1 og ikke 0 ligner det.
A = load('Baseline_30sek_0g') 
B = A.data% Det samme som ovenover, bare for den anden skulder.
 
%% Hurtigt ufiltreret konvertering til frekvensdomæne %%
 
Fs = 500;                                                               % Vores samplingfrekvens
T = 1/Fs;                                                               % Sampletiden
L = 15050;                                                               % Datapunkter
NFFT = 2^nextpow2(L);                                                   % Næste faktor 2 fra L (1024) - bruges til Fast Fourier Transform (fft)
 
Y1 = fft(B,NFFT)/L;                                             % Fast Fourier-analyse (fft) på den ene skulder (fft er en transformation fra tidsdomænet til frekvensdomænet)
f = Fs*(0:(L/2))/L;                                      % Frekvensspektrummets x-akse

%% 

plot(A.data,L)

%% Nyt fors�g

A11=fft(B);
P2=(A11/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%plot(f,2*abs(Y1(1:NFFT/2+1)))
% plot(f,P1)                                                              % Plotter et ufiltreret frekvensspektrum for EMG-signalet (H�jre) % Plotter et ufiltreret frekvensspektret for venstre skulder
% ylim([0 0.1])
% xlim([0 5])
% ylabel('|Y(t)|')                                                        % Y aksens navn
% xlabel('Frekvens(Hz)')                                                  % X aksens navn
% title('Ufiltreret frekvensspektrum')