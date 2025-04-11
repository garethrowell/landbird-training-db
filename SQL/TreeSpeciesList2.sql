

USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,   LEFT(L.LocationName, 4) AS Park,Left(E.EventDateTime,11) AS EventDate,
      T.ScientificName, T.CommonName

FROM dbo.Plot AS L 

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

WHERE ((LEFT(L.LocationName,4) = 'EFMO') OR (LEFT(L.LocationName,4) = 'HEHO')
      OR (LEFT(L.LocationName,4) = 'HOME') OR (LEFT(L.LocationName,4) = 'PIPE'))

ORDER BY Plot, EventDate, ScientificName