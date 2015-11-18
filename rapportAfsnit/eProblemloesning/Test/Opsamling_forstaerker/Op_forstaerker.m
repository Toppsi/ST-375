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
For271V1 = load('271Vmaaling1');
For271V2 = load('271Vmaaling2');
For271V3 = load('271Vmaaling3');
For0V1= load('0Vmaaling1');
For0V2 = load('0Vmaaling2');
For0V3 = load('0Vmaaling3');
For266V1 = load('266Vmaaling1');
For266V2 = load('266Vmaaling2');
For266V3 = load('266Vmaaling3');

%% Gennemsnitsværdi
For271V1mean = mean(For271V1.data)
For271V2mean = mean(For271V2.data)
For271V3mean = mean(For271V3.data)
For271V = [For271V1mean For271V2mean For271V3mean];
For271Vmean = mean(For271V)

For0V1mean = mean(For0V1.data)
For0V2mean = mean(For0V2.data)
For0V3mean = mean(For0V3.data)
For0V = [For0V1mean For0V2mean For0V3mean];
For0Vmean = mean(For0V)

For266V1mean = mean(For266V1.data)
For266V2mean = mean(For266V2.data)
For266V3mean = mean(For266V3.data)
For266V = [For266V1mean For266V2mean For266V3mean];
For266Vmean = mean(For266V)

%% Plotter tidsgrafen
%figure
%plot(t, Off159V1.data(1:L))
% axis([0 30 -0.5 0.5])
% title('Volt målt inputspænding 1.59V(1. måling)')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')