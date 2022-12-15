library ieee;
use ieee.std_logic_1164.all;

library work;

entity topo is
	port (
		CLOCK_50                           : in std_logic;
		KEY                                : in std_logic_vector(1 downto 0);
		LEDR                               : out std_logic_vector(16 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0);
		SW                                 : in  std_logic_vector(17 downto 0);
		LCD_DATA                           : inout std_logic_vector(7 downto 0);
		LCD_EN, LCD_RW, LCD_ON, LCD_BLON   : out std_logic;
		LCD_RS                             : out std_logic
	);
end entity;

architecture system of topo is

	component system is
		port (
			clk_clk                                 : in    std_logic                     := 'X';             -- clk
			led_pio_external_connection_export      : out   std_logic_vector(16 downto 0);                    -- export
			reset_reset_n                           : in    std_logic                     := 'X';             -- reset_n
			lcd_16x2_external_interface_DATA        : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- DATA
			lcd_16x2_external_interface_ON          : out   std_logic;                                        -- ON
			lcd_16x2_external_interface_BLON        : out   std_logic;                                        -- BLON
			lcd_16x2_external_interface_EN          : out   std_logic;                                        -- EN
			lcd_16x2_external_interface_RS          : out   std_logic;                                        -- RS
			lcd_16x2_external_interface_RW          : out   std_logic;                                         -- RW
			entrada_pio_external_connection_export  : in    std_logic_vector(18 downto 0) := (others => 'X')  -- export
		);
	end component system;
	
	component bin2bcd is
      generic(N: positive := 17);
      port(
         clk, reset: in std_logic;
         binary_in: in std_logic_vector(N-1 downto 0);
         bcd0, bcd1, bcd2, bcd3, bcd4, bcd5: out std_logic_vector(3 downto 0)
      );
	end component;
	
	component bcd2ssd is
	   port ( 
	      BCDin : in std_logic_vector (3 downto 0);
	      Seven_Segment : out std_logic_vector (6 downto 0)
      );
   end component;
	
	signal saida_ledr : std_logic_vector(16 downto 0);
	signal bcd0_disp0, bcd1_disp1, bcd2_disp2, bcd3_disp3, bcd4_disp4, bcd5_disp5 : std_logic_vector(3 downto 0);
	
begin
	u0 : component system
		port map (
			clk_clk                                => CLOCK_50,                                 --                                clk.clk
			led_pio_external_connection_export     => saida_ledr,      --        led_pio_external_connection.export
			reset_reset_n                          => KEY(0),                           --                              reset.reset_n
			lcd_16x2_external_interface_DATA       => LCD_DATA, -- character_lcd_0_external_interface.DATA
			lcd_16x2_external_interface_ON         => LCD_ON,   --                                   .ON
			lcd_16x2_external_interface_BLON       => LCD_BLON, --                                   .BLON
			lcd_16x2_external_interface_EN         => LCD_EN,   --                                   .EN
			lcd_16x2_external_interface_RS         => LCD_RS,   --                                   .RS
			lcd_16x2_external_interface_RW         => LCD_RW,   --                                   .RW
			entrada_pio_external_connection_export => KEY(1)&SW
		);
		
	b2b : component bin2bcd
	    port map (
		    clk       => CLOCK_50,
			 reset     => KEY(0),
			 binary_in => saida_ledr,
			 bcd0      => bcd0_disp0,
			 bcd1      => bcd1_disp1,
			 bcd2      => bcd2_disp2,
			 bcd3      => bcd3_disp3,
			 bcd4      => bcd4_disp4,
			 bcd5      => bcd5_disp5
		 );
		 
	disp0 : component bcd2ssd
	      port map (
			   BCDin => bcd0_disp0,
				Seven_Segment => HEX0
			);
			
	disp1 : component bcd2ssd
	      port map (
			   BCDin => bcd1_disp1,
				Seven_Segment => HEX1
			);
			
	disp2 : component bcd2ssd
	      port map (
			   BCDin => bcd2_disp2,
				Seven_Segment => HEX2
			);
			
	disp3 : component bcd2ssd
	      port map (
			   BCDin => bcd3_disp3,
				Seven_Segment => HEX3
			);
			
	disp4 : component bcd2ssd
	      port map (
			   BCDin => bcd4_disp4,
				Seven_Segment => HEX4
			);
			
	disp5 : component bcd2ssd
	      port map (
			   BCDin => bcd5_disp5,
				Seven_Segment => HEX5
			);
	
	LEDR <= saida_ledr;
end architecture;