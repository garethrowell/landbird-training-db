




USE HTLN_LandBirds;

SELECT L.LocationName AS Plot, Left(E.EventDateTime,11) AS EventDate,  T.NAME AS VegType, V.PlotVegetationCoverClassID AS CovClass

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.PlotVegetation AS V
  ON E.ID = V.VegetationSamplingEventID 
  JOIN LU.PlotVegetationType AS T
  ON T.ID = V.PlotVegetationTypeID

WHERE (E.EventDateTime > '20210101') AND 
     ((L.LocationName = 'PERI11') OR (L.LocationName = 'PERI20') OR (L.LocationName = 'PERI3')
    OR (L.LocationName = 'PERI39') OR (L.LocationName = 'PERI48') OR (L.LocationName = 'PERI57')
    OR (L.LocationName = 'PERI66') OR (L.LocationName = 'PERI75')OR (L.LocationName = ' PERI84')
    OR (L.LocationName = ' PERI93'))
    
ORDER BY L.LocationName,  E.EventDateTime;