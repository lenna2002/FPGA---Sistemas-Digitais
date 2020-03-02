		library IEEE;
		use IEEE.std_logic_1164.all;

		entity TIMER is
		port(
					min_dec, min_un, sec_dec, sec_un	:		out	std_logic_vector(6 downto 0);
					clk	:		 in	std_logic);			--ainda tem que adicionar os botões
		end TIMER;
		
		architecture hardware of TIMER is
		begin
		process(clk)
		
			-- Vai ter modificar abaixo para receber o valor da placa
				variable display4 : integer;					--display das unidades dos segundos
				variable display3 : integer;					--display dos decimais dos segundos
				variable display2 : integer;					--display das unidades dos minutos
				variable display1 : integer;					--display dos decimais dos minutos
				
		begin			
			
			case display4 is
			
				 when 0 => sec_un <= "1111110";
				 when 1 => sec_un <= "0110000";
				 when 2 => sec_un <= "1101101";
				 when 3 => sec_un <= "1111001";
				 when 4 => sec_un <= "0110011";
				 when 5 => sec_un <= "1011011";
				 when 6 => sec_un <= "1011111";
				 when 7 => sec_un <= "1110000";
				 when 8 => sec_un <= "1111111";
				 when 9 => sec_un <= "1111011";
				 when others => sec_un <= "1111110";
				 
			end case;
			
			case display3 is
			
				 when 0 => sec_dec <= "1111110";
				 when 1 => sec_dec <= "0110000";
				 when 2 => sec_dec <= "1101101";
				 when 3 => sec_dec <= "1111001";
				 when 4 => sec_dec <= "0110011";
				 when 5 => sec_dec <= "1011011";
				 when others => sec_dec <= "1111110";
				 
			end case;
			
			case display2 is
			
				 when 0 => min_un <= "1111110";
				 when 1 => min_un <= "0110000";
				 when 2 => min_un <= "1101101";
				 when 3 => min_un <= "1111001";
				 when 4 => min_un <= "0110011";
				 when 5 => min_un <= "1011011";
				 when 6 => min_un <= "1011111";
				 when 7 => min_un <= "1110000";
				 when 8 => min_un <= "1111111";
				 when 9 => min_un <= "1111011";
				 when others => min_un <= "1111110";
				 
			end case;
			
			case display1 is
			
				 when 0 => min_dec <= "1111110";
				 when 1 => min_dec <= "0110000";
				 when 2 => min_dec <= "1101101";
				 when 3 => min_dec <= "1111001";
				 when 4 => min_dec <= "0110011";
				 when 5 => min_dec <= "1011011";
				 when others => min_dec <= "1111110";
				 
			end case;
			
			if (min_dec > 6)					--esses if são para reduzir os valores dos minutos e dos segundos para o seu valor máximo, caso tenha sido colocado algum valor superior
			min_dec := 5;
			end if;
			
			if (sec_dec > 6)
			sec_dec := 5;
			end if;
			
			if (sec_un > 9)
			sec_dec := 9;
			end if;
			
			if (min_dec > 9)
			sec_dec := 9;
			end if;
			
			while (min_dec < 6) loop				--quando chegar tudo em zero, eu vou colocar um valor maior para poder desligar todos os leds
			
			if(clk = '1') then						--esses são os if para poder ir reduzindo a contagem

				sec_un := sec_un - 1;
				
				if (sec_un = 0)						--aqui é para poder ir reduzindo os displays seguintes
				
					if (sec_dec = 0)
					
						if (min_un > 0)				--esse aqui é para testar se tem algum valor no display das unidades dos minutos para reduzir quando o das dezenas dos segundos chegar a zero
						
						min_un := min_un -1;
						sec_dec := 5;
						sec_un := 9;
						
						end if;
					
						if (min_un = 0)				--esse aqui é para ir ir para o display de decimais dos minutos quando o das unidades acabar
							if (min_dec > 0)
							
							min_dec := min_dec -1;
							min_un := 9;
							sec_dec := 5;
							sec_un := 9;
							
							end if;
							end if;
						end if;
					end if;
					
					if (sec_dec > 0)
						sec_dec := sec_dec -1;
						sec_un := 9;
					end if
				end if;
				
				if (sec_dec = 0)						--esses if são para poder parar o loop quando tudo chegar a zero, e então colocar valores que não são suportados para que os displays sejam desligados.
					if (min_un = 0)
						if (sec_dec = 0)
							if (sec_un = 0)
								sec_un = 10;
								sec_dec = 10;
								min_un = 10;
								min_dec = 10;
							end if;
						end if;
					end if;
				end if;
			
			end if;
			
			end loop;
			
		end process;
		
		end hardware;
