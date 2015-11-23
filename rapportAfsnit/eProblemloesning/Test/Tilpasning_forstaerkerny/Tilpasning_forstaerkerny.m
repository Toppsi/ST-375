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
For271V1 = load('271maaling1');
For271V2 = load('271maaling2');
For271V3 = load('271maaling3');
For75V1 = load('75maaling1');
For75V2 = load('75maaling2');
For75V3 = load('75maaling3');
% For0V1 = load('0maaling1');
% For0V2 = load('0maaling2');
% For0V3 = load('0maaling3');
ForNegativ73V1 = load('73Negativmaaling1');
ForNegativ73V2 = load('73Negativmaaling2');
ForNegativ73V3 = load('73Negativmaaling3');
ForNegativ266V1 = load('266Negativmaaling1');
ForNegativ266V2 = load('266Negativmaaling2');
ForNegativ266V3 = load('266Negativmaaling3');

%% Gennemsnitsværdi
For271V1mean = mean(For271V1.data)
For271V2mean = mean(For271V2.data)
For271V3mean = mean(For271V3.data)
For271V = [For271V1mean For271V2mean For271V3mean];
For271Vmean = mean(For271V)

For75V1mean = mean(For75V1.data)
For75V2mean = mean(For75V2.data)
For75V3mean = mean(For75V3.data)
For75V = [For75V1mean For75V2mean For75V3mean];
For75Vmean = mean(For75V)

% For0V1mean = mean(For0V1.data)
% For0V2mean = mean(For0V2.data)
% For0V3mean = mean(For0V3.data)
% For0V = [For0V1mean For0V2mean For0V3mean];
% For0Vmean = mean(For0V)

ForNegativ73V1mean = mean(ForNegativ73V1.data)
ForNegativ73V2mean = mean(ForNegativ73V2.data)
ForNegativ73V3mean = mean(ForNegativ73V3.data)
ForNegativ73V = [ForNegativ73V1mean ForNegativ73V2mean ForNegativ73V3mean];
ForNegativ73Vmean = mean(ForNegativ73V)

ForNegativ266V1mean = mean(ForNegativ266V1.data)
ForNegativ266V2mean = mean(ForNegativ266V2.data)
ForNegativ266V3mean = mean(ForNegativ266V3.data)
ForNegativ266V = [ForNegativ266V1mean ForNegativ266V2mean ForNegativ266V3mean];
ForNegativ266Vmean = mean(ForNegativ266V)


