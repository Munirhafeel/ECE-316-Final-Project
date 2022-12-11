library ieee;
use ieee.std_logic_1164.all;

entity vending is
    port(
        sel, coins: in std_logic_vector (2 downto 0);
        reset,clk: in std_logic;
        v,ni: out std_logic;
        current_total: out std_logic_vector (6 downto 0)
        deficit: out std_logic_vector (6 downto 0)); 
end vending;

architecture vending_behav of vending is 
type state_type is (s0,s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14,
a0,a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
b0,b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14,
c0,c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14,
d0,d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14); 

signal curr_state, next_state : state_type;
begin
    Main_Control: process(reset,coins,sel,curr_state) 
    begin
        case curr_state is 

            when s0 => --0
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a1; -- select A
                            when "101" => next_state <= b1; -- select B
                            when "110" => next_state <= c1; -- select C
                            when "111" => next_state <= d1; -- select D
                            when others => next_state <= s1; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a2; -- select A
                            when "101" => next_state <= b2; -- select B
                            when "110" => next_state <= c2; -- select C
                            when "111" => next_state <= d2; -- select D
                            when others => next_state <= s2; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a5; -- select A
                            when "101" => next_state <= b5; -- select B
                            when "110" => next_state <= c5; -- select C
                            when "111" => next_state <= d5; -- select D
                            when others => next_state <= s5; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s0
                    ;
                end case; -- case coins

            when s1 => --5
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a2; -- select A
                            when "101" => next_state <= b2; -- select B
                            when "110" => next_state <= c2; -- select C
                            when "111" => next_state <= d2; -- select D
                            when others => next_state <= s2; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a3; -- select A
                            when "101" => next_state <= b3; -- select B
                            when "110" => next_state <= c3; -- select C
                            when "111" => next_state <= d3; -- select D
                            when others => next_state <= s3; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a6; -- select A
                            when "101" => next_state <= b6; -- select B
                            when "110" => next_state <= c6; -- select C
                            when "111" => next_state <= d6; -- select D
                            when others => next_state <= s6; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s1;
                end case; -- case coins

            when s2 => --10
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a3; -- select A
                            when "101" => next_state <= b3; -- select B
                            when "110" => next_state <= c3; -- select C
                            when "111" => next_state <= d3; -- select D
                            when others => next_state <= s3; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a4; -- select A
                            when "101" => next_state <= b4; -- select B
                            when "110" => next_state <= c4; -- select C
                            when "111" => next_state <= d4; -- select D
                            when others => next_state <= s4; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a7; -- select A
                            when "101" => next_state <= b7; -- select B
                            when "110" => next_state <= c7; -- select C
                            when "111" => next_state <= d7; -- select D
                            when others => next_state <= s7; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s2;
                end case; -- case coins
        

            when s3 => --15
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a4; -- select A
                            when "101" => next_state <= b4; -- select B
                            when "110" => next_state <= c4; -- select C
                            when "111" => next_state <= d4; -- select D
                            when others => next_state <= s4; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a5; -- select A
                            when "101" => next_state <= b5; -- select B
                            when "110" => next_state <= c5; -- select C
                            when "111" => next_state <= d5; -- select D
                            when others => next_state <= s5; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a8; -- select A
                            when "101" => next_state <= b8; -- select B
                            when "110" => next_state <= c8; -- select C
                            when "111" => next_state <= d8; -- select D
                            when others => next_state <= s8; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s3;
                end case; -- case coins
        

            when s4 => --20
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a5; -- select A
                            when "101" => next_state <= b5; -- select B
                            when "110" => next_state <= c5; -- select C
                            when "111" => next_state <= d5; -- select D
                            when others => next_state <= s5; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a6; -- select A
                            when "101" => next_state <= b6; -- select B
                            when "110" => next_state <= c6; -- select C
                            when "111" => next_state <= d6; -- select D
                            when others => next_state <= s6; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a9; -- select A
                            when "101" => next_state <= b9; -- select B
                            when "110" => next_state <= c9; -- select C
                            when "111" => next_state <= d9; -- select D
                            when others => next_state <= s9; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s4;
                end case; -- case coins
        

            when s5 => --25
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a6; -- select A
                            when "101" => next_state <= b6; -- select B
                            when "110" => next_state <= c6; -- select C
                            when "111" => next_state <= d6; -- select D
                            when others => next_state <= s6; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a7; -- select A
                            when "101" => next_state <= b7; -- select B
                            when "110" => next_state <= c7; -- select C
                            when "111" => next_state <= d7; -- select D
                            when others => next_state <= s7; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a10; -- select A
                            when "101" => next_state <= b10; -- select B
                            when "110" => next_state <= c10; -- select C
                            when "111" => next_state <= d10; -- select D
                            when others => next_state <= s10; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s5;
                end case; -- case coins
        
            when s6 =>   --30              
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a7; -- select A
                            when "101" => next_state <= b7; -- select B
                            when "110" => next_state <= c7; -- select C
                            when "111" => next_state <= d7; -- select D
                            when others => next_state <= s7; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a8; -- select A
                            when "101" => next_state <= b8; -- select B
                            when "110" => next_state <= c8; -- select C
                            when "111" => next_state <= d8; -- select D
                            when others => next_state <= s8; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a11; -- select A
                            when "101" => next_state <= b11; -- select B
                            when "110" => next_state <= c11; -- select C
                            when "111" => next_state <= d11; -- select D
                            when others => next_state <= s11; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s6;
                end case; -- case coins
        
            when s7 => --35
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a8; -- select A
                            when "101" => next_state <= b8; -- select B
                            when "110" => next_state <= c8; -- select C
                            when "111" => next_state <= d8; -- select D
                            when others => next_state <= s8; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a9; -- select A
                            when "101" => next_state <= b9; -- select B
                            when "110" => next_state <= c9; -- select C
                            when "111" => next_state <= d9; -- select D
                            when others => next_state <= s9; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a12; -- select A
                            when "101" => next_state <= b12; -- select B
                            when "110" => next_state <= c12; -- select C
                            when "111" => next_state <= d12; -- select D
                            when others => next_state <= s12; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s7;
                end case; -- case coins
        
            when s8 => --40
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a9; -- select A
                            when "101" => next_state <= b9; -- select B
                            when "110" => next_state <= c9; -- select C
                            when "111" => next_state <= d9; -- select D
                            when others => next_state <= s9; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a10; -- select A
                            when "101" => next_state <= b10; -- select B
                            when "110" => next_state <= c10; -- select C
                            when "111" => next_state <= d10; -- select D
                            when others => next_state <= s10; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a13; -- select A
                            when "101" => next_state <= b13; -- select B
                            when "110" => next_state <= c13; -- select C
                            when "111" => next_state <= d13; -- select D
                            when others => next_state <= s13; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s8;
                end case; -- case coins
        
            when s9 => --45
                case coins is
                    when "100" => --N
                        case sel is 
                            when "100" => next_state <= a10; -- select A
                            when "101" => next_state <= b10; -- select B
                            when "110" => next_state <= c10; -- select C
                            when "111" => next_state <= d10; -- select D
                            when others => next_state <= s10; -- enable is 0
                        end case;
                    when "010" => --D
                        case sel is 
                            when "100" => next_state <= a11; -- select A
                            when "101" => next_state <= b11; -- select B
                            when "110" => next_state <= c11; -- select C
                            when "111" => next_state <= d11; -- select D
                            when others => next_state <= s11; -- enable is 0
                        end case;
                    when "100" => --Q
                        case sel is 
                            when "100" => next_state <= a14; -- select A
                            when "101" => next_state <= b14; -- select B
                            when "110" => next_state <= c14; -- select C
                            when "111" => next_state <= d14; -- select D
                            when others => next_state <= s14; -- enable is 0
                        end case;
                    when others => --INV
                        next_state <= s0;
                end case; -- case coins

            when s10 => --50
                case sel is 
                    when "100" => next_state <= a10; -- select A
                    when "101" => next_state <= b10; -- select B
                    when "110" => next_state <= c10; -- select C
                    when "111" => next_state <= d10; -- select D
                    when others => next_state <= s10; -- enable is 0
                end case;

            when s11 => --55
                case sel is 
                    when "100" => next_state <= a10; -- select A
                    when "101" => next_state <= b10; -- select B
                    when "110" => next_state <= c10; -- select C
                    when "111" => next_state <= d10; -- select D
                    when others => next_state <= s10; -- enable is 0
                end case;

            when s12 => --60
                case sel is 
                    when "100" => next_state <= a10; -- select A
                    when "101" => next_state <= b10; -- select B
                    when "110" => next_state <= c10; -- select C
                    when "111" => next_state <= d10; -- select D
                    when others => next_state <= s10; -- enable is 0
                end case;

            when s13 => --65
                case sel is 
                    when "100" => next_state <= a10; -- select A
                    when "101" => next_state <= b10; -- select B
                    when "110" => next_state <= c10; -- select C
                    when "111" => next_state <= d10; -- select D
                    when others => next_state <= s10; -- enable is 0
                end case;

            when s14 => --70
                case sel is 
                    when "100" => next_state <= a10; -- select A
                    when "101" => next_state <= b10; -- select B
                    when "110" => next_state <= c10; -- select C
                    when "111" => next_state <= d10; -- select D
                    when others => next_state <= s10; -- enable is 0
                end case;
            
            when a0 => -- 0-15
                case coins is 
                    when "100" => next_state <= a1;
                    when "010" =>next_state <= a2;
                    when "001" => next_state <= a5;
                    when others => next_state <= a0;
            end case;

            when a1 => -- 5-10
                case coins is 
                    when "100" => next_state <= a2;
                    when "010" => next_state <= a3;
                    when "001" => next_state <= a6;
                    when others => next_state <= a1;
                end case; 

            when a2 => --10-5
                case coins is 
                    when "100" => next_state <= a3;
                    when "010" => next_state <= a4;
                    when "001" => next_state <= a7;
                    when others => next_state <= a2;
                end case; 

            when a3 => next_state <= s0;--15-0
            when a4 => next_state <= a3; --5
            when a5 => next_state <= a4; --10
            when a6 => next_state <= a5; --15
            when a7 => next_state <= a6; --20
            when a8 => next_state <= a7; --25
            when a9 => next_state <= a8; --30
            when a10 => next_state <= a9; --35
            when a11 => next_state <= a10; --40
            when a12 => next_state <= a11; --45
            when a13 => next_state <= a12; --50
            when a14 => next_state <= a13; --55

            when b0 => -- 0
                case coins is 
                    when "100" => next_state <= b1;
                    when "010" => next_state <= b2;
                    when "001" => next_state <= b5;
                    when others => next_state <= b0;
            end case;

            when b1 =>
                case coins is 
                    when "100" => next_state <= b2;
                    when "010" => next_state <= b3;
                    when "001" => next_state <= b6;
                    when others => next_state <= b1;
                end case; 
            when b2 =>
                case coins is 
                    when "100" => next_state <= b3;
                    when "010" => next_state <= b4;
                    when "001" => next_state <= b7;
                    when others => next_state <= b2;
                end case; 
            when b3 =>
                case coins is 
                    when "100" => next_state <= b4;
                    when "010" => next_state <= b5;
                    when "001" => next_state <= b8;
                    when others => next_state <= b3;
                end case; 
            when b4 =>
                case coins is 
                    when "100" => next_state <= b5;
                    when "010" => next_state <= b6;
                    when "001" => next_state <= b9;
                    when others => next_state <= b4;
                end case; 
            when b5 => next_state <= s0;
            when b6 => next_state <= b5;
            when b7 => next_state <= b6;
            when b8 => next_state <= b7;
            when b9 => next_state <= b8;
            when b10 => next_state <= b9;
            when b11 => next_state <= b10;
            when b12 => next_state <= b11;
            when b13 => next_state <= b12;
            when b14 => next_state <= b13;

            when c0 => -- 0
                case coins is 
                    when "100" => next_state <= c1;
                    when "010" => next_state <= c2;
                    when "001" => next_state <= c5;
                    when others => next_state <= c0;
            end case;

            when c1 =>
                case coins is 
                    when "100" => next_state <= c2;
                    when "010" => next_state <= c3;
                    when "001" => next_state <= c6;
                    when others => next_state <= c1;
                end case; 

            when c2 =>
            case coins is 
                when "100" => next_state <= c3;
                when "010" => next_state <= c4;
                when "001" => next_state <= c7;
                when others => next_state <= c2;
            end case; 

            when c3 =>
            case coins is 
                when "100" => next_state <= c4;
                when "010" => next_state <= c5;
                when "001" => next_state <= c8;
                when others => next_state <= c3;
            end case; 

            when c4 =>
                case coins is 
                    when "100" => next_state <= c5;
                    when "010" => next_state <= c6;
                    when "001" => next_state <= c9;
                    when others => next_state <= c4;
                end case; 

            when c5 =>
                case coins is 
                    when "100" => next_state <= c6;
                    when "010" => next_state <= c7;
                    when "001" => next_state <= c10;
                    when others => next_state <= c5;
                end case; 

            when c6 =>
                case coins is 
                    when "100" => next_state <= c7;
                    when "010" => next_state <= c8;
                    when "001" => next_state <= c11;
                    when others => next_state <= c6;
                end case; 

            when c7 => next_state <= s0;
            when c8 => next_state <= c7;
            when c9 => next_state <= c8;
            when c10 => next_state <= c9;
            when c11 => next_state <= c10;
            when c12 => next_state <= c11;
            when c13 => next_state <= c12;
            when c14 => next_state <= c13;


            when d0 => -- 0
                case coins is 
                    when "100" => next_state <= d1;
                    when "010" => next_state <= d2;
                    when "001" => next_state <= d5;
                    when others => next_state <= d0;
            end case;

            when d1 =>
                case coins is 
                    when "100" => next_state <= d2;
                    when "010" => next_state <= d3;
                    when "001" => next_state <= d6;
                    when others => next_state <= d1;
                end case; 
            when d2 =>
                case coins is 
                    when "100" => next_state <= d3;
                    when "010" => next_state <= d4;
                    when "001" => next_state <= d7;
                    when others => next_state <= d2;
                end case; 

            when d3 =>
                case coins is 
                    when "100" => next_state <= d4;
                    when "010" => next_state <= d5;
                    when "001" => next_state <= d8;
                    when others => next_state <= d3;
                end case; 

            when d4 =>
                case coins is 
                    when "100" => next_state <= d5;
                    when "010" => next_state <= d6;
                    when "001" => next_state <= d9;
                    when others => next_state <= d4;
                end case; 

            when d5 =>
                case coins is 
                    when "100" => next_state <= d6;
                    when "010" => next_state <= d7;
                    when "001" => next_state <= d10;
                    when others => next_state <= d5;
                end case; 

            when d6 =>
                case coins is 
                    when "100" => next_state <= d7;
                    when "010" => next_state <= d8;
                    when "001" => next_state <= d11;
                    when others => next_state <= d6;
                end case; 

            when d7 =>
                case coins is 
                    when "100" => next_state <= d8;
                    when "010" => next_state <= d9;
                    when "001" => next_state <= d12;
                    when others => next_state <= d7;
                end case; 

            when d8 =>
                case coins is 
                    when "100" => next_state <= d9;
                    when "010" => next_state <= d10;
                    when "001" => next_state <= d13;
                    when others => next_state <= d8;
                end case; 

            when d9 =>
                case coins is 
                    when "100" => next_state <= d10;
                    when "010" => next_state <= d11;
                    when "001" => next_state <= d14;
                    when others => next_state <= d9;
                end case; 

            when d10 => next_state <= s0;
            when d11 => next_state <= d10;
            when d12 => next_state <= d11;
            when d13 => next_state <= d12;
            when d14 => next_state <= d13;

            when others => null;
        end case; 
    end process Main_Control;

state_transition:process(clk,reset) 
begin
    if (reset = '1') then 
        curr_state <= s0;
    elsif (clk'event and clk = '1') then 
        curr_state <= next_state;
    end if;
end process state_transition;


State_Outputs: process(curr_state) 
begin
    case curr_state is 
        when s0 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000000";--0
            deficit <= "0000000";--0
        when s1 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000101";--5
            deficit <= "0000000";--0
        when s2 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001010";--10
            deficit <= "0000000";--0
        when s3 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001111";--15
            deficit <= "0000000";--0
        when s4 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0010100";--20
            deficit <= "0000000";--0
        when s5 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011001";--25
            deficit <= "0000000";--0
        when s6 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011110";--30
            deficit <= "0000000";--0
        when s7 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0100011";--35
            deficit <= "0000000";--0
        when s8 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0101000";--40
            deficit <= "0000000";--0
        when s9 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0101101";--45
            deficit <= "0000000";--0
        when s10=>
            v <= '0'; 
            ni <= '0';
            current_total <= "0110010"; --50
            deficit <= "0000000";--0
        when s11=>
            v <= '0'; 
            ni <= '0';
            current_total <= "0110111"; --55
            deficit <= "0000000";--0
        when s12=>
            v <= '0'; 
            ni <= '0';
            current_total <= "0111100"; --60
            deficit <= "0000000";--0
        when s13=>
            v <= '0'; 
            ni <= '0';
            current_total <= "1000001"; --65
            deficit <= "0000000";--0
        when s14=>
            v <= '0'; 
            ni <= '0';
            current_total <= "1000110"; --70
            deficit <= "0000000";--0
        when a0 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000000";--0
            deficit <= "0001111"; --15
        when a1 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000101";--5
            deficit <= "0001010"; --10
        when a2 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001010";--10
            deficit <= "0000101"; --5
        when a3 =>
            v <= '1'; 
            ni <= '0';
            current_total <= "0001111";--15
            deficit <= "0000000";--0
        when a4 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0010100";--20
            deficit <= "0000101" --5
        when a5 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0011001";--25
            deficit <= "0001010"; --10
        when a6 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0011110";--30
            deficit <= "0001111"; --15
        when a7 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0100011";--35
            deficit <= "0010100"; --20
        when a8 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101000";--40
            deficit <= "0011001"; --25
        when a9 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101101";--45
            deficit <= "0011110"; --30
        when a10=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110010"; --50
            deficit <= "0100011"; --35
        when a11=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110111"; --55
            deficit <= "0101000"; --40
        when a12=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0111100"; --60
            deficit <= "0101101"; --45
        when a13=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000001"; --65
            deficit <= "0110010"; --50
        when a14=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000110"; --70
            deficit <= "0110111"; --55
        when b0 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000000";--0
            deficit <= "0011001"; --25
        when b1 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000101";--5
            deficit <= "0010100"; --20
        when b2 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001010";--10
            deficit <= "0001111"; --15
        when b3 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001111";--15
            deficit <= "0001010"; --10
        when b4 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0010100";--20
            deficit <= "0000101"; --5
        when b5 =>
            v <= '1'; 
            ni <= '0';
            current_total <= "0011001";--25
            deficit <= "0000000";--0
        when b6 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0011110";--30
            deficit <= "0000101"; --5
        when b7 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0100011";--35
            deficit <= "0001010"; --10
        when b8 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101000";--40
            deficit <= "0001111"; --15
        when b9 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101101";--45
            deficit <= "0010100"; --20
        when b10=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110010"; --50
            deficit <= "0011001"; --25
        when b11=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110111"; --55
            deficit <= "0011110"; --30
        when b12=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0111100"; --60
            deficit <= "0100011"; --35
        when b13=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000001"; --65
            deficit <= "0101000"; --40
        when b14=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000110"; --70
            deficit <= "0101101"; --45
        when c0 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000000";--0
            deficit <= "0100011"; --35
        when c1 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000101";--5
            deficit <= "0011110"; --30
        when c2 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001010";--10
            deficit <= "0011001"; --25
        when c3 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001111";--15
            deficit <= "0010100"; --20
        when c4 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0010100";--20
            deficit <= "0001111"; --15
        when c5 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011001";--25
            deficit <= "0001010"; --10
        when c6 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011110";--30
            deficit <= "0000101"; --5
        when c7 =>
            v <= '1'; 
            ni <= '0';
            current_total <= "0100011";--35
            deficit <= "0000000";--0
        when c8 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101000";--40
            deficit <= "0000101"; --5
        when c9 =>
            v <= '0'; 
            ni <= '1';
            current_total <= "0101101";--45
            deficit <= "0001010"; --10
        when c10=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110010"; --50
            deficit <= "0001111"; --15
        when c11=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110111"; --55
            deficit <= "0010100"; --20
        when c12=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0111100"; --60
            deficit <= "0011001"; --25
        when c13=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000001"; --65
            deficit <= "0011110"; --30
        when c14=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000110"; --70
            deficit <= "0100011"; --35
        when d0 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000000";--0
            deficit <= "0110010"; --50
        when d1 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0000101";--5
            deficit <= "0101101"; --45
        when d2 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001010";--10
            deficit <= "0101000"; --40
        when d3 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0001111";--15
            deficit <= "0100011"; --35
        when d4 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0010100";--20
            deficit <= "0100011"; --30
        when d5 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011001";--25
            deficit <= "0011001"; --25
        when d6 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0011110";--30
            deficit <= "0010100"; --20
        when d7 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0100011";--35
            deficit <= "0001111"; --15
        when d8 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0101000";--40
            deficit <= "0001010"; --10
        when d9 =>
            v <= '0'; 
            ni <= '0';
            current_total <= "0101101";--45
            deficit <= "0000101"; --5
        when d10=>
            v <= '1'; 
            ni <= '0';
            current_total <= "0110010"; --50
            deficit <= "0000000";--0
        when d11=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0110111"; --55
            deficit <= "0000101"; --5
        when d12=>
            v <= '0'; 
            ni <= '1';
            current_total <= "0111100"; --60
            deficit <= "0001010"; --10
        when d13=>
        v <= '0'; 
            ni <= '1';
            current_total <= "1000001"; --65
            deficit <= "0001111"; --15
        when d14=>
            v <= '0'; 
            ni <= '1';
            current_total <= "1000110"; --70
            deficit <= "0010100"; --20
        when others => null;
    end case;
 
end process State_Outputs;


end vending_behav;

