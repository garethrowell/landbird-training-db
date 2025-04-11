




USE HTLN_LandBirds;




SELECT DISTINCT L.LocationName AS Plot, Left(D.EventDateTime,11) AS EventDate,
   S.ScientificName, S.CommonName 
FROM LU.ParkUnit AS P
  JOIN dbo.Plot AS L
  ON P.ID = L.ParkUnitID
  JOIN dbo.VegetationSamplingEvent AS D
  ON L.ID = D.PlotID
  JOIN dbo.SubPlot AS U
  ON D.ID = U.VegetationSamplingEventID
  JOIN dbo.TreeTally AS T
  ON U.ID = T.SubplotID
  JOIN LU.TreeSpecies AS S
  ON S.ID = T.TreeSpeciesID
  JOIN LU.DBHClass AS H
  ON H.ID = T.DBHClassID
WHERE (P.Code = 'PERI')
ORDER BY Plot, EventDate,  S.ScientificName




 






  /*ON L.ID = U.PlotID
  JOIN dbo.TreeTally AS T
  ON U.ID = T.SubplotID
  JOIN LU.TreeSpecies AS S
  ON S.ID = T.TreeSpeciesID*/
