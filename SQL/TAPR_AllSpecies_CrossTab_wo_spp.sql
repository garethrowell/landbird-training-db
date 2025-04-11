


USE HTLN_LandBirds


SELECT  LEFT(RIGHT(E.EventName,15),4), B.BirdSpeciesID
FROM dbo.BirdSamplingEvent AS E
  CROSS JOIN dbo.BirdObservation as B

WHERE LEFT(E.EventName,4) = 'TAPR'



