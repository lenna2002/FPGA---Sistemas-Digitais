library IEEE;
use IEEE.std_logic_1164.all;

entity fpga is
	port (
			bar_un_sec		: out std_logic_vector(6 downto 0);
			bar_dec_sec 	: out std_logic_vector(6 downto 0);
			bar_un_min 		: out std_logic_vector(6 downto 0);
			bar_dec_min 	: out std_logic_vector(6 downto 0);
			clk				: in 	std_logic;					--clock na placa de 50 MHZ
			reset				: in	std_logic;					--botão 3
			next_one			: in 	std_logic;					--botão 1
			start				: in 	std_logic;					--botão 2
			set				: in	std_logic);					--botão 0
end fpga;

architecture hardwere of fpga is
begin
	process(start)
		variable un_sec 	: integer := 9;
		variable dec_sec 	: integer := 1;
		variable un_min 	: integer := 8;
		variable dec_min 	: integer := 5;
		variable button	: integer := 0;
	begin
		
		if(CLK = '1') then
			--if(start = '1') then						--esses são os if para poder ir reduzindo a contagem
				un_sec := un_sec - 1;
			--end if;
		end if;
		
		
		
		
		case un_sec is
			
			when 0 => bar_un_sec <= "0000001";
			when 1 => bar_un_sec <= "1001111";
			when 2 => bar_un_sec <= "0010010";
			when 3 => bar_un_sec <= "0000110";
			when 4 => bar_un_sec <= "1001100";
			when 5 => bar_un_sec <= "0100100";
			when 6 => bar_un_sec	<= "0100000";
			when 7 => bar_un_sec <= "0001111";
			when 8 => bar_un_sec <= "0000000";
			when 9 => bar_un_sec <= "0000100";
			when others => bar_un_sec <= "0000001";
				 
		end case;
		
		case dec_sec is
			
			when 0 => bar_dec_sec <= "0000001";
			when 1 => bar_dec_sec <= "1001111";
			when 2 => bar_dec_sec <= "0010010";
			when 3 => bar_dec_sec <= "0000110";
			when 4 => bar_dec_sec <= "1001100";
			when 5 => bar_dec_sec <= "0100100";
			when others => bar_dec_sec <= "0000001";
				 
		end case;
			
		case un_min is
			
			when 0 => bar_un_min <= "0000001";
			when 1 => bar_un_min <= "1001111";
			when 2 => bar_un_min <= "0010010";
			when 3 => bar_un_min <= "0000110";
			when 4 => bar_un_min <= "1001100";
			when 5 => bar_un_min <= "0100100";
			when 6 => bar_un_min <= "0100000";
			when 7 => bar_un_min <= "0001111";
			when 8 => bar_un_min <= "0000000";
			when 9 => bar_un_min <= "0000100";
			when others => bar_un_min <= "0000001";
				 
		end case;
			
		case dec_min is
			
			when 0 => bar_dec_min <= "0000001";
			when 1 => bar_dec_min <= "1001111";
			when 2 => bar_dec_min <= "0010010";
			when 3 => bar_dec_min <= "0000110";
			when 4 => bar_dec_min <= "1001100";
			when 5 => bar_dec_min <= "0100100";
			when others => bar_dec_min <= "0000001";
				 
		end case;
			
	end process;
end hardwere;	
