--------------------------------------------------------------------------------
-- Felipe Machado Sanchez
-- Area de Tecnologia Electronica
-- Universidad Rey Juan Carlos
-- Version DSE 2018
-- Cada pantalla 16,672 ms
-- Frecuencia de refresco 59,981 Hz

-- El porche delantero de las filas tiene 10 filas en vez de 9:
-- por lo tanto 32 us mas

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package VGA_PKG is

--  Orden:
--  1) video activo, 2) porche delantero, 3) sincro 4) porche trasero
--  Empezamos por el visible para que sea mas facil saber en que pixel visible
--  estamos, ya que si no, habria que realizar una resta

--  Por ejemplo para 640x480@60 Hz:
---------- Pixeles (horizontal, columnas) ---------------------------------|
-- |                        |             |                 |              |
-- |      video activo      |   porche    |     sincro      |    porche    |
-- |                        | delantero   |   horizontal    |    trasero   |
-- |                        |             |                 |              |
-- |<--------- 640 -------->|<--- 16 ---->|<------ 96 ----->|<---- 48 ---->|
-- |                        |             |                 |              |
-- |      c_pxl_visible     |c_pxl_fporch |  c_pxl_synch    | c_pxl_bporch |
-- |                        |             |                 |              |
-- |                                      |                 |              |
-- |<----- c_pxl_2_fporch: 656 ---------->|                 |              |
-- |                                                        |              |
-- |<------------- c_pxl_2_synch: 752 --------------------->|              |
-- |                                                                       |
-- |<------------------------- c_pxl_total: 800 -------------------------->| 

---------- Lineas (vertical) ----------------------------------------------|
-- |                        |             |                 |              |
-- |      video activo      |   porche    |     sincro      |    porche    |
-- |                        | delantero   |   horizontal    |    trasero   |
-- |                        |             |                 |              |
-- |<--------- 480 -------->|<--- 10 ---->|<------ 2  ----->|<---- 29 ---->|
-- |                        |             |                 |              |
-- |      c_line_visible    |c_line_fporch|  c_line_synch   | c_line_bporch|
-- |                        |             |                 |              |
-- |                                      |                 |              |
-- |<----- c_line_2_fporch: 490 --------->|                 |              |
-- |                                                        |              |
-- |<------------- c_line_2_synch: 492 -------------------->|              |
-- |                                                                       |
-- |<------------------------- c_line_total: 521 ------------------------->| 

  -- Pixeles (horizontal o columnas):
  constant   c_pxl_visible    : natural := 640;
  constant   c_pxl_fporch     : natural := 16;
  -- del inicio hasta el porche delantero:
  constant   c_pxl_2_fporch   : natural := c_pxl_visible + c_pxl_fporch; -- 656
  constant   c_pxl_synch      : natural := 96;
  -- del inicio hasta la sincronizacion  
  constant   c_pxl_2_synch    : natural := c_pxl_2_fporch + c_pxl_synch; -- 752
  -- total de pixeles horizontales:
  constant   c_pxl_total      : natural := 800;
  -- el porche trasero:
  constant   c_pxl_bporch     : natural := c_pxl_total - c_pxl_2_synch;  --  48

  -- Filas (vertical):
  constant   c_line_visible    : natural := 480;
  constant   c_line_fporch     : natural := 10;
  -- del inicio hasta el porche delantero:
  constant   c_line_2_fporch   : natural := c_line_visible + c_line_fporch;--490
  constant   c_line_synch      : natural := 2;
  -- del inicio hasta la sincronizacion  
  constant   c_line_2_synch    : natural := c_line_2_fporch + c_line_synch;--492
  -- total de pixeles horizontales:
  constant   c_line_total      : natural := 521;
  -- el porche trasero:
  constant   c_line_bporch     : natural := c_line_total - c_line_2_synch;  --29

  -- numero de bits para la cuenta de pixeles(columnas) y filas
  constant c_nb_pxls : natural := 10;  --c_pxl_total      : natural := 800; 
  constant c_nb_lines: natural := 10;  --c_line_total     : natural := 521;

  -- numero de bits para cada color (RGB)
  constant c_nb_red   : natural := 4;
  constant c_nb_green : natural := 4;
  constant c_nb_blue  : natural := 4;

  -- frecuencia de la VGA
  constant c_freq_vga : natural := 25*10**6; -- VGA 25MHz

  -- nivel activo de sincronismo
  constant c_synch_act : std_logic := '0';

end VGA_PKG;