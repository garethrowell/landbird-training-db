



USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, Left(E.EventDateTime,11) AS EventDate, T.Name AS FoliarCover, C.Code AS CoverClass

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.FoliarCover AS F
  ON S.ID = F.SubPlotID
  JOIN LU.FoliarCoverType AS T
  ON T.ID = F.FoliarCoverTypeID
  JOIN LU.FoliarCoverClass AS C
  ON C.ID = F.FoliarCoverClassID

/*
WHERE (E.EventDateTime > CAST('20160101' AS datetime)) AND 
     ((LEFT(L.LocationName,4) = 'PERI') OR 
     (LEFT(L.LocationName,4) = 'GWCA') OR 
	 (LEFT(L.LocationName,4) = 'WICR'))
*/

WHERE (E.EventDateTime > CAST('20210101' AS datetime))

ORDER BY Plot, SubPlot, EventDate, FoliarCover
