






USE HTLN_LandBirds;




SELECT K.Code, YEAR(E.EventDateTime) AS MyYear, I.Name AS Interval, COUNT(*) AS Freq
FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.Interval AS I
	ON B.IntervalID = I.ID
  JOIN LU.ParkUnit AS K
    ON P.ParkUnitID = K.ID

WHERE (LEFT(P.LocationName,4) = 'GWCA') OR (LEFT(P.LocationName,4) = 'PERI') OR (LEFT(P.LocationName,4) = 'WICR') 
GROUP BY K.Code, YEAR(E.EventDateTime), I.Name
ORDER BY K.Code, YEAR(E.EventDateTime), I.Name

 

