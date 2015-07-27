DELIMITER //

CREATE PROCEDURE Crear_ProgramacionSugerida(
			P_IdReportePedidosxPdv INT,
            P_NumeroMensajeros INT,
            P_FechaInicio DATE, 
            P_FechaFinal DATE, 
            P_IdUsuarioGraba INT)
BEGIN

	DECLARE Ln_IdClasificacionDia INT;
	DECLARE Ln_IdFlota INT;
	
	DECLARE Cursor_Reporte CURSOR FOR
		SELECT RP.IdFlota
		FROM h_reportepedidosxpdv RP 
		WHERE RP.IdReportePedidosxPdv = P_IdReportePedidosxPdv;	
	
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_Reporte;        
    FETCH Cursor_Reporte INTO Ln_IdFlota;        
    CLOSE Cursor_Reporte;	

	SET Ln_IdClasificacionDia = 1;	
	CALL Crear_ProgramacionSugerida_Inicial (P_IdReportePedidosxPdv,
											Ln_IdClasificacionDia ,
											P_NumeroMensajeros ,
											Ln_IdFlota ,
											P_FechaInicio , 
											P_FechaFinal, 
											P_IdUsuarioGraba );
	
	SET Ln_IdClasificacionDia = 2;	
	CALL Crear_ProgramacionSugerida_FestivosDominical (P_IdReportePedidosxPdv,
													Ln_IdClasificacionDia ,
													P_NumeroMensajeros ,
													Ln_IdFlota ,
													P_FechaInicio , 
													P_FechaFinal, 
													P_IdUsuarioGraba );

	SET Ln_IdClasificacionDia = 3;	
	CALL Crear_ProgramacionSugerida_Inicial (P_IdReportePedidosxPdv,
											Ln_IdClasificacionDia ,
											P_NumeroMensajeros ,
											Ln_IdFlota ,
											P_FechaInicio , 
											P_FechaFinal, 
											P_IdUsuarioGraba );
													
END //