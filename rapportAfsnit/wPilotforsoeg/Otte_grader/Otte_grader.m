clear

%% Loader data
A = load('Otte_grader_30sek_hoejre');
B = load('Otte_grader_30sek_venstre');

%% Finder mean

mean(A.data)    %Mean af otte grader til højre 1.6202
mean(B.data)    %Mean af otte grader til venstre 1.5436

