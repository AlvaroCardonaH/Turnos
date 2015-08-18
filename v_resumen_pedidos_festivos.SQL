CREATE VIEW v_resumen_pedidos_festivos AS 
    SELECT 
        `m`.`IdSede` AS `IdSede`,
        `m`.`NombreSede` AS `NombreSede`,
        `ped`.`IdReportePedidosxPdv` AS `IdReportePedidosxPdv`,
        `f`.`IdFlota` AS `IdFlota`,
        `f`.`NombreFlota` AS `NombreFlota`,
        2 AS `IdClasificacionDia`,
        'DIA FESTIVO' AS `NombreClasificacionDia`,
        `hf`.`NumeroPosicion` AS `NumeroPosicion`,
        `hor`.`IdHorario` AS `IdHorario`,
        `hor`.`HoraInicio` AS `HoraInicio`,
        `hor`.`HoraFinal` AS `HoraFinal`,
        1 AS `NumeroDiaSemana`,
        'DOMINGO - FESTIVO' AS `NombreDiaSemana`,
        COUNT(0) AS TotalRegistros
    FROM
        (((((`h_reportepedidosxpdv` `ped`
        JOIN `h_reportepedidosxpdvdetalle` `peddet` ON ((`ped`.`IdReportePedidosxPdv` = `peddet`.`IdReportePedidosxPdv`)))
        JOIN `m_horarioxflota` `hf` ON ((`ped`.`IdFlota` = `hf`.`IdFlota` AND peddet.HoraFechaPos = hf.IdHorario)))
        JOIN `m_flotas` `f` ON ((`hf`.`IdFlota` = `f`.`IdFlota`)))
        JOIN `m_sedes` `m` ON ((`f`.`IdSede` = `m`.`IdSede`)))
        JOIN `m_horario` `hor` ON (`peddet`.`HoraFechaPos` = `hor`.`IdHorario`))
    WHERE
        ((DAY(peddet.FechaPos1) NOT IN (SELECT dcf.NumeroDiaMes FROM m_diasclientefiel dcf WHERE dcf.IdFlota = ped.IdFlota))
            AND ((VerificarFechaFestivo(`peddet`.`FechaPos1`) = 1)
            OR (  DAYOFWEEK(peddet.FechaPos1) = 1  ))
            AND (`ped`.`CodigoEstadoRegistro` = 1)
            AND (`hf`.`CodigoEstadoRegistro` = 1)
            AND (`f`.`CodigoEstadoRegistro` = 1)
            AND (`m`.`CodigoEstadoRegistro` = 1)
            AND (`hor`.`CodigoEstadoRegistro` = 1))
    GROUP BY `m`.`IdSede` , `m`.`NombreSede` , `ped`.`IdReportePedidosxPdv` , `f`.`IdFlota` , `f`.`NombreFlota` , `hf`.`NumeroPosicion` , `hor`.`IdHorario` , `hor`.`HoraInicio` , `hor`.`HoraFinal`
