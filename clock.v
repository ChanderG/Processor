//Clock module - NOT TESTED

module m555(clock);
    parameter InitDelay = 1, Ton = 1, Toff = 1;
    output clock;
    reg clock;

    initial begin
        #InitDelay clock = 1;
    end

    always begin
        #Ton clock = ~clock;
        #Toff clock = ~clock;
    end
endmodule
