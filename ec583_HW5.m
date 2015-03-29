% Make a Bode and Phase plot for a transfer function.

clc;
clear all;
close all; %remove figure windows

db = [];
phase = [];
i = 1;
for f = logspace(0, 9, 100000)
    db(i) = 20*log( 5623/( (1+f/200)*(1+f/1000)+(1+f/30000) ) );
    phase(i) = -atand(f/200)-atand(f/1000)-atand(f/30000);
    i = i+1;
end



first = subplot(2,1,1);
plot(db)
title('dB Bode Plot');
grid minor
grid on

second = subplot(2,1,2);
plot(phase)
title('Phase plot in degrees');
grid minor
grid on
