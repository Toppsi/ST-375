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

Matrix1 = [Maaling1]
Matrix2 = [Maaling2]
Matrix3 = [Maaling3]
Matrix4 = [Maaling4]
Matrix5 = [Maaling5]

%% Plotter tidsgrafen
% figure
% subplot(3,2,1)
% plot(t, Maaling1.data(1:L))
% axis([0 0.1 -0.4 0.4])
% title('Måling 1: 100Hz frekvens, 0.6626Vpp')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')
% 
% subplot(3,2,2)
% plot(t, Maaling2.data(1:L))
% axis([0 0.1 -0.4 0.4])
% title('Måling 2: 100Hz frekvens, 0.6466Vpp')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')
% 
% subplot(3,2,3)
% plot(t, Maaling3.data(1:L))
% axis([0 0.1 -5 5])
% title('Måling 3: 100Hz frekvens, 8Vpp')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')
% 
% subplot(3,2,5)
% plot(t, Maaling4.data(1:L))
% axis([0 0.1 -0.4 0.4])
% title('Måling 4: 25Hz frekvens, 0.6626Vpp')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')
% 
% subplot(3,2,6)
% plot(t, Maaling5.data(1:L))
% axis([0 0.1 -0.4 0.4])
% title('Måling 5: 25Hz frekvens, 0.6466Vpp')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')

%% Udregn gennemsnit for VPP

VppMaaling1=Matrix1.data(5:5:600);
meanVppmaaling1=mean(VppMaaling1)

VppMaaling2=Matrix2.data(3:5:600);
meanVppmaaling2=mean(VppMaaling2)

VppMaaling3=Matrix3.data(4:5:600);
meanVppmaaling3=mean(VppMaaling3)

meanVppmaaling4=0.3377

meanVppmaaling5=0.3287