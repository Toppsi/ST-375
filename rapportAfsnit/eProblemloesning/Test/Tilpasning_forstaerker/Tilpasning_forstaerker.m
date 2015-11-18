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
For488V1 = load('488Vmaaling1');
For488V2 = load('488Vmaaling2');
For488V3 = load('488Vmaaling3');
For135V1 = load('135Vmaaling1');
For135V2 = load('135Vmaaling2');
For135V3 = load('135Vmaaling3');
For0V1 = load('0Vmaaling1');
For0V2 = load('0Vmaaling2');
For0V3 = load('0Vmaaling3');
ForNegativ133V1 = load('Negativ133Vmaaling1');
ForNegativ133V2 = load('Negativ133Vmaaling2');
ForNegativ133V3 = load('Negativ133Vmaaling3');
ForNegativ478V1 = load('Negativ478Vmaaling1');
ForNegativ478V2 = load('Negativ478Vmaaling2');
ForNegativ478V3 = load('Negativ478Vmaaling3');

%% Gennemsnitsværdi
For488V1mean = mean(For488V1.data)
For488V2mean = mean(For488V2.data)
For488V3mean = mean(For488V3.data)
For488V = [For488V1mean For488V2mean For488V3mean];
For488Vmean = mean(For488V)

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

ForNegativ133V1mean = mean(ForNegativ133V1.data)
ForNegativ133V2mean = mean(ForNegativ133V2.data)
ForNegativ133V3mean = mean(ForNegativ133V3.data)
ForNegativ133V = [ForNegativ133V1mean ForNegativ133V2mean ForNegativ133V3mean];
ForNegativ133Vmean = mean(ForNegativ133V)

ForNegativ478V1mean = mean(ForNegativ478V1.data)
ForNegativ478V2mean = mean(ForNegativ478V2.data)
ForNegativ478V3mean = mean(ForNegativ478V3.data)
ForNegativ478V = [ForNegativ478V1mean ForNegativ478V2mean ForNegativ478V3mean];
ForNegativ478Vmean = mean(ForNegativ478V)


