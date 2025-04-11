



USE HTLN_LandBirds;




SELECT DISTINCT LEFT(P.LocationName,4) AS Park

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
WHERE SUBSTRING(E.EventName,11,4) = 2016
ORDER BY LEFT(P.LocationName,4)
