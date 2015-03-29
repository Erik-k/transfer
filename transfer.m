%transfer.m


f = sym('f');
numerator = 1000;
denominator = (1+f/10000)*(1+f/100000)*(1+f/100000);
polynomial_denominator = sym2poly(denominator);
A = tf(numerator, polynomial_denominator);

freq_range = {1 100000000};
figure('Position', [10, 10, 1200, 800]);
grid minor;
bode(A, freq_range, "o")
pause() %one can also call the script from bash with $octave --persist to make it hang around