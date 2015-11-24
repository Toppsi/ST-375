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
% Off159V1 = load('159Vmaaling1');
% Off159V2 = load('159Vmaaling2');
% Off159V3 = load('159Vmaaling3');
Off133V1 = load('133Vmaaling1');
Off133V2 = load('133Vmaaling2');
Off133V3 = load('133Vmaaling3');
Off186V1 = load('186Vmaaling1');
Off186V2 = load('186Vmaaling2');
Off186V3 = load('186Vmaaling3');


%% Gennemsnitsværdi
% Off159V1mean = mean(Off159V1.data)
% Off159V2mean = mean(Off159V2.data)
% Off159V3mean = mean(Off159V3.data)
% Off159V = [Off159V1mean Off159V2mean Off159V3mean];
% Off159Vmean = mean(Off159V)

Off133V1mean = mean(Off133V1.data)
Off133V2mean = mean(Off133V2.data)
Off133V3mean = mean(Off133V3.data)
Off133V = [Off133V1mean Off133V2mean Off133V3mean];
Off133Vmean = mean(Off133V)

Off186V1mean = mean(Off186V1.data)
Off186V2mean = mean(Off186V2.data)
Off186V3mean = mean(Off186V3.data)
Off186V = [Off186V1mean Off186V2mean Off186V3mean];
Off186Vmean = mean(Off186V)

% %% Plotter tidsgrafen
% figure
% plot(t, Off159V1.data(1:L))
% axis([0 30 -0.5 0.5])
% title('Volt målt inputspænding 1.59V(1. måling)')
% xlabel('Tid i sekunder')
% ylabel('Spænding målt i Volt')