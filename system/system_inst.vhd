	component system is
		port (
			clk_clk                                : in    std_logic                     := 'X';             -- clk
			entrada_pio_external_connection_export : in    std_logic_vector(18 downto 0) := (others => 'X'); -- export
			lcd_16x2_external_interface_DATA       : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- DATA
			lcd_16x2_external_interface_ON         : out   std_logic;                                        -- ON
			lcd_16x2_external_interface_BLON       : out   std_logic;                                        -- BLON
			lcd_16x2_external_interface_EN         : out   std_logic;                                        -- EN
			lcd_16x2_external_interface_RS         : out   std_logic;                                        -- RS
			lcd_16x2_external_interface_RW         : out   std_logic;                                        -- RW
			led_pio_external_connection_export     : out   std_logic_vector(18 downto 0);                    -- export
			reset_reset_n                          : in    std_logic                     := 'X'              -- reset_n
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			entrada_pio_external_connection_export => CONNECTED_TO_entrada_pio_external_connection_export, -- entrada_pio_external_connection.export
			lcd_16x2_external_interface_DATA       => CONNECTED_TO_lcd_16x2_external_interface_DATA,       --     lcd_16x2_external_interface.DATA
			lcd_16x2_external_interface_ON         => CONNECTED_TO_lcd_16x2_external_interface_ON,         --                                .ON
			lcd_16x2_external_interface_BLON       => CONNECTED_TO_lcd_16x2_external_interface_BLON,       --                                .BLON
			lcd_16x2_external_interface_EN         => CONNECTED_TO_lcd_16x2_external_interface_EN,         --                                .EN
			lcd_16x2_external_interface_RS         => CONNECTED_TO_lcd_16x2_external_interface_RS,         --                                .RS
			lcd_16x2_external_interface_RW         => CONNECTED_TO_lcd_16x2_external_interface_RW,         --                                .RW
			led_pio_external_connection_export     => CONNECTED_TO_led_pio_external_connection_export,     --     led_pio_external_connection.export
			reset_reset_n                          => CONNECTED_TO_reset_reset_n                           --                           reset.reset_n
		);

