#Processor

###What?
A 32 bit MIPS like RISC processor designed in Verilog.

I will soon post links to the exact specification and the ISA we created.

###Helpful Instructions

1.We used Altium Designer and Aldec Simulator. The Simulator does not reflect changes in the code base when "reset". The only safe way to work with it is to "end" the session and start over.

###Known Issues
1.Works only for positive numbers. Any calculation resulting in negative numbers crashes the m/c.

###Workarounds:
1.If there are problems with MUX or Z or X is seen unexpectedly, one or more wire/reg may have not been defined.

###Special Thanks
1. Pranay Yadav
