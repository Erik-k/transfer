%Find_A180.m

% Estimate the f180 frequency (where the transfer function experiences
% -180 phase shift) and then scan around that range by changing the
% parameter s.

clc; 
clear all;
close all;

results = [];
for f = 6000:10:6500
    results = [results -atand(f/200)-atand(f/1000)-atand(f/30000)];
end

plot(results)
grid on
grid minor