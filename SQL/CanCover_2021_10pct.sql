



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
  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.TreeTally AS C
  ON S.ID = C.SubplotID
  JOIN LU.DBHClass AS D
  ON C.DBHClassID = D.ID
  JOIN LU.TreeSpecies AS T
  ON C.TreeSpeciesID = T.ID

  */

WHERE (E.EventDateTime > '20210101') AND 
     ((L.LocationName = 'PERI11') OR (L.LocationName = 'PERI20') OR (L.LocationName = 'PERI3')
    OR (L.LocationName = 'PERI39') OR (L.LocationName = 'PERI48') OR (L.LocationName = 'PERI57')
    OR (L.LocationName = 'PERI66') OR (L.LocationName = 'PERI75')OR (L.LocationName = ' PERI84')
    OR (L.LocationName = ' PERI93'))
    
ORDER BY L.LocationName,  E.EventDateTime;