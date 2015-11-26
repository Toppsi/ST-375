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
Off0V1 = load('0Vmaaling1');
Off0V2 = load('0Vmaaling2');
Off0V3 = load('0Vmaaling3');
Off130V1 = load('130Vmaaling1');
Off130V2 = load('130Vmaaling2');
Off130V3 = load('130Vmaaling3');
Off196V1 = load('196Vmaaling1');
Off196V2 = load('196Vmaaling2');
Off196V3 = load('196Vmaaling3');


%% Gennemsnitsværdi
Off0V1mean = mean(Off0V1.data)
Off0V2mean = mean(Off0V2.data)
Off0V3mean = mean(Off0V3.data)
Off0V = [Off0V1mean Off0V2mean Off0V3mean];
Off0Vmean = mean(Off0V)

Off130V1mean = mean(Off130V1.data)
Off130V2mean = mean(Off130V2.data)
Off130V3mean = mean(Off130V3.data)
Off130V = [Off130V1mean Off130V2mean Off130V3mean];
Off130Vmean = mean(Off130V)

Off196V1mean = mean(Off196V1.data)
Off196V2mean = mean(Off196V2.data)
Off196V3mean = mean(Off196V3.data)
Off196V = [Off196V1mean Off196V2mean Off196V3mean];
Off196Vmean = mean(Off196V)

% %% Plotter tidsgrafen
% figure
% plot(t, Off159V1.data(1:L))
% axis([0 30 -0.5 0.5])
% title('Volt målt inputspænding 1.59V(1. måling)')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')