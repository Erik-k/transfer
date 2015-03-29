transfer
========
A command line utility to analyze and solve transfer functions focusing on amplifier circuits and control loop stability.

This program will let a user graph the Bode plot and phase angle of a transfer function of the form A(s) = (DC gain)(zeros)/(poles). It will also help with analyzing instability of feedback loops and amplifiers by estimating resonant frequency, and be capable of graphing things inside the Linux terminal using Octave. 

First the user will construct a transfer function by specifying the number of zeros, number of poles, and DC gain. Then they specify each frequency f1, f2, and so on.

I'm going to start by making a Python program that can do things normally and save the confinement to a terminal window as a later goal. 

http://web.mit.edu/6.302/www/compare/report.html
https://en.wikibooks.org/wiki/Control_Systems/Transfer_Functions
http://octave.sourceforge.net/control/overview.html#PolePlacement
=======

Known issues:
-------------
Octave:
* Known issues: sym2poly can't handle a function with a squared value, but it can do it without 
running in to the coefficient limit if I write out the two poles rather than squaring them.
I.e.: (1+f/100000)*(1+f/100000) rather than (1+f/100000)^2

To Do:
------
* Find the maximum value of beta for stability by taking A(f180)^-1
* How can I take in user input at the command line (via transfer.sh) and pass it to transfer.m?
Octave can take input as input("blah blah") but how can it receive input at the command line?
* Use octave's print ability to create a .png of the plots, if the user wants
* Nichols graphing would be easier to find gain margin and phase margin visually: >nichols(A)
However I was able to get GM and PM from the outputs on margin(A)
