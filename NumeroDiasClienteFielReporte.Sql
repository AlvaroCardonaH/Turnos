CREATE FUNCTION NumeroDiasClienteFielReporte(pIdReportePedidosxPdv INT, 
													pIdFlota INT) RETURNS int(11)
BEGIN

	DECLARE NumeroDias INT;

	DECLARE cDiasClienteFiel CURSOR FOR
		SELECT  SQL_CALC_FOUND_ROWS ped.IdReportePedidosxPdv, ped.IdFlota, DAY(peddet.FechaPos1), COUNT(*) AS Total
		FROM h_reportepedidosxpdvDetalle peddet INNER JOIN
		h_reportepedidosxpdv ped ON peddet.IdReportePedidosxPdv = ped.IdReportePedidosxPdv
		WHERE (peddet.FechaPos1 >= ped.FechaInicio AND peddet.FechaPos1 <= ped.FechaFinal)
		AND (DAY(peddet.FechaPos1) IN (SELECT dcf.NumeroDiaMes FROM m_diasclientefiel dcf WHERE dcf.IdFlota = ped.IdFlota))
		AND (ped.IdReportePedidosxPdv = pIdReportePedidosxPdv AND ped.IdFlota = pIdFlota)
		GROUP BY ped.IdReportePedidosxPdv, ped.IdFlota, DAY(peddet.FechaPos1);

	OPEN cDiasClienteFiel;
	SELECT FOUND_ROWS() INTO NumeroDias;
    CLOSE cDiasClienteFiel;
    
	RETURN NumeroDias;
END