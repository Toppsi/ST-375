clear

%% Loader data
A = load('Tretten_grader_30sek_hoejre');
B = load('Tretten_grader_30sek_venstre');

%% Finder mean
Amean = mean(A.data)    %Mean af A = 1.6441
Bmean = mean(B.data)    %Mean af B = 1.5231