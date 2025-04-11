


USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, Left(E.EventDateTime,11) AS EventDate, H.Name AS Height, P.Name AS Vegetation, V.VerticalProfileCount AS Count 

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.VerticalVegetationProfile AS V
  ON S.ID = V.SubplotID
  JOIN LU.VegetationProfileClass AS P
  ON P.ID = V.VegetationProfileClassID
  JOIN LU.VegetationHeightClass AS H
  ON H.ID = V.VegetationHeightClassID

WHERE (E.EventDateTime > '20210101') AND 
     ((L.LocationName = 'PERI11') OR (L.LocationName = 'PERI20') OR (L.LocationName = 'PERI3')
    OR (L.LocationName = 'PERI39') OR (L.LocationName = 'PERI48') OR (L.LocationName = 'PERI57')
    OR (L.LocationName = 'PERI66') OR (L.LocationName = 'PERI75')OR (L.LocationName = ' PERI84')
    OR (L.LocationName = ' PERI93'))
    
ORDER BY L.LocationName,  E.EventDateTime;