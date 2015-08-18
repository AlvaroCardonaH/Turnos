CREATE FUNCTION NumeroDiasFestivoReporte(pIdReportePedidosxPdv INT, 
													pIdFlota INT) RETURNS int(11)
BEGIN

DECLARE NumeroDias INT;

	DECLARE cDiasFestivo CURSOR FOR
		SELECT  ped.IdReportePedidosxPdv, ped.IdFlota, MONTH(peddet.FechaPos1), DAY(peddet.FechaPos1), COUNT(*) 
		FROM h_reportepedidosxpdvDetalle peddet INNER JOIN
		h_reportepedidosxpdv ped ON peddet.IdReportePedidosxPdv = ped.IdReportePedidosxPdv
		WHERE (peddet.FechaPos1 >= ped.FechaInicio AND peddet.FechaPos1 <= ped.FechaFinal)
		AND (DAY(peddet.FechaPos1) NOT IN (SELECT dcf.NumeroDiaMes FROM m_diasclientefiel dcf WHERE dcf.IdFlota = ped.IdFlota))
		AND ((DAYOFWEEK(peddet.FechaPos1) = 1) OR (verificarFechaFestivo (peddet.FechaPos1)= 1))
		AND (ped.IdReportePedidosxPdv = pIdReportePedidosxPdv AND ped.IdFlota = pIdFlota)
		GROUP BY ped.IdReportePedidosxPdv, ped.IdFlota, MONTH(peddet.FechaPos1), DAY(peddet.FechaPos1);

	OPEN cDiasFestivo;
	SELECT FOUND_ROWS() INTO NumeroDias;
    CLOSE cDiasFestivo;
    
	RETURN NumeroDias;

END