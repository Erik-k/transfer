function values = transfermenu
	values = struct("DC", [], "zeros", [], "poles", []);
	choice = menu("Menu with sub inputs", "Input DC gain", "Input zeros", "Input poles")
	if (choice == 1)
		A0 = input("Enter DC gain as one number: ")
		values.DC(1) = A0;
	elseif (choice == 2)
		numerator = input("Enter the zeros as a vector, including [ ]: ")
		values.zeros = numerator;
	elseif (choice == 3)
		denominator = input("Enter the poles as a vector, including [ ]: ")
		values.poles = denominator;
	endif
endfunction