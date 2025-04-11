


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

WHERE (E.EventDateTime > '20220101') 
  AND 
     ((L.LocationName = 'EFMO1') OR (L.LocationName = 'EFMO26') OR (L.LocationName = 'EFMO41') 
    OR (L.LocationName = 'HEHO1') OR (L.LocationName = 'HEHO2') OR (L.LocationName = 'HEHO29')
    OR (L.LocationName = 'HEHO38') OR (L.LocationName = 'HOME12') OR (L.LocationName = 'HOME21')
    OR (L.LocationName = 'HOME30') OR (L.LocationName = 'HOME40') OR (L.LocationName = 'HOME9')
    OR (L.LocationName = 'PIPE18') OR (L.LocationName = 'PIPE27') OR (L.LocationName = 'PIPE36')
    OR (L.LocationName = 'PIPE45') OR (L.LocationName = 'PIPE55') OR (L.LocationName = 'PIPE64'))
    
ORDER BY L.LocationName,  E.EventDateTime;