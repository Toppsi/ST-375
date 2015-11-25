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
For301V1 = load('301V_maaling1');
For301V2 = load('301V_maaling2');
For301V3 = load('301V_maaling3');
For842V1 = load('842V_maaling1');
For842V2 = load('842V_maaling2');
For842V3 = load('842V_maaling3');
ForNegativ294V1 = load('negativ294V_maaling1');
ForNegativ294V2 = load('negativ294V_maaling2');
ForNegativ294V3 = load('negativ294V_maaling3');
ForNegativ819V1 = load('negativ819V_maaling1');
ForNegativ819V2 = load('negativ819V_maaling2');
ForNegativ819V3 = load('negativ819V_maaling3');

%% Gennemsnitsværdi
For301V1mean = mean(For301V1.data)
For301V2mean = mean(For301V2.data)
For301V3mean = mean(For301V3.data)
For301V = [For301V1mean For301V2mean For301V3mean];
For301Vmean = mean(For301V)

For842V1mean = mean(For842V1.data)
For842V2mean = mean(For842V2.data)
For842V3mean = mean(For842V3.data)
For842V = [For842V1mean For842V2mean For842V3mean];
For842Vmean = mean(For842V)

ForNegativ294V1mean = mean(ForNegativ294V1.data)
ForNegativ294V2mean = mean(ForNegativ294V2.data)
ForNegativ294V3mean = mean(ForNegativ294V3.data)
ForNegativ294V = [ForNegativ294V1mean ForNegativ294V2mean ForNegativ294V3mean];
ForNegativ294Vmean = mean(ForNegativ294V)

ForNegativ819V1mean = mean(ForNegativ819V1.data)
ForNegativ819V2mean = mean(ForNegativ819V2.data)
ForNegativ819V3mean = mean(ForNegativ819V3.data)
ForNegativ819V = [ForNegativ819V1mean ForNegativ819V2mean ForNegativ819V3mean];
ForNegativ819Vmean = mean(ForNegativ819V)


