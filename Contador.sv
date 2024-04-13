module Contador(modo, clock, rst, display);

	input logic modo, clock, rst;
	
	output logic [6:0] display;

	reg [3:0] estado, prox_estado;

	initial estado = 4'b0000;

	always @ (posedge clock, posedge rst) begin	//bloco procedural
		if (rst)	
			estado <= 4'b0000;
		else
			estado <= prox_estado;
	end 

	always_comb begin	//lógica de mudança de estado   
		case(estado)	
			4'b0000: prox_estado = 4'b0001;
			4'b0001: prox_estado = 4'b0010;
			4'b0010: prox_estado = 4'b0011;
			4'b0011: prox_estado = 4'b0100;
			4'b0100: prox_estado = 4'b0101;
			4'b0101: prox_estado = 4'b0110;
			4'b0110: prox_estado = 4'b0111;
			4'b0111: prox_estado = 4'b1000;
			4'b1000: prox_estado = 4'b1001;
			4'b1001: prox_estado = 4'b1010;
			4'b1010: prox_estado = 4'b1011;
			4'b1011: prox_estado = 4'b1100;
			4'b1100: prox_estado = 4'b1101;
			4'b1101: prox_estado = 4'b1110;
			4'b1110: prox_estado = 4'b1111;
			4'b1111: prox_estado = 4'b0000;
		endcase
	end

	always_comb begin		//saída para cada estado em cada modo; bloco combinacional	
		if(!modo) begin
			case(estado)				//  abcdefg
				4'b0000: display = 7'b1101101;	//2
				4'b0001: display = 7'b1011011;	//5
				4'b0010: display = 7'b1110000;	//7
				4'b0011: display = 7'b1111001;	//3
				4'b0100: display = 7'b1110111;	//A
				4'b0101: display = 7'b1001111;	//E
				4'b0110: display = 7'b1111111;	//8
				4'b0111: display = 7'b1111110;	//0
				4'b1000: display = 7'b0011111;	//B
				4'b1001: display = 7'b0110011;	//4
				4'b1010: display = 7'b1011111;	//6
				4'b1011: display = 7'b0111101;	//D
				4'b1100: display = 7'b1000111;	//F
				4'b1101: display = 7'b0110000;	//1
				4'b1110: display = 7'b1001110;	//C
				4'b1111: display = 7'b1111011;	//9					
				default: display = 7'b0000001;	//display apresenta traço "-" como padrão
			endcase
		end
	
		else begin	//ordem invertida
			case(estado)				//  abcdefg
				4'b1111: display = 7'b1101101;	//2
				4'b1110: display = 7'b1011011;	//5
				4'b1101: display = 7'b1110000;	//7
				4'b1100: display = 7'b1111001;	//3
				4'b1011: display = 7'b1110111;	//A
				4'b1010: display = 7'b1001111;	//E
				4'b1001: display = 7'b1111111;	//8
				4'b1000: display = 7'b1111110;	//0
				4'b0111: display = 7'b0011111;	//B
				4'b0110: display = 7'b0110011;	//4
				4'b0101: display = 7'b1011111;	//6
				4'b0100: display = 7'b0111101;	//D
				4'b0011: display = 7'b1000111;	//F
				4'b0010: display = 7'b0110000;	//1
				4'b0001: display = 7'b1001110;	//C
				4'b0000: display = 7'b1111011;	//9					
				default: display = 7'b0000001;	//display apresenta traço "-" como padrão
			endcase
		end
	end
endmodule
