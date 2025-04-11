




USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, E.EventDateTime, Left(E.EventDateTime,11) AS EventDate, H.Name AS Height, P.Name AS Vegetation, V.VerticalProfileCount AS Count 

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

WHERE (E.EventDateTime > CAST('20170101' AS datetime))
  AND 
     ((L.LocationName = 'EFMO1') OR (L.LocationName = 'EFMO14') OR (L.LocationName = 'EFMO44') OR (L.LocationName = 'EFMO8') OR 
     (L.LocationName = 'HEHO14') OR (L.LocationName = 'HEHO27') OR (L.LocationName = 'HEHO30') OR 
     (L.LocationName = 'HOME12') OR (L.LocationName = 'HOME26') OR (L.LocationName = 'HOME31') OR (L.LocationName = 'HOME35') OR (L.LocationName = 'HOME36') OR 
     (L.LocationName = 'HOME37') OR (L.LocationName = 'HOME5') OR (L.LocationName = 'HOME7') OR (L.LocationName = 'HOME26') OR 
	 (L.LocationName = 'HOME5') OR (L.LocationName = 'HOME5') OR (L.LocationName = 'HOME7') OR 
	 (L.LocationName = 'PIPE17') OR (L.LocationName = 'PIPE21') OR (L.LocationName = 'PIPE37') OR (L.LocationName = 'PIPE40') OR (L.LocationName = 'PIPE66'))

ORDER BY Plot, SubPlot, EventDate, Height, Vegetation