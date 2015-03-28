%transfer.m
% This program lets the user enter DC gain, zeros, and poles of a transfer function.

f = sym('f');
numerator = 1000;
denominator = (1+f/10000)*(1+f/100000);
polyden = sym2poly(denominator);
A = tf(numerator, polyden);

freq_range = {1 100000};
bode(A, freq_range)
