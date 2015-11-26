clear

%% Konstanter
Fs = 500;
Samplelength = 1;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f
get(0,'Factory');
set(0,'defaultfigurecolor',[1,1,1]);

%% Loader data
Maaling1 = load('Maaling1');
Maaling2 = load('Maaling2');
Maaling3 = load('Maaling3');
Maaling4 = load('Maaling4');
Maaling5 = load('Maaling5');

Matrix1 = [Maaling1];
Matrix2 = [Maaling2];
Matrix3 = [Maaling3];
Matrix4 = [Maaling4];
Matrix5 = [Maaling5];

%% Plotter tidsgrafen
figure
subplot(3,2,1)
plot(t, Maaling1.data(1:L))
axis([0 0.1 -3.5 3.5])
title('Måling 1: 100Hz frekvens, 6.0294Vpp')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')
  
subplot(3,2,2)
plot(t, Maaling2.data(1:L))
axis([0 0.1 -3.5 3.5])
title('Måling 2: 100Hz frekvens, 5.8800Vpp')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')
  
subplot(3,2,3)
plot(t, Maaling3.data(1:L))
axis([0 0.1 -5 5])
title('Måling 3: 100Hz frekvens, 8Vpp')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')
  
subplot(3,2,5)
plot(t, Maaling4.data(1:L))
axis([0 0.1 -3.5 3.5])
title('Måling 4: 25Hz frekvens, 6.0294Vpp')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')
 
subplot(3,2,6)
plot(t, Maaling5.data(1:L))
axis([0 0.1 -3.5 3.5])
title('Måling 5: 25Hz frekvens, 5.8800Vpp')
xlabel('Tid i sekunder')
ylabel('Spænding målt i Volt')

%% Udregn gennemsnit for VPP

%VppMaaling1=Matrix1.data(3:5:750);
meanVppmaaling1=2.5989

meanVppmaaling2=2.5284
 
meanVppmaaling3=4.0442
 
meanVppmaaling4=3.0689
 
meanVppmaaling5=2.9207