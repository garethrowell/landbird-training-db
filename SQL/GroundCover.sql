

USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, Left(E.EventDateTime,11) AS EventDate, T.Name AS GroundCover, C.Code AS CoverClass

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.GroundCover AS G
  ON S.ID = G.SubPlotID
  JOIN LU.GroundCoverType AS T
  ON T.ID = G.GroundCoverTypeID
  JOIN LU.GroundCoverClass AS C
  ON C.ID = G.GroundCoverClassID

/*
WHERE (E.EventDateTime > CAST('20160101' AS datetime)) AND 
     ((LEFT(L.LocationName,4) = 'PERI') OR 
     (LEFT(L.LocationName,4) = 'GWCA') OR 
	 (LEFT(L.LocationName,4) = 'WICR'))
*/

WHERE (E.EventDateTime > CAST('20210101' AS datetime))

ORDER BY Plot, SubPlot, EventDate, GroundCover

