library IEEE;
use IEEE.std_logic_1164.all;

entity fpga is
	port (
			bar_un_sec		: out std_logic_vector(6 downto 0);
			bar_dec_sec 	: out std_logic_vector(6 downto 0);
			bar_un_min 		: out std_logic_vector(6 downto 0);
			bar_dec_min 	: out std_logic_vector(6 downto 0);
			clk				: in 	std_logic;
			reset				: in	std_logic;
			set				: in	std_logic);
end fpga;

architecture hardwere of fpga is
begin
	process(clk, set, reset)
		variable un_sec 	: integer := 9;
		variable dec_sec 	: integer := 5;
		variable un_min 	: integer := 9;
		variable dec_min 	: integer := 5;
	begin
		
		if(clk = '1') then						--esses são os if para poder ir reduzindo a contagem
			un_sec := un_sec - 1;
			if(un_sec = 0) then
				if(dec_sec > 0) then
					dec_sec := dec_sec - 1;
					un_sec := 9;
				else 
					if(un_min > 0) then
						un_min := un_min - 1;
						dec_sec := 5;
						un_sec := 9;
					else
						if(dec_min > 0) then
							dec_min := dec_min - 1;
							un_min := 9;
							dec_sec := 5;
							un_sec := 9;
						else 
							dec_min := 0;
							un_min := 0;
							dec_sec := 0;
							un_sec := 0;
						end if;
					end if;
				end if;
			end if;
		end if;
		
		case un_sec is
			
			when 0 => bar_un_sec <= "1111110";
			when 1 => bar_un_sec <= "0110000";
			when 2 => bar_un_sec <= "1101101";
			when 3 => bar_un_sec <= "1111001";
			when 4 => bar_un_sec <= "0110011";
			when 5 => bar_un_sec <= "1011011";
			when 6 => bar_un_sec <= "1011111";
			when 7 => bar_un_sec <= "1110000";
			when 8 => bar_un_sec <= "1111111";
			when 9 => bar_un_sec <= "1111011";
			when others => bar_un_sec <= "1111110";
				 
		end case;
		
		case dec_sec is
			
			when 0 => bar_dec_sec <= "1111110";
			when 1 => bar_dec_sec <= "0110000";
			when 2 => bar_dec_sec <= "1101101";
			when 3 => bar_dec_sec <= "1111001";
			when 4 => bar_dec_sec <= "0110011";
			when 5 => bar_dec_sec <= "1011011";
			when others => bar_dec_sec <= "1111110";
				 
		end case;
			
		case un_min is
			
			when 0 => bar_un_min <= "1111110";
			when 1 => bar_un_min <= "0110000";
			when 2 => bar_un_min <= "1101101";
			when 3 => bar_un_min <= "1111001";
			when 4 => bar_un_min <= "0110011";
			when 5 => bar_un_min <= "1011011";
			when 6 => bar_un_min <= "1011111";
			when 7 => bar_un_min <= "1110000";
			when 8 => bar_un_min <= "1111111";
			when 9 => bar_un_min <= "1111011";
			when others => bar_un_min <= "1111110";
				 
		end case;
			
		case dec_min is
			
			when 0 => bar_dec_min <= "1111110";
			when 1 => bar_dec_min <= "0110000";
			when 2 => bar_dec_min <= "1101101";
			when 3 => bar_dec_min <= "1111001";
			when 4 => bar_dec_min <= "0110011";
			when 5 => bar_dec_min <= "1011011";
			when others => bar_dec_min <= "1111110";
				 
		end case;
	
	end process;
end hardwere;	
