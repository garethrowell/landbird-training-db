



USE HTLN_LandBirds




SELECT  EventName, Left(Right(E.EventName,15),4) AS ObsYear, S.CommonName, COUNT( S.CommonName) AS Frequency


FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID

WHERE (LEFT(P.LocationName,4) = 'TAPR')
GROUP BY EventName, Left(Right(E.EventName,15),4), S.CommonName

ORDER BY Left(Right(E.EventName,15),4), COUNT( S.CommonName)

