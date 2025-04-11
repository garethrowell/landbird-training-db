

USE HTLN_LandBirds



SELECT Left(Right(E.EventName,15),4)  AS ObsYear, P.LocationName, S.TaxonCode AS AOUCode, B.FlockSize

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID

WHERE LEFT(LocationName,4) LIKE 'TAPR'
ORDER BY ObsYear, LocationName, AOUCode



