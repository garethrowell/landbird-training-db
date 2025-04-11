


USE HTLN_LandBirds;

SELECT L.LocationName AS Plot, Left(E.EventDateTime,11) AS EventDate,  T.NAME AS VegType, V.PlotVegetationCoverClassID AS CovClass

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.PlotVegetation AS V
  ON E.ID = V.VegetationSamplingEventID 
  JOIN LU.PlotVegetationType AS T
  ON T.ID = V.PlotVegetationTypeID

  
WHERE 
     ((LEFT(L.LocationName,4) = 'EFMO') OR 
     (LEFT(L.LocationName,4) = 'HEHO') OR 
	 (LEFT(L.LocationName,4) = 'HOME') OR 
	 (LEFT(L.LocationName,4) = 'PIPE'))


ORDER BY Plot, EventDate, VegType
