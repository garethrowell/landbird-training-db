



USE HTLN_LandBirds;




SELECT DISTINCT P.Code AS Park, S.CommonName, S.ScientificName
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
WHERE (P.Code = 'EFMO') OR (P.Code = 'HEHO') OR 
  (P.Code = 'HOME') OR (P.Code = 'PIPE') 
ORDER BY Park, CommonName


