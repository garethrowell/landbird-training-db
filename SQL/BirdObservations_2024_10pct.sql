

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

WHERE (P.LocationName = 'ARPO1' OR P.LocationName = 'ARPO2' OR P.LocationName = 'ARPO3' OR P.LocationName = 'EFMO1'  
    OR P.LocationName = 'EFMO2' OR P.LocationName = 'EFMO3' OR P.LocationName = 'EFMO5' 
    OR P.LocationName = 'GWCA11' OR P.LocationName = 'GWCA43' OR P.LocationName = 'GWCA70' OR P.LocationName = 'HEHO18' 
    OR P.LocationName = 'HEHO27' OR P.LocationName = 'HEHO8' OR P.LocationName = 'HOCU17' OR P.LocationName = 'HOCU26' 
    OR P.LocationName = 'HOME13' OR P.LocationName = 'LIBO13' OR P.LocationName = 'LIBO26' OR P.LocationName = 'LIBO35' 
    OR P.LocationName = 'LIBO7' OR P.LocationName = 'PIPE3' OR P.LocationName = 'TAPR10' OR P.LocationName = 'TAPR148'
    OR P.LocationName = 'TAPR167' OR P.LocationName = 'TAPR178' OR P.LocationName = 'TAPR253' OR P.LocationName = 'TAPR67'
    OR P.LocationName = 'WICR11' OR P.LocationName = 'WICR21' OR P.LocationName = 'WICR30' OR P.LocationName = 'WICR5'               
    ) AND
    (E.EventDateTime > '20240101')

ORDER BY P.LocationName, E.EventName, B.ObservationNumber
