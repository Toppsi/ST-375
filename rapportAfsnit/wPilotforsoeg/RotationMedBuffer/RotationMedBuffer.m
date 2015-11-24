clear

%%Loader data
RH = load('Rotation_30sek_hoejre')
RV = load('Rotation_30sek_venstre')

%% Konstanter
Fs = 500;
Samplelength = 25;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;

%% Plot af rotation i tidsdomæne
figure
plot(t, RV.data(1:L))
axis([0 25 1 2])
title('Rotation til begge retninger')
xlabel('Tid angivet i sekunder')
ylabel('Spænding målt i Volt')
hold on

plot(t, RH.data(1:L))
axis([0 25 1 2])

%% FFT af rotation til højre side
fftRH = fft(RH.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2H = abs(fftRH/L);
P1H = P2H(1:L/2+1);
P1H(2:end-1) = 2*P1H(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
%Plotter vores frekvensgraf
figure
subplot(2,1,1)
plot(f,P1H)
axis([-10 250 0 0.001])
title('Frekvensspektrum for rotation i positiv retning') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens målt i Hz')
ylabel('Spænding målt i Volt')

%% FFT af rotation til venstre side

fftRV = fft(RV.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2V = abs(fftRV/L);
P1V = P2V(1:L/2+1);
P1V(2:end-1) = 2*P1V(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1.
subplot(2,1,2)
plot(f,P1V)
axis([-10 250 0 0.001])
title('Frekvensspektrum for rotation i negativ retning') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens målt i Hz')
ylabel('Spænding målt i Volt')

%% RMS på rotation til højre side:
RMSRH = rms(P2H) 
%0.0141 V vil give en dæmpning på -15,24 dB og en faktor 0.173 og et 3. orden lavpasfilter 
%% RMS på rotation til venstre side:
RMSRV = rms(P2V) 
%0.0118 V vil give en dæmpning på -13,69 dB og en faktor 0.207 og et 3. orden lavpasfilter

