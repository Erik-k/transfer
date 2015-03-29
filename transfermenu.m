% This function uses an interactive menu in octave to let the user build a struct which contains the 
% DC value of a transfer function, the zeros, and poles. This result is used by transfer.m to create
% a transfer function for graphing and analysis.
% The resulting struct looks like:
% values.DC 		Scalar
% values.zeros[]	Vector
% values.poles[]	Vector

function values = transfermenu
	values = struct("DC", [], "zeros", [], "poles", []);
	while (choice = menu("Menu with sub inputs", "Input DC gain", "Input zeros", "Input poles", "Finished"))
		if (choice == 1)
			A0 = input("Enter DC gain as one number: ")
			values.DC(1) = A0;
		elseif (choice == 2)
			numerator = input("Enter the zeros as a vector, including [ ]: ")
			values.zeros = numerator;
		elseif (choice == 3)
			denominator = input("Enter the poles as a vector, including [ ]: ")
			values.poles = denominator;
		else
			break;
		endif
	endwhile
endfunction