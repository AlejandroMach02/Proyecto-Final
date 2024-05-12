library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;


-- la pista para evitar utilizar una memoria y gestionar los accesos
package racetrack_pkg is

  type memoracetrack is array (natural range<>) of
       std_logic_vector(32-1 downto 0);
  constant pista : memoracetrack := (
       "00000000000000000000000000000000",
       "00000000000000000000000000000000",
       "00000011111111110000000000000000",
       "00001111111111111000000000000000",
       "00011111111111111100000000000000",
       "00111111111111111110000000000000",
       "00111111111000111111111111100000",
       "00111111100000011111111111110000",
       "00111111000000001111111111111000",
       "00111111000000000000000011111000",
       "00111110000000000000000001111100",
       "00111110000000000000000011111100",
       "00111110000000000000111111111100",
       "00111110000000000001111111111000",
       "00111111000000000001111111100000",
       "00111111110000000001110000000000",
       "00111111111000000001110000000000",
       "00011111111100000001111111100000",
       "00001111111110000001111111110000",
       "00000111111111000000111111111000",
       "00000000111111000000000011111100",
       "00000000011111000000000011111100",
       "00000000011111000000000011111100",
       "00000000011111111111111111111100",
       "00000000011111111111111111111100",
       "00000000011111111111111111111100",
       "00000000001111111111111111111000",
       "00000000000111111111111111110000",
       "00000000000000000000000000000000",
       "00000000000000000000000000000000"
        );


end racetrack_pkg;