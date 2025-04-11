


USE HTLN_LandBirds;


SELECT DISTINCT S.TaxonCode AS AOUCode, S.CommonName, S.ScientificName,
  S.Family

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID

WHERE (LEFT(P.LocationName,4) = 'TAPR')

ORDER BY S.TaxonCode