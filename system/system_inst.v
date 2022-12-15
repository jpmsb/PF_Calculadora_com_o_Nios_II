	system u0 (
		.clk_clk                                (<connected-to-clk_clk>),                                //                             clk.clk
		.entrada_pio_external_connection_export (<connected-to-entrada_pio_external_connection_export>), // entrada_pio_external_connection.export
		.lcd_16x2_external_interface_DATA       (<connected-to-lcd_16x2_external_interface_DATA>),       //     lcd_16x2_external_interface.DATA
		.lcd_16x2_external_interface_ON         (<connected-to-lcd_16x2_external_interface_ON>),         //                                .ON
		.lcd_16x2_external_interface_BLON       (<connected-to-lcd_16x2_external_interface_BLON>),       //                                .BLON
		.lcd_16x2_external_interface_EN         (<connected-to-lcd_16x2_external_interface_EN>),         //                                .EN
		.lcd_16x2_external_interface_RS         (<connected-to-lcd_16x2_external_interface_RS>),         //                                .RS
		.lcd_16x2_external_interface_RW         (<connected-to-lcd_16x2_external_interface_RW>),         //                                .RW
		.led_pio_external_connection_export     (<connected-to-led_pio_external_connection_export>),     //     led_pio_external_connection.export
		.reset_reset_n                          (<connected-to-reset_reset_n>)                           //                           reset.reset_n
	);

