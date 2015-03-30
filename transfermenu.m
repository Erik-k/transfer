% This function uses an interactive menu in octave to let the user build a struct which contains the 
% DC value of a transfer function, the zeros, and poles. This result is used by transfer.m to create
% a transfer function for graphing and analysis.
% The resulting struct looks like:
% values.DC 		Scalar
% values.zeros[]	Vector
% values.poles[]	Vector

function values = transfermenu
	values = struct("DC", [], "zeros", [], "poles", []);
	while (choice = menu("Choose Option:", "Input DC gain", "Input zeros", "Input poles", "Finished"))
	    switch choice
        case 1
			A0 = input("Enter DC gain as one number: ")
			values.DC(1) = A0;
		case 2
			numerator = input("Enter the zeros as a vector, including [ ]: ")
			values.zeros = numerator;
		case 3
			denominator = input("Enter the poles as a vector, including [ ]: ")
			values.poles = denominator;
		otherwise
			break
		endswitch
	endwhile
endfunction
