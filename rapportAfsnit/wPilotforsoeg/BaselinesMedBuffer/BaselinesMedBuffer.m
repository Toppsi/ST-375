clear

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f
get(0,'Factory');
set(0,'defaultfigurecolor',[1,1,1]);

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

 %% Finder v�rdien for enkelt grad:
 EnGradP = B1gPUdenOffset/90
 EnGradN = B1gNUdenOffset/90
 
 %% Finder v�rdien for de bestemte gr�nser
 ToGraderP = (EnGradP*2)
 ToGraderN = (EnGradN*2)
 
 OtteGraderP = (EnGradP*8)+ Baseline0gmean
 OtteGraderN = (EnGradN*8)+ Baseline0gmean
 
 TrettenGraderP = (EnGradP*13)+ Baseline0gmean
 TrettenGraderN = (EnGradN*13)+ Baseline0gmean
 
 FemogtyveGraderP = (EnGradP*25)
 FemogtyveGraderN = (EnGradN*25)

 
%% Plot af tidsgraf
figure
subplot(1,3,1)
plot(t, B0g1.data(1:L))
axis([0 30 1 2])
title('Volt m�lt ved de forskellige baselines (1. m�ling)')
xlabel('Tid i sekunder')
ylabel('Sp�nding m�lt i volt')
hold on
plot(t, B1gP1.data(1:L))
hold on
plot(t, B1gN1.data(1:L))

subplot(1,3,2)
plot(t, B0g2.data(1:L))
axis([0 30 1 2])
title('Volt m�lt ved de forskellige baselines (2. m�ling)')
xlabel('Tid i sekunder')
ylabel('Sp�nding m�lt i volt')
hold on
plot(t, B1gP2.data(1:L))
hold on
plot(t, B1gN2.data(1:L))

subplot(1,3,3)
plot(t, B0g3.data(1:L))
axis([0 30 1 2])
title('Volt m�lt ved de forskellige baselines (3. m�ling)')
xlabel('Tid i sekunder')
ylabel('Sp�nding m�lt i volt')
hold on
plot(t, B1gP3.data(1:L))
hold on
plot(t, B1gN3.data(1:L))

%% FFT af Baseline ved 0g
fftB0g1 = fft(B0g1.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B0g1 = abs(fftB0g1/L);
P1B0g1 = P2B0g1(1:L/2+1);
P1B0g1(2:end-1) = 2*P1B0g1(2:end-1);

%Plot the single-sided amplitude spectrum P1.
figure
subplot(3,1,1) %% Hvis det skal v�re i hver sin figur, s� slet det her
plot(f,P1B0g1)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g (1 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�ndingen m�lt i volt')
%% FFT af Baseline ved 0g 2 m�ling
fftB0g2 = fft(B0g2.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B0g2 = abs(fftB0g2/L);
P1B0g2 = P2B0g2(1:L/2+1);
P1B0g2(2:end-1) = 2*P1B0g2(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,2) %% Hvis det skal v�re i hver sin figur, s� slet det her
plot(f,P1B0g2)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g (2 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af Baseline ved 0g 3 m�ling
fftB0g3 = fft(B0g3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B0g3 = abs(fftB0g3/L);
P1B0g3 = P2B0g3(1:L/2+1);
P1B0g3(2:end-1) = 2*P1B0g3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,3) %% Hvis det skal v�re i hver sin figur, s� slet det her
plot(f,P1B0g3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g (3 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af baseline bed 1 g i positiv retning 1 m�ling
fftB1gP1 = fft(B1gP1.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gP1 = abs(fftB1gP1/L);
P1B1gP1 = P2B1gP1(1:L/2+1);
P1B1gP1(2:end-1) = 2*P1B1gP1(2:end-1);

%Plot the single-sided amplitude spectrum P1.
figure
subplot(3,1,1) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gP1)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i positiv retning (1 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af baseline bed 1 g i positiv retning 2 m�ling
fftB1gP2 = fft(B1gP2.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gP2 = abs(fftB1gP2/L);
P1B1gP2 = P2B1gP2(1:L/2+1);
P1B1gP2(2:end-1) = 2*P1B1gP2(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,2) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gP2)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i positiv retning (2 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af baseline bed 1 g i positiv retning 3 m�ling
fftB1gP3 = fft(B1gP3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gP3 = abs(fftB1gP3/L);
P1B1gP3 = P2B1gP3(1:L/2+1);
P1B1gP3(2:end-1) = 2*P1B1gP3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,3) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gP3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i positiv retning (3 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')


%% FFT af baseline bed 1 g i negativ retning 1 m�ling
fftB1gN1 = fft(B1gN1.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gN1 = abs(fftB1gN1/L);
P1B1gN1 = P2B1gN1(1:L/2+1);
P1B1gN1(2:end-1) = 2*P1B1gN1(2:end-1);

%Plot the single-sided amplitude spectrum P1.
figure
subplot(3,1,1) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gN1)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i negativ retning (1 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af baseline bed 1 g i negativ retning 2 m�ling
fftB1gN2 = fft(B1gN2.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gN2 = abs(fftB1gN2/L);
P1B1gN2 = P2B1gN2(1:L/2+1);
P1B1gN2(2:end-1) = 2*P1B1gN2(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,2) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gN2)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i negativ retning (2 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

%% FFT af baseline bed 1 g i negativ retning 3 m�ling
fftB1gN3 = fft(B1gN3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2B1gN3 = abs(fftB1gN3/L);
P1B1gN3 = P2B1gN3(1:L/2+1);
P1B1gN3(2:end-1) = 2*P1B1gN3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,3) %% Hvis det skal v�re i hver sin figur, s� skriv figure her i stedet for
plot(f,P1B1gN3)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g i negativ retning (3 m�ling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens m�lt i Hz')
ylabel('Sp�nding m�lt i volt')

A = max(fftB1gN3)
%plot(B0g3.data)

%% Beregning af t�rskelv�rdier:
ToGraderPT = (EnGradP*2)*3.6*9.1
ToGraderNT = (EnGradN*2)*3.6*9.1

OtteGraderPT = (EnGradP*8)*3.6*9.1
OtteGraderNT = (EnGradN*8)*3.6*9.1

TrettenGraderPT = (EnGradP*13)*3.6*9.1
TrettenGraderNT = (EnGradN*13)*3.6*9.1
 
FemogtyveGraderPT = (EnGradP*25)*3.6*9.1
FemogtyveGraderNT = (EnGradN*25)*3.6*9.1

ToGraderPT1 = (0.0037*2)*3.6*9.1
ToGraderNT1 = (-0.0036*2)*3.6*9.1

(1.6740-1.6325)/EnGradP
3/B1gPUdenOffset

%% Beregner sp�ndingen for 8 og 13 grader i positv og negativ retning
ToGraderPT = (EnGradP*2)*9.1
ToGraderNT = (EnGradN*2)*9.1

OtteGraderPositiv = (EnGradP*8)*9.1
OtteGraderNegativ = (EnGradN*8)*9.1

TrettenGraderPositiv = (EnGradP*13)*9.1
TrettenGraderNegativ = (EnGradN*13)*9.1

EnGradN*90*9.1*2
