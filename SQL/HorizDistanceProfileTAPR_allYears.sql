


USE HTLN_LandBirds;

SELECT Right(Left(E.EventDateTime,11),4) AS Year, L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, 
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

WHERE (LEFT(L.LocationName,4) = 'TAPR')

ORDER BY Right(Left(E.EventDateTime,11),4), Plot, SubPlot, EventDate, Height


