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
For135V1 = load('135Vmaaling1');
For135V2 = load('135Vmaaling2');
For135V3 = load('135Vmaaling3');
For0V1 = load('0Vmaaling1');
For0V2 = load('0Vmaaling2');
For0V3 = load('0Vmaaling3');


%% Gennemsnitsværdi
For135V1mean = mean(For135V1.data)
For135V2mean = mean(For135V2.data)
For135V3mean = mean(For135V3.data)
For135V = [For135V1mean For135V2mean For135V3mean];
For135Vmean = mean(For135V)

For0V1mean = mean(For0V1.data)
For0V2mean = mean(For0V2.data)
For0V3mean = mean(For0V3.data)
For0V = [For0V1mean For0V2mean For0V3mean];
For0Vmean = mean(For0V)