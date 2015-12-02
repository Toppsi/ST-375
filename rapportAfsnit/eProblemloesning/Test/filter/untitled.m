%data=xlsread('lavpas.xlsx');
C=data(:,1);
D=data(:,2);
%plot(Frekvenser,Daempning)
%A = [10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50];	
%B = [0.0594 0.0785 0.063 0.035 -0.006 -0.066 -0.149 -0.26 -0.404 -0.587 -0.813 -1.087 -1.41 -1.784 -2.194 -2.663 -3.173 -3.72 -4.298 -4.901 -5.523 -6.158 -6.801 -7.449 -8.098 -8.745 -9.388 -10.025 -10.655 -11.278 -11.891 -12.495 -13.089 -13.673 -14.248 -14.811 -15.364 -15.912 -16.4 -16.97 -17.468];
C = [10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50];	
D = [-0.021 -0.058 -0.138 -0.295 -0.571 -1.030 -1.655 -2.510 -3.556 -4.730 -6.003 -7.318 -8.628 -9.950 -11.209 -12.490 -13.697 -14.953 -15.950 -17.075 -18.077]
x = 10:2:50;

index = find(C==25);
Y_point = D(index)
indexB = find(C==45);
Y_point1 = D(indexB)

figure
semilogx(x,D,C(index),Y_point,'o',C(indexD),Y_point1,'o')
xlabel('Frekvens (Hz)')
ylabel('Forst�rkning i dB')
str1 = '(25 Hz, 2.7360 dB)';
text(C(index),Y_point, str1,'HorizontalAlignment','right');
str2 = '(45 Hz, 14.8480 dB)';
text(C(indexD),Y_point1,str2,'HorizontalAlignment','right');