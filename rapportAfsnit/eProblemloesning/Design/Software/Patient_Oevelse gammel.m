clear
%%Load patienternes �velsesresultater hhv. 'anatomisk_dato' og 'SRT_dato'
%anatomisk = load('anatomisk_dato')
%SRT = load('SRT_dato')

%% Konstanter
Fs = 500;
Samplelength = 25;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;

%% Her plottes apopleksipatienternes h�ldningsgrad i tidsdom�ne
figure
plot(t, anatomisk.data(1:L))
axis([0 25 1 2])
title('Patient (indsaet navn) (indsaet dato) h�ldning')
xlabel('Tid angivet i sekunder')
ylabel('T�rskelv�rdier (sp�nding m�lt i Volt)')
legend('H�ldning til hhv. venstre og h�jre side')

%% Her plottes t�rskelv�rdierne
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