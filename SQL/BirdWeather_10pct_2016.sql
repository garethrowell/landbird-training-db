





USE HTLN_LandBirds;


SELECT B.ID as ID, P.LocationName AS Plot, CAST((CAST(SUBSTRING(P.LocationName,5,3) AS float)/10) AS int)*10  AS MyVal, CAST(SUBSTRING(P.LocationName,5,3) AS float) AS MyVal2,
    (CAST((CAST(SUBSTRING(P.LocationName,5,3) AS float)/10) AS int)*10) - (CAST(SUBSTRING(P.LocationName,5,3) AS float)) AS MyVal3,
    Left(E.EventName,4) + Right(E.EventName,15) AS Event, E.Temperature_C,  
    W.Code AS Wind, R.Code AS Precip, E.Clouds_pct AS Percent_Cloud, N.Code AS Noise, B.ObservationNumber, I.Name AS Interval, 
    S.TaxonCode AS AOUCode, B.Distance, D.Code AS DetectionType, X.Name AS Sex, 
	A.Name AS Age, B.FlockSize, B.IsPreviousPlot, B.IsFlyover, B.Comments

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.Noise AS N
    ON E.NoiseID = N.ID
  JOIN LU.Rain AS R
    ON E.RainID = R.ID
  JOIN LU.Wind AS W
	ON E.WindID = W.ID
  JOIN LU.Interval AS I
	ON B.IntervalID = I.ID
  JOIN LU.Sex AS X
    ON B.SexID = X.ID
  JOIN LU.DetectionType AS D
    ON B.DetectionTypeID = D.ID
  JOIN LU.Age AS A
    ON B.AgeID = A.ID

WHERE SUBSTRING(E.EventName,11,4) = 2016 AND (LEFT(P.LocationName,4) = 'ARPO'
  OR LEFT(P.LocationName,4) = 'EFMO' OR LEFT(P.LocationName,4) = 'GWCA' OR LEFT(P.LocationName,4) = 'HEHO' OR LEFT(P.LocationName,4) = 'HOME'
  OR LEFT(P.LocationName,4) = 'LIBO' OR LEFT(P.LocationName,4) = 'PERI' OR LEFT(P.LocationName,4) = 'PIPE' OR LEFT(P.LocationName,4) = 'TAPR'
  OR LEFT(P.LocationName,4) = 'WICR') 
ORDER BY P.LocationName, B.ObservationNumber;
