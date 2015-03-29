%transfer.m


f = sym('f');
numerator = 5623;
denominator = (1+f/.205)*(1+f/200)*(1+f/1000)*(1+f/30000);
polynomial_denominator = sym2poly(denominator);
A = tf(numerator, polynomial_denominator);

%Set all the formatting for graphs and reported values
format long;
freq_range = {1 100000000};
figure('Position', [10, 10, 1200, 800]);

% Get gain margin, phase margin, frequency of -180 phase shift if applicable
[gm, pm, w_gm, w_pm] = margin(A);
gm_db = mag2db(gm);

% Find maximum value of Beta such that A(180)*Beta <= 1
beta_max = A(w_gm)^(-1)

% Formatting requires using sprintf to get the number of decimal places nice, and then
% wrapping that in a disp() to prevent octave from throwing out "ans = " and an extra \n
disp("Gain margin in dB is:"), disp(sprintf("%.2f",gm_db))
disp("Gain margin frequency:"), disp(sprintf("%.0f", w_gm))
disp("Phase margin frequency:"), disp(sprintf("%.0f", w_pm))
disp("Max Beta to ensure stability:"), disp(sprintf("%.5f", beta_max))

bode(A, freq_range, "o")
pause() %one can also call the script from bash with $octave --persist to make it hang around