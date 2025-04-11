
USE HTLN_Landbirds;



SELECT Left(P.StartDate,4) AS Year, L.LocationName 

FROM dbo.BirdObservation AS B
JOIN dbo.BirdSamplingEvent AS E
ON B.BirdSamplingEventID = E.ID

JOIN dbo.SamplingPeriod AS P
ON E.SamplingPeriodID = P.ID
JOIN dbo.Plot AS L
ON E.PlotID = L.ID
WHERE B.Distance = 0
ORDER BY P.StartDate



