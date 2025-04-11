

USE HTLN_BreedingBird

SELECT SUBSTRING(E.EventID,11,4) AS Year, B.AOUCode, S.CommonName 
FROM dbo.BirdObservations AS B
JOIN dbo.SpeciesLU AS S
ON B.AOUCode = S.TaxonCode



SELECT SUBSTRING(L.LocationID,11,3) AS Plot, SUBSTRING(E.EventID,11,4) AS Year, B.AOUCode, S.CommonName
FROM dbo.Locations AS L
JOIN dbo.Weather as W
ON L.ID = W.L_ID
JOIN dbo.SamplingEvents as E
ON E.ID = W.E_ID
JOIN dbo.BirdObservations AS B
ON W.ID = B.TEC_ID
JOIN dbo.SpeciesLU AS S
ON B.AOUCode = S.TaxonCode
WHERE L.LocationID LIKE N'TAPR%';
