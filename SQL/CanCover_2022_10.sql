


USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, Left(E.EventDateTime,11) AS EventDate, T.Name AS CanopyType, C.ReadingNumber, C.DotScore 

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.CanopyCover AS C
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

WHERE (E.EventDateTime > '20220101') 


    AND 
     ((L.LocationName = 'EFMO1') OR (L.LocationName = 'EFMO25') OR (L.LocationName = 'EFMO41') 
    OR (L.LocationName = 'HEHO29') OR (L.LocationName = 'HOME31') OR (L.LocationName = 'HOME40')
    OR (L.LocationName = 'PIPE28'))
    
ORDER BY L.LocationName,  E.EventDateTime;