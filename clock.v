//Clock module - NOT TESTED

module m555(clock);
    parameter InitDelay = 0, Ton = 50, Toff = 50;
    output clock;
    reg clock;

    initial begin
        #InitDelay clock = 1;
    end

    always begin
        #Ton clock = ~clock;
        #Toff clock = ~clock;
        #0 $display("clock toggle - %d.",$time);
    end
endmodule
