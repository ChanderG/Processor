#Processor

###What?
A 32 bit MIPS like RISC processor designed in Verilog.

See the [specification](https://drive.google.com/file/d/0Bx2xB4tUaZHBaU5zR29ocWd2RVU/view?usp=sharing). The instruction set we developed is [here](https://drive.google.com/file/d/0Bx2xB4tUaZHBTEEzc0V0UUVmN3c/view?usp=sharing).This [diagram](https://drive.google.com/file/d/0Bx2xB4tUaZHBYUNQemJJU1FCYU0/view?usp=sharing) may help you make sense of the data path.

###Helpful Instructions

1.We used Altium Designer and Aldec Simulator. The Simulator does not reflect changes in the code base when "reset". The only safe way to work with it is to "end" the session and start over.

###Known Issues
1.Works only for positive numbers. Any calculation resulting in negative numbers crashes the m/c.

###Workarounds:
1.If there are problems with MUX or Z or X is seen unexpectedly, one or more wire/reg may have not been defined.

###Special Thanks
1. Pair programmed with Pranay Yadav
2. Learnt many things from [this](https://github.com/alanachtenberg/CSCE-350/tree/master/Project%202) university project.
