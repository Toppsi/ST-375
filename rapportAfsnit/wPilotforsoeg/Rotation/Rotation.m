clear

%%Loader data
RH = load('Rotation_30sek_hoejre')
RV = load('Rotation_30sek_venstre2')

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;

%% Plot af rotation i tidsdom�ne
figure
plot(t, RV.data(1:L))
axis([0 30 1 2])
title('Rotation til begge retninger')
xlabel('Tid angivet i sekunder')
ylabel('Sp�nding m�lt i Volt')
hold on

plot(t, RH.data(1:L))
axis([0 30 1 2])

%% FFT af rotation til h�jre side
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
title('Frekvensspektrum for rotation til h�jre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

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
title('Frekvensspektrum for rotation til venstre') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')