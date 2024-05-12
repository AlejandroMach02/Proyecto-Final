------- ROM creada automaticamente por ppm2rom -----------
------- Felipe Machado -----------------------------------
------- Departamento de Tecnologia Electronica -----------
------- Universidad Rey Juan Carlos ----------------------
------- http://gtebim.es ---------------------------------
----------------------------------------------------------
--------Datos de la imagen -------------------------------
--- Fichero original    : num32_play_sprite16x16.ppm 
--- Filas    : 512 
--- Columnas : 16 
--- Color    :  Blanco y negro. 2 niveles (1 bit)

-- 32 Imagenes, posiciones (5 bits mas significativos)
-- de 0x00 a 0x09: los numeros del 0 al 9
-- 0x0A: P
-- 0x0B: L
-- 0x0C: A
-- 0x0D: Y
-- 0x0E: S
-- 0x0F: T
-- 0x10: O
-- 0x11: W
-- 0x12: I
-- 0x13: N
-- 0x14: !
-- 0x15: :
-- 0x16: Mario
-- 0x17: Mario run
-- 0x18: Mario jump
-- 0x19: pacman
-- 0x1A: monster
-- 0x1B: monster afraid
-- 0x1C: cerezas
-- 0x1D: fresa
-- 0x1E: coche carreras hacia arriba
-- 0x1F: coche carreras diagonal



------ Puertos -------------------------------------------
-- Entradas ----------------------------------------------
--    clk  :  senal de reloj
--    addr :  direccion de la memoria
-- Salidas  ----------------------------------------------
--    dout :  dato de 16 bits de la direccion addr (un ciclo despues)


library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;


entity memo2_green_16x16 is
  port (
    clk  : in  std_logic;   -- reloj
    addr : in  std_logic_vector(9-1 downto 0);
    dout : out std_logic_vector(16-1 downto 0) 
  );
end memo2_green_16x16;


architecture BEHAVIORAL of memo2_green_16x16 is
  signal addr_int  : natural range 0 to 2**9-1;
  type memostruct is array (natural range<>) of std_logic_vector(16-1 downto 0);
  constant filaimg : memostruct := (
       "1111000000001111",
       "1110000000000111",
       "1100000000000011",
       "1100001110000011",
       "1100011110000011",
       "1100011110100011",
       "1100011100100011",
       "1100011101100011",
       "1100011001100011",
       "1100011011100011",
       "1100010011100011",
       "1100000111100011",
       "1100000111000011",
       "1100000000000011",
       "1110000000000111",
       "1111000000001111",
       "1111110000111111",
       "1111110000111111",
       "1111000000111111",
       "1111000000111111",
       "1100000000111111",
       "1100000000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1111111111000011",
       "1111111111000011",
       "1111000000000011",
       "1111000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100001111111111",
       "1100001111111111",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1111111111000011",
       "1111111111000011",
       "1111110000000011",
       "1111110000000011",
       "1111110000000011",
       "1111110000000011",
       "1111111111000011",
       "1111111111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1111001111111111",
       "1111001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000000",
       "1100000000000000",
       "1100000000000000",
       "1100000000000000",
       "1111111111000011",
       "1111111111000011",
       "1111111111000011",
       "1111111111000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100001111111111",
       "1100001111111111",
       "1100000000001111",
       "1100000000001111",
       "1100000000000011",
       "1100000000000011",
       "1111111111000011",
       "1111111111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111111111",
       "1100001111111111",
       "1100000000001111",
       "1100000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1111111111000011",
       "1111111111000011",
       "1111111100001111",
       "1111111100001111",
       "1111111100001111",
       "1111111100001111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000000011",
       "1111000000000011",
       "1111111111000011",
       "1111111111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000001111",
       "1100000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000001111",
       "1100000000001111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1111110000111111",
       "1111110000111111",
       "1111000000001111",
       "1111000000001111",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100001111111111",
       "1100001111111111",
       "1100000000001111",
       "1100000000001111",
       "1111000000000011",
       "1111000000000011",
       "1111111111000011",
       "1111111111000011",
       "1100000000000011",
       "1100000000000011",
       "1111000000001111",
       "1111000000001111",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111000000111111",
       "1111000000111111",
       "1100000000001111",
       "1100000000001111",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "1100000000001111",
       "1100000000001111",
       "1111000000111111",
       "1111000000111111",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000111111000011",
       "0000110011000011",
       "0000110011000011",
       "0000000000000011",
       "0000000000000011",
       "0000000000000011",
       "0000000000000011",
       "1100001100001111",
       "1100001100001111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111110000111111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1111000000001111",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100000011000011",
       "1100000011000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100000000000011",
       "1100001100000011",
       "1100001100000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111000011",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1111111111111111",
       "1111111111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1111111111111111",
       "1111111111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1100001111111111",
       "1111111111111111",
       "1111111111111111",
       "1111100000111111",
       "1111000000000111",
       "1111000110111111",
       "1110101110111111",
       "1110100111011111",
       "1110011110000111",
       "1111111111111111",
       "1111000000111111",
       "1110000000000111",
       "1100000000000011",
       "1111001001001111",
       "1111100000011111",
       "1111000000001111",
       "1111000110001111",
       "1111111111111111",
       "1111111111111111",
       "1111100000111111",
       "1111000000000111",
       "1111000110110001",
       "1110101110111001",
       "1110100111011101",
       "1110011110000011",
       "1111111111110011",
       "1100000000000111",
       "1100000000001111",
       "1110000000010011",
       "1111000010000011",
       "1111100000000011",
       "1111000000011111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111100000011111",
       "1111100000011111",
       "1000010110100001",
       "1000110110110001",
       "1100001111000011",
       "1100000110000011",
       "1100010000100011",
       "1110011111100111",
       "1110000000000111",
       "1111000000001111",
       "1100000000000011",
       "1100001001000011",
       "1100000000000011",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111110000111111",
       "1111000000001111",
       "1110000000000111",
       "1101100001100011",
       "1111110011110011",
       "1100110000110011",
       "1000110000110001",
       "1001100001100001",
       "1000000000000001",
       "1000000000000001",
       "1000000000000001",
       "1000000000000001",
       "1001000110001001",
       "1011100110011101",
       "1111111111111111",
       "1111111111111111",
       "1111110000111111",
       "1111000000001111",
       "1110000000000111",
       "1100000000000011",
       "1100000000000011",
       "1100011001100011",
       "1000011001100001",
       "1000000000000001",
       "1000000000000001",
       "1001100110011001",
       "1010011001100101",
       "1000000000000001",
       "1001000110001001",
       "1011100110011101",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1111111110001111",
       "1111111101101111",
       "1111111011101111",
       "1111110111011111",
       "1110000111011111",
       "1100000010000111",
       "1000000100000011",
       "1000001000000001",
       "1001001000000001",
       "1000101001000001",
       "1100001000100001",
       "1110000100000011",
       "1111111110000111",
       "1111111111111111",
       "1111111101111111",
       "1111111101111111",
       "1110001111110011",
       "1100000010001011",
       "1000001000000001",
       "1000100000010001",
       "1000000000000001",
       "1000010010010001",
       "1100000000000011",
       "1100010000000011",
       "1110000001000111",
       "1111000100000111",
       "1111100000001111",
       "1111110000011111",
       "1111111000111111",
       "1111111111111111",
       "1111111111111111",
       "1111111111111111",
       "1110011111100111",
       "1110000000000111",
       "1110000000000111",
       "1110011001100111",
       "1111111001111111",
       "1111110000111111",
       "1111110000111111",
       "1111100000011111",
       "1100100000010011",
       "1100000000000011",
       "1100000000000011",
       "1100100000010011",
       "1111111111111111",
       "1111111111111111",
       "1111111110111111",
       "1111111100011111",
       "1111111000011111",
       "1111111100001111",
       "1111111110000111",
       "1110111110000001",
       "1100011100000000",
       "1000110000110001",
       "0000000001111011",
       "0000000001111111",
       "1100000011111111",
       "1110000010111111",
       "1111000000011111",
       "1111100000111111",
       "1111110001111111",
       "1111110011111111"
        );

begin

  addr_int <= TO_INTEGER(unsigned(addr));

  P_ROM: process (clk)
  begin
    if clk'event and clk='1' then
      dout <= filaimg(addr_int);
    end if;
  end process;

end BEHAVIORAL;