DELIMITER //
CREATE PROCEDURE Generar_Resumen_DiaFestivo(
					P_IdReportePedidosxPdv INT, 
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

	DECLARE Ln_NumeroPosicion_Aux INT;
	DECLARE Ln_IdHorario_Aux INT; 
	DECLARE Lc_HoraInicio_Aux VARCHAR(5) ;
	DECLARE Lc_HoraFinal_Aux VARCHAR(5); 

	DECLARE Ln_NumeroServicios_Domingo INT;	
	DECLARE Ln_NumeroServicios_Lunes INT;
	DECLARE Ln_NumeroServicios_Martes INT;
	DECLARE Ln_NumeroServicios_Miercoles INT;
	DECLARE Ln_NumeroServicios_Jueves INT;
	DECLARE Ln_NumeroServicios_Viernes INT;
	DECLARE Ln_NumeroServicios_Sabado INT;

	DECLARE Ln_Numero_Mensajeros_Domingo INT;
	DECLARE Ln_Numero_Mensajeros_Lunes INT;
	DECLARE Ln_Numero_Mensajeros_Martes INT;
	DECLARE Ln_Numero_Mensajeros_Miercoles INT;
	DECLARE Ln_Numero_Mensajeros_Jueves INT;
	DECLARE Ln_Numero_Mensajeros_Viernes INT;
	DECLARE Ln_Numero_Mensajeros_Sabado INT;
        
    DECLARE Ln_Promedio_Mensajeros_Hora_Festivo INT;
    DECLARE Ln_NumeroMensajeros_Dia INT;
    DECLARE Ln_NumeroDias INT;

	-- Definición de la consulta
	DECLARE Cursor_Resumen_Festivo CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, NumeroDiaSemana, NombreDiaSemana, NumeroServicios 
			FROM copservir_turnos.v_resumen_pedidos_festivos
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv
			ORDER BY NumeroPosicion, NumeroDiaSemana; 

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;
    
    -- Eliminar Resumen del Reporte y del Tipo de Dia
    DELETE FROM t_resumen_clasificacion_dias
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia;
	
	-- Abrimos el cursor
	OPEN Cursor_Resumen_Festivo;

	-- Obtenemos la primera fila en la variables correspondientes
	FETCH Cursor_Resumen_Festivo 
		INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		

	-- Comenzamos nuestro bucle de lectura
	Resumen_Loop: WHILE (Ln_No_Mas_Datos = 0) DO

		-- Si el cursor se quedó sin elementos, entonces nos salimos del bucle
		
		SET Ln_NumeroPosicion_Aux = Ln_NumeroPosicion ;
		SET Ln_IdHorario_Aux = Ln_IdHorario;
		SET Lc_HoraInicio_Aux = Lc_HoraInicio;
		SET Lc_HoraFinal_Aux = Lc_HoraFinal;
		
        SET Ln_NumeroServicios_Domingo = 0;
		SET Ln_NumeroServicios_Lunes = 0;
		SET Ln_NumeroServicios_Martes = 0; 
		SET Ln_NumeroServicios_Miercoles = 0;
		SET Ln_NumeroServicios_Jueves = 0;
		SET Ln_NumeroServicios_Viernes = 0;
		SET Ln_NumeroServicios_Sabado = 0;

		SET Ln_Numero_Mensajeros_Domingo = 0;
		SET Ln_Numero_Mensajeros_Lunes = 0;
		SET Ln_Numero_Mensajeros_Martes = 0; 
		SET Ln_Numero_Mensajeros_Miercoles = 0;
		SET Ln_Numero_Mensajeros_Jueves = 0;
		SET Ln_Numero_Mensajeros_Viernes = 0;
		SET Ln_Numero_Mensajeros_Sabado = 0;
        
        SET Ln_Promedio_Mensajeros_Hora_Festivo = 0;
        SET Ln_NumeroMensajeros_Dia = 0;
        SET Ln_NumeroDias = 0;
		
		NumeroPosicion_Loop : WHILE ( (Ln_No_Mas_Datos = 0) && (Ln_NumeroPosicion_Aux = Ln_NumeroPosicion) ) DO
				
			CASE Ln_NumeroDiaSemana
				WHEN 1 THEN
					SET Ln_NumeroServicios_Domingo = Ln_NumeroServicios;  
                    SET Ln_Numero_Mensajeros_Domingo = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;            
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
			FETCH Cursor_Resumen_Festivo 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		
		
			IF Ln_No_Mas_Datos = 1 THEN
				LEAVE Resumen_Loop;
			END IF;
		
		END WHILE NumeroPosicion_Loop;
        
        SET Ln_NumeroMensajeros_Dia =	Ln_Numero_Mensajeros_Domingo +     
										Ln_Numero_Mensajeros_Lunes + Ln_Numero_Mensajeros_Martes +
										Ln_Numero_Mensajeros_Miercoles + Ln_Numero_Mensajeros_Jueves +
                                        Ln_Numero_Mensajeros_Viernes + Ln_Numero_Mensajeros_Sabado;
        
        IF Ln_NumeroDias > 0 THEN
			SET Ln_Promedio_Mensajeros_Hora_Festivo = CEIL(Ln_NumeroMensajeros_Dia / Ln_NumeroDias);
        ELSE
			SET Ln_Promedio_Mensajeros_Hora_Festivo = 0;
        END IF;        
        		
		INSERT INTO t_resumen_clasificacion_dias (IdReportePedidosxPdv, IdClasificacionDia, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, Lunes_Servicios,
			Martes_Servicios, Miercoles_Servicios, Jueves_Servicios, Viernes_Servicios, Sabado_Servicios, Domingo_Servicios, Promedio_Mensajeros_Hora_Festivo,
            Numero_Mensajeros_Lunes, Numero_Mensajeros_Martes, Numero_Mensajeros_Miercoles, Numero_Mensajeros_Jueves, Numero_Mensajeros_Viernes, 
            Numero_Mensajeros_Sabado, Numero_Mensajeros_Domingo) VALUES 
			(P_IdReportePedidosxPdv, P_IdClasificacionDia, Ln_NumeroPosicion_Aux, Ln_IdHorario_Aux, Lc_HoraInicio_Aux, Lc_HoraFinal_Aux, Ln_NumeroServicios_Lunes,
			Ln_NumeroServicios_Martes, Ln_NumeroServicios_Miercoles, Ln_NumeroServicios_Jueves, Ln_NumeroServicios_Viernes, Ln_NumeroServicios_Sabado,
            Ln_NumeroServicios_Domingo, Ln_Promedio_Mensajeros_Hora_Festivo, Ln_Numero_Mensajeros_Lunes, Ln_Numero_Mensajeros_Martes, Ln_Numero_Mensajeros_Miercoles, Ln_Numero_Mensajeros_Jueves,
            Ln_Numero_Mensajeros_Viernes, Ln_Numero_Mensajeros_Sabado, Ln_Numero_Mensajeros_Domingo);
		
    END WHILE Resumen_Loop;
    
	CLOSE Cursor_Resumen_Festivo;
    
	SET Ln_No_Mas_Datos = 0;		

END //