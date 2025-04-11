


USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, 
Left(E.EventDateTime,11) AS EventDate, X.Name AS Distance, D.Name AS Height, C.Code AS CoverClass 

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID

  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID

  JOIN dbo.HorizontalVegetationProfile AS H
  ON S.ID = H.SubplotID

  JOIN LU.DensityBoardHeightClass AS D
  ON D.ID = H.DensityBoardHeightClassID

  JOIN LU.DensityBoardCoverClass AS C
  ON C.ID = H.DensityBoardCoverClassID

  JOIN LU.DensityBoardDistanceClass AS X
  ON X.ID = H.DensityBoardDistanceClassID

WHERE (E.EventDateTime > '20210101') AND 
     ((L.LocationName = 'PERI11') OR (L.LocationName = 'PERI20') OR (L.LocationName = 'PERI3')
    OR (L.LocationName = 'PERI39') OR (L.LocationName = 'PERI48') OR (L.LocationName = 'PERI57')
    OR (L.LocationName = 'PERI66') OR (L.LocationName = 'PERI75')OR (L.LocationName = ' PERI84')
    OR (L.LocationName = ' PERI93'))
    
ORDER BY L.LocationName,  E.EventDateTime;
