%transfer.m
% This program lets the user enter DC gain, zeros, and poles of a transfer function.


f = sym('f');
numerator = 1000;
denominator = (1+f/10000)*(1+f/100000)*(1+f/100000);
polynomial_denominator = sym2poly(denominator);
A = tf(numerator, polynomial_denominator);

freq_range = {1 100000};
bode(A, freq_range)
pause() %one can also call the script from bash with $octave --persist to make it hang around