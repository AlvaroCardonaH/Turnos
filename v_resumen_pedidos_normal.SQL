CREATE VIEW v_resumen_pedidos_normal AS 
    SELECT 
        `m`.`IdSede` AS `IdSede`,
        `m`.`NombreSede` AS `NombreSede`,
        `ped`.`IdReportePedidosxPdv` AS `IdReportePedidosxPdv`,
        `f`.`IdFlota` AS `IdFlota`,
        `f`.`NombreFlota` AS `NombreFlota`,
        `cd`.`IdClasificacionDia` AS `IdClasificacionDia`,
        `cd`.`NombreClasificacionDia` AS `NombreClasificacionDia`,
        `hf`.`NumeroPosicion` AS `NumeroPosicion`,
        `hor`.`IdHorario` AS `IdHorario`,
        `hor`.`HoraInicio` AS `HoraInicio`,
        `hor`.`HoraFinal` AS `HoraFinal`,
        `ds`.`NumeroDiaSemana` AS `NumeroDiaSemana`,
        `ds`.`NombreDiaSemana` AS `NombreDiaSemana`,
        COUNT(0) AS TotalRegistros
    FROM
        (((((((`h_reportepedidosxpdv` `ped`
        JOIN `h_reportepedidosxpdvdetalle` `peddet` ON ((`ped`.`IdReportePedidosxPdv` = `peddet`.`IdReportePedidosxPdv`)))
		JOIN `m_horarioxflota` `hf` ON ((`ped`.`IdFlota` = `hf`.`IdFlota` AND peddet.HoraFechaPos = hf.IdHorario)))
        JOIN `m_flotas` `f` ON ((`hf`.`IdFlota` = `f`.`IdFlota`)))
        JOIN `m_sedes` `m` ON ((`f`.`IdSede` = `m`.`IdSede`)))
        JOIN `m_diassemana` `ds` ON ((DAYOFWEEK(`peddet`.`FechaPos1`) = `ds`.`NumeroDiaSemana`)))
        JOIN `m_clasificaciondias` `cd` ON ((`ds`.`IdClasificacionDia` = `cd`.`IdClasificacionDia`)))
        JOIN `m_horario` `hor` ON (`peddet`.`HoraFechaPos` = `hor`.`IdHorario`))
    WHERE
        ((DAY(peddet.FechaPos1) NOT IN (SELECT dcf.NumeroDiaMes FROM m_diasclientefiel dcf WHERE dcf.IdFlota = ped.IdFlota))
            AND (VerificarFechaFestivo(`peddet`.`FechaPos1`) = 0)
            AND (DAYOFWEEK(peddet.FechaPos1) != 1  )
            AND (`ped`.`CodigoEstadoRegistro` = 1)
            AND (`hf`.`CodigoEstadoRegistro` = 1)
            AND (`f`.`CodigoEstadoRegistro` = 1)
            AND (`m`.`CodigoEstadoRegistro` = 1)
            AND (`ds`.`CodigoEstadoRegistro` = 1)
            AND (`cd`.`CodigoEstadoRegistro` = 1)
            AND (`hor`.`CodigoEstadoRegistro` = 1))
    GROUP BY `m`.`IdSede` , `m`.`NombreSede` , `ped`.`IdReportePedidosxPdv` , `f`.`IdFlota` , `f`.`NombreFlota` , `cd`.`IdClasificacionDia` , `cd`.`NombreClasificacionDia` , `hf`.`NumeroPosicion` , `hor`.`IdHorario` , `hor`.`HoraInicio` , `hor`.`HoraFinal` , `ds`.`NumeroDiaSemana` , `ds`.`NombreDiaSemana`
    ORDER BY 1 , 3 , 4 , 6 , 8 , 12