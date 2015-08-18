
CREATE PROCEDURE Generar_Resumen_DiaNormal(P_IdReportePedidosxPdv INT, 
											P_IdClasificacionDia INT, 
											P_NumeroMensajeros_Hora DECIMAL (2,1))
BEGIN

	-- Declaración de variables
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_NumeroDiaSemana INT; 
	DECLARE Lc_NombreDiaSemana VARCHAR(20);
	DECLARE Ln_NumeroServicios INT;
	DECLARE Ln_No_Mas_Datos INT;
    DECLARE Ln_TotalRegistros INT;

	DECLARE Ln_NumeroPosicion_Aux INT;
	DECLARE Ln_IdHorario_Aux INT; 
	DECLARE Lc_HoraInicio_Aux VARCHAR(5) ;
	DECLARE Lc_HoraFinal_Aux VARCHAR(5); 
	
	DECLARE Ln_NumeroServicios_Lunes INT;
	DECLARE Ln_NumeroServicios_Martes INT;
	DECLARE Ln_NumeroServicios_Miercoles INT;
	DECLARE Ln_NumeroServicios_Jueves INT;
	DECLARE Ln_NumeroServicios_Viernes INT;
	DECLARE Ln_NumeroServicios_Sabado INT;

	DECLARE Ln_Numero_Mensajeros_Lunes INT;
	DECLARE Ln_Numero_Mensajeros_Martes INT;
	DECLARE Ln_Numero_Mensajeros_Miercoles INT;
	DECLARE Ln_Numero_Mensajeros_Jueves INT;
	DECLARE Ln_Numero_Mensajeros_Viernes INT;
	DECLARE Ln_Numero_Mensajeros_Sabado INT;
        
    DECLARE Ln_Promedio_Mensajeros_Hora_Normal INT;
    DECLARE Ln_NumeroMensajeros_Dia INT;
    DECLARE Ln_NumeroDias INT;

    DECLARE Ln_NumeroDiasNormal INT;
    DECLARE Ln_IdFlota INT;    

	-- Definición de la consulta
	DECLARE Cursor_Resumen_Normal CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, NumeroDiaSemana, NombreDiaSemana, TotalRegistros 
			FROM copservir_turnos.v_resumen_pedidos_normal
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv
			ORDER BY NumeroPosicion, NumeroDiaSemana; 

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;

    -- Eliminar Resumen del Reporte y del Tipo de Dia
    DELETE FROM t_resumen_clasificacion_dias
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia;

    -- Datos del Reporte
    SELECT IdFlota INTO Ln_IdFlota FROM h_reportepedidosxpdv 
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv;

	CREATE TEMPORARY TABLE Tmp_Servicios_DiaSemana AS (
		SELECT  ped.IdReportePedidosxPdv, ped.IdFlota, MONTH(peddet.FechaPos1) AS MES, DAY(peddet.FechaPos1) AS DIAMES, 
		DAYOFWEEK(peddet.FechaPos1) AS DIASEMANA, COUNT(*) AS TOTAL
		FROM h_reportepedidosxpdvDetalle peddet INNER JOIN
		h_reportepedidosxpdv ped ON peddet.IdReportePedidosxPdv = ped.IdReportePedidosxPdv
		WHERE (peddet.FechaPos1 >= ped.FechaInicio AND peddet.FechaPos1 <= ped.FechaFinal)
		AND (DAY(peddet.FechaPos1) NOT IN (SELECT dcf.NumeroDiaMes FROM m_diasclientefiel dcf WHERE dcf.IdFlota = ped.IdFlota))
		AND (DAYOFWEEK(peddet.FechaPos1) != 1) 
		AND (verificarFechaFestivo (peddet.FechaPos1) != 1)
		AND (ped.IdReportePedidosxPdv = P_IdReportePedidosxPdv AND ped.IdFlota = Ln_IdFlota)
		GROUP BY ped.IdReportePedidosxPdv, ped.IdFlota, MONTH(peddet.FechaPos1), 
				DAY(peddet.FechaPos1), DAYOFWEEK(peddet.FechaPos1));
                                	
	-- Abrimos el cursor
	OPEN Cursor_Resumen_Normal;

	-- Obtenemos la primera fila en la variables correspondientes
	FETCH Cursor_Resumen_Normal 
		INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_TotalRegistros;		

	-- Comenzamos nuestro bucle de lectura
	Resumen_Loop: WHILE (Ln_No_Mas_Datos = 0) DO

		-- Si el cursor se quedó sin elementos, entonces nos salimos del bucle        
		
		SET Ln_NumeroPosicion_Aux = Ln_NumeroPosicion ;
		SET Ln_IdHorario_Aux = Ln_IdHorario;
		SET Lc_HoraInicio_Aux = Lc_HoraInicio;
		SET Lc_HoraFinal_Aux = Lc_HoraFinal;
		
		SET Ln_NumeroServicios_Lunes = 0;
		SET Ln_NumeroServicios_Martes = 0; 
		SET Ln_NumeroServicios_Miercoles = 0;
		SET Ln_NumeroServicios_Jueves = 0;
		SET Ln_NumeroServicios_Viernes = 0;
		SET Ln_NumeroServicios_Sabado = 0;

		SET Ln_Numero_Mensajeros_Lunes = 0;
		SET Ln_Numero_Mensajeros_Martes = 0; 
		SET Ln_Numero_Mensajeros_Miercoles = 0;
		SET Ln_Numero_Mensajeros_Jueves = 0;
		SET Ln_Numero_Mensajeros_Viernes = 0;
		SET Ln_Numero_Mensajeros_Sabado = 0;
        
        SET Ln_Promedio_Mensajeros_Hora_Normal = 0;
        SET Ln_NumeroMensajeros_Dia = 0;
        SET Ln_NumeroDias = 0;
		
		NumeroPosicion_Loop : WHILE ( (Ln_No_Mas_Datos = 0) && (Ln_NumeroPosicion_Aux = Ln_NumeroPosicion) ) DO
				
            -- SET Ln_NumeroDiasNormal = NumeroDiasPromedioReporte (P_IdReportePedidosxPdv, Ln_IdFlota, Ln_NumeroDiaSemana);    
			SELECT COUNT(*) INTO Ln_NumeroDiasNormal FROM Tmp_Servicios_DiaSemana 
				WHERE DiaSemana = Ln_NumeroDiaSemana;
                
            SET Ln_NumeroServicios = CEILING(Ln_TotalRegistros / Ln_NumeroDiasNormal);
            
			CASE Ln_NumeroDiaSemana
				WHEN 2 THEN
					SET Ln_NumeroServicios_Lunes = Ln_NumeroServicios;  
                    SET Ln_Numero_Mensajeros_Lunes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 3 THEN
					SET Ln_NumeroServicios_Martes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Martes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 4 THEN
					SET Ln_NumeroServicios_Miercoles = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Miercoles = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 5 THEN
					SET Ln_NumeroServicios_Jueves = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Jueves = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 6 THEN
					SET Ln_NumeroServicios_Viernes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Viernes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 7 THEN
					SET Ln_NumeroServicios_Sabado = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Sabado = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				ELSE
					SET Ln_NumeroServicios = 0;
			END CASE;
            
			-- Obtenemos la primera fila en la variables correspondientes
			FETCH Cursor_Resumen_Normal 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_TotalRegistros;		
		
			IF Ln_No_Mas_Datos = 1 THEN
				LEAVE Resumen_Loop;
			END IF;
		
		END WHILE NumeroPosicion_Loop;
        
        SET Ln_NumeroMensajeros_Dia =   Ln_Numero_Mensajeros_Lunes + Ln_Numero_Mensajeros_Martes +
										Ln_Numero_Mensajeros_Miercoles + Ln_Numero_Mensajeros_Jueves +
                                        Ln_Numero_Mensajeros_Viernes + Ln_Numero_Mensajeros_Sabado;
        
        IF Ln_NumeroDias > 0 THEN
			SET Ln_Promedio_Mensajeros_Hora_Normal = CEIL(Ln_NumeroMensajeros_Dia / Ln_NumeroDias);
        ELSE
			SET Ln_Promedio_Mensajeros_Hora_Normal = 0;
        END IF;        
        		
		INSERT INTO t_resumen_clasificacion_dias (IdReportePedidosxPdv, IdClasificacionDia, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, Lunes_Servicios,
			Martes_Servicios, Miercoles_Servicios, Jueves_Servicios, Viernes_Servicios, Sabado_Servicios, Promedio_Mensajeros_Hora_Normal,
            Numero_Mensajeros_Lunes, Numero_Mensajeros_Martes, Numero_Mensajeros_Miercoles, Numero_Mensajeros_Jueves,
            Numero_Mensajeros_Viernes, Numero_Mensajeros_Sabado) VALUES 
			(P_IdReportePedidosxPdv, P_IdClasificacionDia, Ln_NumeroPosicion_Aux, Ln_IdHorario_Aux, Lc_HoraInicio_Aux, Lc_HoraFinal_Aux, Ln_NumeroServicios_Lunes,
			Ln_NumeroServicios_Martes, Ln_NumeroServicios_Miercoles, Ln_NumeroServicios_Jueves, Ln_NumeroServicios_Viernes, Ln_NumeroServicios_Sabado,
            Ln_Promedio_Mensajeros_Hora_Normal, Ln_Numero_Mensajeros_Lunes, Ln_Numero_Mensajeros_Martes, Ln_Numero_Mensajeros_Miercoles, Ln_Numero_Mensajeros_Jueves,
            Ln_Numero_Mensajeros_Viernes, Ln_Numero_Mensajeros_Sabado);
		
    END WHILE Resumen_Loop;
    
	CLOSE Cursor_Resumen_Normal;
    
    DROP TEMPORARY TABLE IF EXISTS Tmp_Servicios_DiaSemana  ;
    
	SET Ln_No_Mas_Datos = 0;		

END