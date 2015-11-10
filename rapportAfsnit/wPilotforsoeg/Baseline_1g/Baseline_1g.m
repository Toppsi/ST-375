clear

%% Loader data

B1H = load('Baseline_30sek_1g_hoejre')
B1V = load('Baseline_30sek_1g_venstre')

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f

%% Finder mean
B1Hmean = mean(B1H.data)
B1Vmean = mean(B1V.data)


%% Minusser det offset vi har ved 0g som er  1.5817

B1HmeanUdenOffset = mean(B1H.data) - 1.5817
B1VmeanUdenOffset = mean(B1V.data) - 1.5817

%% Finder ændring for en grad:

EnGradH = B1HmeanUdenOffset/90
EnGradV = B1VmeanUdenOffset/90

%% Finder grænser:
TyveGraenseH = EnGradH*20
TyveGraenseH = EnGradV*20
TrediveGraenseH = EnGradH*30
TrediveGraenseV = EnGradV*30
FemogfyrreGraenseH = EnGradH*45
FemogfyrreGraenseV = EnGradV*45


%% FFT af baseline 1g til højre side
fftB1H = fft(B1H.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2H = abs(fftB1H/L);
P1H = P2H(1:L/2+1);
P1H(2:end-1) = 2*P1H(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
%Plotter vores frekvensgraf
figure
plot(f,P1H)
axis([-10 250 0 2])
title('Frekvensspektrum for baseline ved 1g til højre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% FFT af baseline ved 1g til venstre side

fftB1V = fft(B1V.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2V = abs(fftB1V/L);
P1V = P2V(1:L/2+1);
P1V(2:end-1) = 2*P1V(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
figure
plot(f,P1V)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g til venstre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')