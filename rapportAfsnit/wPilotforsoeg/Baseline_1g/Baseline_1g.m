clear

%% Loader data

A = load('Baseline_30sek_1g_hoejre')
B = load('Baseline_30sek_1g_venstre')

%% Finder mean
Amean = mean(A.data)
Bmean = mean(B.data)