transfer
========
A command line utility to analyze and solve transfer functions focusing on amplifier circuits and control loop stability.

This program will let a user graph the Bode plot and phase angle of a transfer function of the form A(s) = (DC gain)(zeros)/(poles). It will also help with analyzing instability of feedback loops and amplifiers by estimating resonant frequency, and be capable of graphing things inside the Linux terminal using Octave. 

First the user will construct a transfer function by specifying the number of zeros, number of poles, and DC gain. Then they specify each frequency f1, f2, and so on.

How To Use:
-----------
Requires octave, octave-symbolic, and octave-control.
If you're in octave already and you've got the two packages installed, you can just run transfer.m with:
>source('transfer.m')
Make sure transfer.m and transfermenu.m are in the same folder!

You will then go through two menus, the first of which lets you build a transfer function by specifying the DC gain as a scalar,
and the zeros and poles as a vector. For example, for the function:
A(s) = 1000(1+s/200)/[(1+s/10000)*(1+s/30000)] 
you would enter 1000 for the DC gain, [200] for the zeros, and [10000 30000] for the poles.

transfer.sh is a wrapper that checks for the needed dependencies (octave, octave-control, 
octave-symbolic) and then runs transfer.m in octave. 



Known issues:
-------------
Octave:
* sym2poly can't handle a function with a squared value, but it can do it without running in to the hardcoded coefficient limit if I write out the two poles rather than squaring them.
I.e.: (1+f/100000)*(1+f/100000) rather than (1+f/100000)^2
* The transfer.sh script exits and leaves the user in octave, but that's required to let the user save the graph if they want to. How to exit automatically while still allowing the graph to be saved?

To Do:
------
* How can I take in user input at the command line (via transfer.sh) and pass it to transfer.m?
Octave can take input as input("blah blah") but how can it receive input at the command line? This would enable automated testing of large ranges of values.
* Find out how ASCII plots are chosen and add ability to force that mode. It uses putenv('GNUTERM','dumb') but that only works sporadically.


References:
-----------
http://web.mit.edu/6.302/www/compare/report.html

https://en.wikibooks.org/wiki/Control_Systems/Transfer_Functions

http://octave.sourceforge.net/control/overview.html#PolePlacement
