clear
%%Load patienternes øvelsesresultater hhv. 'anatomisk_dato' og 'SRT_dato'
%anatomisk = load('anatomisk_dato')
%SRT = load('SRT_dato')

%% Konstanter
Fs = 500;
Samplelength = 25;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;

%% Her plottes apopleksipatienternes hældningsgrad i tidsdomæne
figure
plot(t, anatomisk.data(1:L))
axis([0 25 1 2])
title('Patient (indsaet navn) (indsaet dato) hældning')
xlabel('Tid angivet i sekunder')
ylabel('Tærskelværdier (spænding målt i Volt)')
legend('Hældning til hhv. venstre og højre side')

%% Her plottes tærskelværdierne
xL = get(gca,'XLim');
line(xL,[0 0],'Color','g');
line(xL,[0.2412 0.2412],'Color','g');
line(xL,[0.9648 0.9648],'Color','y');
line(xL,[1.5679 1.5679],'Color','r');
line(xL,[3.0151 3.0151],'Color','k');
line(xL,[-0.2353 -0.2353],'Color','g');
line(xL,[-0.9413 -0.9413],'Color','y');
line(xL,[-1.5297 -1.5297],'Color','r');
line(xL,[-2.9417 -2.9417],'Color','k');