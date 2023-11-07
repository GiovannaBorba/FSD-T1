--------------------------------------------------------------------------------
-- RELOGIO DE XADREZ
-- Arthur Mazot, Giovanna Borba - 09/out/2023
--------------------------------------------------------------------------------
library IEEE;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;

----------------------------------------------------------------------------------------------
entity relogio_xadrez is
    port( 
        reset : in std_logic;
        clock : in std_logic;
        load : in std_logic;
        init_time : in std_logic_vector(7 downto 0);
        j1, j2 : in std_logic;
        contj1, contj2 : out std_logic_vector(15 downto 0);
        winJ1, winJ2 : out std_logic
        
        -- COMPLETAR DE ACORDO COM A ESPECIFICACAO
    );
end relogio_xadrez;
----------------------------------------------------------------------------------------------
architecture relogio_xadrez of relogio_xadrez is
    -- DECLARACAO DOS ESTADOS
    type states is (
        init_game,
        j1_turn ,
        j2_turn ,
        j1_Victory , 
        j2_Victory 
    );
    signal EA, PE : states;  
    signal auxCount1 : std_logic_vector(15 downto 0);
    signal auxCount2 : std_logic_vector(15 downto 0);

    -- ADICIONE AQUI OS SINAIS INTERNOS NECESSARIOS
----------------------------------------------------------------------------------------------   
begin

    -- INSTANCIACAO DOS CONTADORES
    contador1 : entity work.temporizador port map (
    reset => reset,
    clock => clock, 
    load => load, 
    init_time => init_time (7 downto 0), 
    en => j1,
    cont => auxCount1

    );
------------------------------------------------------
    contador2 : entity work.temporizador port map (
    reset => reset, 
    clock => clock, 
    load => load, 
    init_time => init_time (7 downto 0),
    en => j2,
    cont => auxCount2
    );
----------------------------------------------------------------------------------------------
    -- PROCESSO DE TROCA DE ESTADOS
    process (clock, reset)
    begin
        if clock'event and clock = '1' then 
                EA <= PE;
        elsif reset = '1' then 
                EA <= init_game; 
                PE <= init_game; 
        end if;
        -- COMPLETAR COM O PROCESSO DE TROCA DE ESTADO
    end process;

    -- PROCESSO PARA DEFINIR O PROXIMO ESTADO
    process () --<<< Nao esqueca de adicionar os sinais da lista de sensitividade
    begin
        case EA is
            
            --COMPLETAR O CASE PARA CADA UM DOS ESTADOS DA SUA MAQUINA

        end case;
    end process;

    
    -- ATRIBUICAO COMBINACIONAL DOS SINAIS INTERNOS E SAIDAS - Dica: faca uma maquina de Moore, desta forma os sinais dependem apenas do estado atual!!
    
----------------------------------------------------------------------------------------------
end relogio_xadrez;


