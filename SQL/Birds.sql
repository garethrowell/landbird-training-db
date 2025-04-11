USE HTLN_BreedingBird

SELECT SUBSTRING(L.LocationID,11,3) AS Plot, SUBSTRING(E.EventID,11,4) AS Year, W.Temp_C, W.Wind, W.Rain, B.AOUCode, B.Sex, B.Age, B.Flocksize
FROM dbo.Locations AS L
JOIN dbo.Weather as W
ON L.ID = W.L_ID
JOIN dbo.SamplingEvents as E
ON E.ID = W.E_ID
JOIN dbo.BirdObservations AS B
ON W.ID = B.TEC_ID
WHERE L.LocationID LIKE N'TAPR%';

