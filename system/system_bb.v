
module system (
	clk_clk,
	entrada_pio_external_connection_export,
	lcd_16x2_external_interface_DATA,
	lcd_16x2_external_interface_ON,
	lcd_16x2_external_interface_BLON,
	lcd_16x2_external_interface_EN,
	lcd_16x2_external_interface_RS,
	lcd_16x2_external_interface_RW,
	led_pio_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	input	[18:0]	entrada_pio_external_connection_export;
	inout	[7:0]	lcd_16x2_external_interface_DATA;
	output		lcd_16x2_external_interface_ON;
	output		lcd_16x2_external_interface_BLON;
	output		lcd_16x2_external_interface_EN;
	output		lcd_16x2_external_interface_RS;
	output		lcd_16x2_external_interface_RW;
	output	[18:0]	led_pio_external_connection_export;
	input		reset_reset_n;
endmodule
