# transfer
A command line utility to analyze and solve transfer functions focusing on amplifier circuits and control loop stability.

This program will let a user graph the Bode plot and phase angle of a transfer function of the form A(s) = (DC gain)(zeros)/(poles). It will also help with analyzing instability of feedback loops and amplifiers by estimating resonant frequency, and be capable of graphing things inside the Linux terminal using Octave. 

First the user will construct a transfer function by specifying the number of zeros, number of poles, and DC gain. Then they specify each frequency f1, f2, and so on.

I'm going to start by making a Python program that can do things normally and save the confinement to a terminal window as a later goal. 

http://web.mit.edu/6.302/www/compare/report.html
https://en.wikibooks.org/wiki/Control_Systems/Transfer_Functions
http://octave.sourceforge.net/control/overview.html#PolePlacement
