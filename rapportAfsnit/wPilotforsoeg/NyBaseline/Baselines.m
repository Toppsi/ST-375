clear

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f

%% loader data
B0g1 = load('Baseline0g1');
B0g2 = load('Baseline0g2');
B0g3 = load('Baseline0g3');
B1gP1 = load('Baseline1gPositiv1');
B1gP2 = load('Baseline1gPositiv2');
B1gP3 = load('Baseline1gPositiv3');
B1gN1 = load('Baseline1gNegativ1');
B1gN2 = load('Baseline1gNegativ2');
B1gN3 = load('Baseline1gNegativ3');

%% Sætter længden af signalet til 30 sekunder
% B0g1 = B0g1Load.data(1:L);
% B0g2 = B0g2Load.data(1:L);
% B0g3 = B0g3Load.data(1:L);
% B1gP1 = B1gP1Load.data(1:L);
% B1gP2 = B1gP2Load.data(1:L);
% B1gP3 = B1gP3Load.data(1:L);
% B1gN1 = B1gN1Load.data(1:L);
% B1gN2 = B1gN2Load.data(1:L);
% B1gN3 = B1gN3Load.data(1:L);

%% Finder mean
 B0g1mean = mean(B0g1.data(1:L))
 B0g2mean = mean(B0g2.data(1:L))
 B0g3mean = mean(B0g3.data(1:L))
 Baseline0g = [B0g1mean B0g2mean B0g3mean]
 Baseline0gmean = mean(Baseline0g)
 
 B1gP1mean = mean(B1gP1.data(1:L))
 B1gP2mean = mean(B1gP2.data(1:L))
 B1gP3mean = mean(B1gP3.data(1:L))
 Baseline1gP = [B1gP1mean B1gP2mean B1gP3mean]
 Baseline1gPmean = mean(Baseline1gP)
 
 B1gN1mean = mean(B1gN1.data(1:L))
 B1gN2mean = mean(B1gN2.data(1:L))
 B1gN3mean = mean(B1gN3.data(1:L))
 Baseline1gN = [B1gN1mean B1gN2mean B1gN3mean]
 Baseline1gNmean = mean(Baseline1gN)
 
 %% Finder afvigelsen
 
 Baseline0gafv = ((Baseline0gmean-1.65)/1.65)*100
 
 %% Data uden offset
 B1gPUdenOffset = Baseline1gPmean - Baseline0gmean
 B1gNUdenOffset = Baseline1gNmean - Baseline0gmean

 %% Finder værdien for enkelt grad:
 EnGradP = B1gPUdenOffset/90
 EnGradN = B1gNUdenOffset/90
 
 %% Findedr værdien for de bestemte grænser
 OtteGraderP = EnGradP*8
 OtteGraderN = EnGradN*8
 
 TrettenGraderP = EnGradP*13
 TrettenGraderN = EnGradN*13
 
 FemogtyveGraderP = EnGradP*25
 FemogtyveGraderN = EnGradN*25
 
%% Plot af tidsgraf
figure
plot(t, B0g3.data(1:L))
axis([0 30 1 2])
title('Baseline ved de forskellige baseline 3. måling')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')
hold on
plot(t, B1gP3.data(1:L))
hold on
plot(t, B1gN3.data(1:L))


%% FFT af Baseline ved 0g
fftB0g3 = fft(B0g3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B0g3 = abs(fftB0g3/L);
P1B0g3 = P2B0g3(1:L/2+1);
P1B0g3(2:end-1) = 2*P1B0g3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
figure
subplot(3,1,1) %% Hvis det skal være i hver sin figur, så slet det her
plot(f,P1B0g3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% FFT af baseline bed 1 g i positiv retning
fftB1gP3 = fft(B1gP3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gP3 = abs(fftB1gP3/L);
P1B1gP3 = P2B1gP3(1:L/2+1);
P1B1gP3(2:end-1) = 2*P1B1gP3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,2) %% Hvis det skal være i hver sin figur, så skriv figure her i stedet for
plot(f,P1B1gP3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i positiv retning') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% FFT af baseline bed 1 g i negativ retning
fftB1gN3 = fft(B1gN3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gN3 = abs(fftB1gN3/L);
P1B1gN3 = P2B1gN3(1:L/2+1);
P1B1gN3(2:end-1) = 2*P1B1gN3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,3) %% Hvis det skal være i hver sin figur, så skriv figure her i stedet for
plot(f,P1B1gN3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i negativ retning') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')