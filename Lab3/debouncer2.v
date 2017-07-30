module debouncer2(Clk,In, Out);

	input Clk,In;
	output reg Out;
	reg [3:0]Count=4'b0000;
			
	always @(posedge Clk)
	begin
		if (Count[3:0] == 4'b0000)
			begin
			if ( In != Out )
				begin
					Out <= ~Out;
					Count[3:0] <= 4'b0111;
				end
			else
				begin
					Out <= Out;
					Count[3:0] <= Count[3:0];
				end
			
					
			end
		else if (Count[3:0] == 4'b1111)
			begin
			if ( In != Out )
				begin
					Out <= ~Out;
					Count[3:0] <= 4'b0111;
				end
			else
				begin
					Out <= Out;
					Count[3:0] <= Count[3:0];
				end
			
			end			
		else
			begin
					Out <= Out;
					if(Out==1)
						Count[3:0] <= Count[3:0] + 4'b0001;
					else
						Count[3:0] <= Count[3:0] - 4'b0001;
			end
			
	end
	
endmodule

