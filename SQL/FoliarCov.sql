




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


WHERE ((LEFT(L.LocationName,4) = 'EFMO') OR (LEFT(L.LocationName,4) = 'HEHO') 
     OR (LEFT(L.LocationName,4) = 'HOME') OR (LEFT(L.LocationName,4) = 'PIPE')) 

-- (E.EventDateTime > '20220101')



ORDER BY Plot, SubPlot, EventDate, FoliarCover
