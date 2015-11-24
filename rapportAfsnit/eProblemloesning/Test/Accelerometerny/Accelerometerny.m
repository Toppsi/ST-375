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
% HalvfemsPM1 = load('90graderPositivmaaling1');
% HalvfemsPM2 = load('90graderPositivmaaling2');
% HalvfemsPM3 = load('90graderPositivmaaling3');
TrettenPM1 = load('13graderPositivmaaling1');
TrettenPM2 = load('13graderPositivmaaling2');
TrettenPM3 = load('13graderPositivmaaling3');
OttePM1 = load('8graderPositivmaaling1');
OttePM2 = load('8graderPositivmaaling2');
OttePM3 = load('8graderPositivmaaling3');
NulM1 = load('0gradermaaling1');
NulM2 = load('0gradermaaling2');
NulM3 = load('0gradermaaling3');
OtteNM1 = load('8graderNegativmaaling1');
OtteNM2 = load('8graderNegativmaaling2');
OtteNM3 = load('8graderNegativmaaling3');
TrettenNM1 = load('13graderNegativmaaling1');
TrettenNM2 = load('13graderNegativmaaling2');
TrettenNM3 = load('13graderNegativmaaling3');
% HalvfemsNM1 = load('90graderNegativmaaling1');
% HalvfemsNM2 = load('90graderNegativmaaling2');
% HalvfemsNM3 = load('90graderNegativmaaling3');

% %% Gennemsnitsværdi for 90 postiv:
% HalvfemsPM1mean = mean(HalvfemsPM1.data)
% HalvfemsPM2mean = mean(HalvfemsPM2.data)
% HalvfemsPM3mean = mean(HalvfemsPM3.data)
% HalvfemsP = [HalvfemsPM1mean HalvfemsPM2mean HalvfemsPM3mean];
% HalvfemsGraderPositivMean = mean(HalvfemsP)

%% Gennemsnitsværdi for 13 grader positiv
TrettenPM1mean = mean(TrettenPM1.data)
TrettenPM2mean = mean(TrettenPM2.data)
TrettenPM3mean = mean(TrettenPM3.data)
TrettenP = [TrettenPM1mean TrettenPM2mean TrettenPM3mean];
TrettenGraderPositivMean = mean(TrettenP)

%% Gennemsnitsværdi for 8 grader positiv
OttePM1mean = mean(OttePM1.data)
OttePM2mean = mean(OttePM2.data)
OttePM3mean = mean(OttePM3.data)
OtteP = [OttePM1mean OttePM2mean OttePM3mean];
OtteGraderPositivMean = mean(OtteP)

%% Gennemsnitsværdi for 0 grader
NulM1mean = mean(NulM1.data)
NulM2mean = mean(NulM2.data)
NulM3mean = mean(NulM3.data)
Nul = [NulM1mean NulM2mean NulM3mean];
NulGraderMean = mean(Nul)

%% Gennemsnitsværdi for 8 grader Negativ
OtteNM1mean = mean(OtteNM1.data)
OtteNM2mean = mean(OtteNM2.data)
OtteNM3mean = mean(OtteNM3.data)
OtteN = [OtteNM1mean OtteNM2mean OtteNM3mean];
OtteGraderNegativMean = mean(OtteN)

%% Gennemsnitsværdi for 13 grader negativ
TrettenNM1mean = mean(TrettenNM1.data)
TrettenNM2mean = mean(TrettenNM2.data)
TrettenNM3mean = mean(TrettenNM3.data)
TrettenN = [TrettenNM1mean TrettenNM2mean TrettenNM3mean];
TrettenGraderNegativMean = mean(TrettenN)

% %% Gennemsnitsværdi for 90 grader negativ:
% HalvfemsNM1mean = mean(HalvfemsNM1.data)
% HalvfemsNM2mean = mean(HalvfemsNM2.data)
% HalvfemsNM3mean = mean(HalvfemsNM3.data)
% HalvfemsN = [HalvfemsNM1mean HalvfemsNM2mean HalvfemsNM3mean];
% HalvfemsGraderNegativMean = mean(HalvfemsN)


