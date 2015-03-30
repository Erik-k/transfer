%transfer.m

pkg load symbolic
pkg load control
clear all;
f = sym('f');

%Set all the formatting for graphs and reported values
format long;

values = transfermenu;


number_of_zeros = length(values.zeros);
number_of_poles = length(values.poles);

if (length(values.DC) > 0)
	if (values.DC ~= 0)
		numerator = values.DC;
	else
		numerator = 1;
	endif
else
	numerator = 1;
endif

if (number_of_zeros ~= 0)
	for val = values.zeros
		numerator *= (1+f/val);
	endfor
endif

if (number_of_poles ~= 0)
	denominator = 1;
	for val = values.poles
		denominator *= (1+f/val);
	endfor
else
	denominator = 1;
endif

% sym2poly wont work if there isnt an f somewhere in there. So if zeros or poles is 0, then we dont
% need to use it.
if (number_of_zeros >= 1)
	if (number_of_poles >= 1)
		polynomial_numerator = sym2poly(numerator);
		polynomial_denominator = sym2poly(denominator);
		A = tf(polynomial_numerator, polynomial_denominator);
	else
		polynomial_numerator = sym2poly(numerator);
		A = tf(polynomial_numerator, denominator);
	endif
else
	if (number_of_poles >= 1)
		polynomial_denominator = sym2poly(denominator);
		A = tf(numerator, polynomial_denominator);
	else
		A = tf(numerator, denominator);
	endif
endif


% Get gain margin, phase margin, frequency of -180 phase shift if applicable
[gm, pm, w_gm, w_pm] = margin(A);
gm_db = mag2db(gm);


% Formatting requires using sprintf to get the number of decimal places nice, and then
% wrapping that in a disp() to prevent octave from throwing out "ans = " and an extra \n.
% If gm_db is negative, the system is UNSTABLE and will oscillate at that frequency
% If gm_db is positive, the system IS stable.
disp("Gain margin in dB is:"), disp(sprintf("%.2f",gm_db))
disp("Gain margin frequency:"), disp(sprintf("%.0f", w_gm))

disp("Phase margin frequency:"), disp(sprintf("%.0f", w_pm))

% Find maximum value of Beta such that A(180)*Beta <= 1
beta_max = A(w_gm)^(-1)
disp("Max Beta to ensure stability:"), disp(sprintf("%.5f", beta_max))

% Find maximum frequency
if (number_of_poles ~= 0)
	polesmax = arrayfun(@(struct)max(struct.poles(:)),values);
else
	polesmax = 1;
endif

if (number_of_zeros ~= 0)
	zerosmax = arrayfun(@(struct)max(struct.zeros(:)),values);
else
	zerosmax = 1;
endif

maxfreq = max(polesmax, zerosmax);
freq_range = {1 maxfreq*1000};
chosenplot = plotchoice;
figure('Position', [10, 10, 1200, 800]);
switch chosenplot 
    case 1, bode(A, freq_range, "o");
    case 2,	pzmap(A);
    case 3,	margin(A);
    case 4, nyquist(A);
    case 5,	nichols(A);
    otherwise disp("Choice unrecognized!")
endswitch

%pause() %one can also call the script from bash with $octave --persist to make it hang around
