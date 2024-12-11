`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/07 14:58:45
// Design Name: 
// Module Name: CountDivider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/* �� ����� "clock_dividier"���� LUT ��뷮�� ���ǹ��ϰ� ���� */
module count_divider #(parameter N = 17)(
    input clk, reset,
    output div_edge
    );
    
    reg [N-1:0] count;
    always @(posedge clk, posedge reset) begin
        if(reset)
            count = 0;
        else
            count = count + 1;
    end
    
    wire cp = count[N-1];
    edge_detector edge_detector_inst(
        .clk(clk), .reset(reset), .cp(cp),
        .pedge(div_edge), .nedge()
    );
    
endmodule
