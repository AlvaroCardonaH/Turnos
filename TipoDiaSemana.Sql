DELIMITER //
CREATE FUNCTION TipoDiaSemana(P_IdClasificacionDia INT, P_DiaSemana INT) RETURNS int(11)
BEGIN

	DECLARE Ln_IdClasificacionDia INT;
	DECLARE Ln_DiaSemana INT;
    
	-- Definición de la consulta
	DECLARE Cursor_DiasSemana CURSOR FOR
		SELECT IdClasificacionDia FROM m_DiasSemana WHERE NumeroDiaSemana = Ln_DiaSemana; 

	SET Ln_DiaSemana = P_DiaSemana;
	
	OPEN Cursor_DiasSemana        
    FETCH Cursor_DiasSemana INTO Ln_IdClasificacionDia;        
    CLOSE Cursor_DiasSemana;
    	
    RETURN Ln_IdClasificacionDia;    

END //