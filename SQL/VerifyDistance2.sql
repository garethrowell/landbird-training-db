



USE HTLN_LandBirds;


SELECT B.Distance, E.EventDateTime
FROM dbo.BirdObservation AS B
JOIN dbo.BirdSamplingEvent AS E
ON B.BirdSamplingEventID = E.ID
WHERE E.EventDateTime > '2015'
AND B.Distance = '0'
