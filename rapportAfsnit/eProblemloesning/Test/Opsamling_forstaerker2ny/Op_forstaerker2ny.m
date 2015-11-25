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

%% Loader data
For313V1 = load('313V_maaling1');
For313V2 = load('313V_maaling2');
For313V3 = load('313V_maaling3');
ForN313V1= load('negativ323V_maaling1');
ForN313V2 = load('negativ323V_maaling2');
ForN313V3 = load('negativ323V_maaling3');

%% Gennemsnitsværdi
For313V1mean = mean(For313V1.data)
For313V2mean = mean(For313V2.data)
For313V3mean = mean(For313V3.data)
For313V = [For313V1mean For313V2mean For313V3mean];
For313Vmean = mean(For313V)

ForN313V1mean = mean(ForN313V1.data)
ForN313V2mean = mean(ForN313V2.data)
ForN313V3mean = mean(ForN313V3.data)
ForN313V = [ForN313V1mean ForN313V2mean ForN313V3mean];
ForN313Vmean = mean(ForN313V)

%% Plotter tidsgrafen
%figure
%plot(t, Off159V1.data(1:L))
% axis([0 30 -0.5 0.5])
% title('Volt målt inputspænding 1.59V(1. måling)')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')