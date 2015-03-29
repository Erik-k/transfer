% Choose what type of plot to produce

function chosenplot = plotchoice
disp("\nPlots can be saved as a PDF by going to File -> Save in the figure menu.")
chosenplot = menu("Choose a plot type to produce:", "Bode (Gain and Phase)", "Poles and Zeros", ...
	"Gain- and Phase-margin", "Nyquist", "Nichols (good for analyzing gain margin)");

endfunction