CREATE VIEW v_resumen_clasificacion_dias AS
SELECT rep.IdReportePedidosxPdv, 1 AS IdClasificacionDia,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 0),0) AS HoraCero,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 1),0) AS HoraUno,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 2),0) AS HoraDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 3),0) AS HoraTres,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 4),0) AS HoraCuatro,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 5),0) AS HoraCinco,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 6),0) AS HoraSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 7),0) AS HoraSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 8),0) AS HoraOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 9),0) AS HoraNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 10),0) AS HoraDiez,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 11),0) AS HoraOnce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 12),0) AS HoraDoce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 13),0) AS HoraTrece,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 14),0) AS HoraCatorce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 15),0) AS HoraQuince,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 16),0) AS HoraDieciSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 17),0) AS HoraDieciSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 18),0) AS HoraDieciOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 19),0) AS HoraDieciNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 20),0) AS HoraVeinte,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 21),0) AS HoraVeintiUna,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 22),0) AS HoraVeintiDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 1 AND IdHorario = 23),0) AS HoraVeintiTres        
FROM h_reportepedidosxpdv  rep 
UNION 
SELECT rep.IdReportePedidosxPdv, 2 AS IdClasificacionDia, 
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 0),0) AS HoraCero,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 1),0) AS HoraUno,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 2),0) AS HoraDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 3),0) AS HoraTres,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 4),0) AS HoraCuatro,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 5),0) AS HoraCinco,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 6),0) AS HoraSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 7),0) AS HoraSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 8),0) AS HoraOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 9),0) AS HoraNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 10),0) AS HoraDiez,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 11),0) AS HoraOnce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 12),0) AS HoraDoce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 13),0) AS HoraTrece,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 14),0) AS HoraCatorce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 15),0) AS HoraQuince,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 16),0) AS HoraDieciSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 17),0) AS HoraDieciSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 18),0) AS HoraDieciOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 19),0) AS HoraDieciNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 20),0) AS HoraVeinte,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 21),0) AS HoraVeintiUna,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 22),0) AS HoraVeintiDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Festivo FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 2 AND IdHorario = 23),0) AS HoraVeintiTres        
FROM h_reportepedidosxpdv  rep  
UNION 
SELECT rep.IdReportePedidosxPdv, 3 AS IdClasificacionDia, 
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 0),0) AS HoraCero,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 1),0) AS HoraUno,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 2),0) AS HoraDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 3),0) AS HoraTres,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 4),0) AS HoraCuatro,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 5),0) AS HoraCinco,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 6),0) AS HoraSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 7),0) AS HoraSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 8),0) AS HoraOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 9),0) AS HoraNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 10),0) AS HoraDiez,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 11),0) AS HoraOnce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 12),0) AS HoraDoce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 13),0) AS HoraTrece,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 14),0) AS HoraCatorce,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 15),0) AS HoraQuince,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 16),0) AS HoraDieciSeis,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 17),0) AS HoraDieciSiete,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 18),0) AS HoraDieciOcho,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 19),0) AS HoraDieciNueve,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 20),0) AS HoraVeinte,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 21),0) AS HoraVeintiUna,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 22),0) AS HoraVeintiDos,
		IFNULL((SELECT res.Promedio_Mensajeros_Hora_Normal FROM t_resumen_clasificacion_dias res
        WHERE res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv AND 
        IdClasificacionDia = 3 AND IdHorario = 23),0) AS HoraVeintiTres        
FROM h_reportepedidosxpdv  rep;
            