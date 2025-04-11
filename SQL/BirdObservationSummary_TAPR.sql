




USE HTLN_LandBirds;

SELECT U.Code AS ParkCode, S.TaxonCode AS AOUCode, S.CommonName, 
  S. ScientificName, S.Family, Sum(B.FlockSize) as N

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.ParkUnit AS U
    ON P.ParkUnitID = U.ID

WHERE 
     (LEFT(P.LocationName,4) = 'TAPR')

GROUP BY U.Code, S.TaxonCode, S.CommonName, S. ScientificName, S.Family

ORDER BY AOUCode

/*
 
ORDER BY P.LocationName,  E.EventName,  B.ObservationNumber;*/
