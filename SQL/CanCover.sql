


USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, Left(E.EventDateTime,11) AS EventDate, T.Name AS CanopyType, C.ReadingNumber, C.DotScore 

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.CanopyCOver AS C
  ON S.ID = C.SubPlotID
  JOIN LU.CanopyType AS T
  ON T.ID = C.CanopyTypeID

  
/*
WHERE (E.EventDateTime > CAST('20160101' AS datetime)) AND 
     ((LEFT(L.LocationName,4) = 'PERI') OR 
     (LEFT(L.LocationName,4) = 'GWCA') OR 
	 (LEFT(L.LocationName,4) = 'WICR'))

*/

WHERE (E.EventDateTime > CAST('20210101' AS datetime))

ORDER BY Plot, SubPlot, EventDate, CanopyType, ReadingNumber