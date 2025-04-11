



USE HTLN_LandBirds;


SELECT B.Distance, E.EventDateTime
FROM dbo.BirdObservation AS B
JOIN dbo.BirdSamplingEvent AS E
ON B.BirdSamplingEventID = E.ID
WHERE B.Distance = '0'
