
USE HTLN_LandBirds

SELECT L.LocationName AS Plot, P.Code AS ParkUnit, P.Name AS ParkName 
FROM dbo.Plot As L
JOIN LU.ParkUnit AS P
ON L.ParkUnitID = P.ID
ORDER BY L.LocationName;