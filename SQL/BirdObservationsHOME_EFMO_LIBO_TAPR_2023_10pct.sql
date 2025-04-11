

USE HTLN_LandBirds;


SELECT P.LocationName AS Plot,  E.EventName AS Event, E.Temperature_C,  
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

WHERE (P.LocationName = 'EFMO1' OR P.LocationName = 'EFMO20' OR P.LocationName = 'EFMO33' OR P.LocationName = 'EFMO44'  
    OR P.LocationName = 'EFMO6' OR P.LocationName = 'EFMO37' OR P.LocationName = 'LIBO8' 
    OR P.LocationName = 'PIPE40' OR P.LocationName = 'TAPR10' OR P.LocationName = 'TAPR109' OR P.LocationName = 'TAPR118' 
    OR P.LocationName = 'TAPR127' OR P.LocationName = 'TAPR135' OR P.LocationName = 'TAPR144' OR P.LocationName = 'TAPR153' 
    OR P.LocationName = 'TAPR162' OR P.LocationName = 'TAPR171' OR P.LocationName = 'TAPR180' OR P.LocationName = 'TAPR19' 
    OR P.LocationName = 'TAPR171' OR P.LocationName = 'TAPR199' OR P.LocationName = 'TAPR207' OR P.LocationName = 'TAPR216'
    OR P.LocationName = 'TAPR226' OR P.LocationName = 'TAPR236' OR P.LocationName = 'TAPR245' OR P.LocationName = 'TAPR254'
    OR P.LocationName = 'TAPR29' OR P.LocationName = 'TAPR38' OR P.LocationName = 'TAPR47' OR P.LocationName = 'TAPR56' 
    OR P.LocationName = 'TAPR66' OR P.LocationName = 'TAPR75' OR P.LocationName = 'TAPR84' OR P.LocationName = 'TAPR93'                
    ) AND
    (E.EventDateTime > '20230101')

ORDER BY P.LocationName, E.EventName, B.ObservationNumber
