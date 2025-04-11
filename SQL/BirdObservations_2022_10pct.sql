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

WHERE (E.EventDateTime > '20220101') /*
    AND 
     ((P.LocationName = 'ARPO2') OR (P.LocationName = 'ARPO4') OR (P.LocationName = 'EFMO19') 
    OR (P.LocationName = 'EFMO30') OR (P.LocationName = 'EFMO49') OR (P.LocationName = 'HEHO13')
    OR (P.LocationName = 'HEHO38') OR (P.LocationName = 'HOCU15') OR (P.LocationName = 'HOCU24')
    OR (P.LocationName = 'HOCU9') OR (P.LocationName = 'HOME3') OR (P.LocationName = 'LIBO14')
    OR (P.LocationName = 'PERI11') OR (P.LocationName = 'PERI20') OR (P.LocationName = 'PERI3')
    OR (P.LocationName = 'PERI39') OR (P.LocationName = 'PERI48') OR (P.LocationName = 'PERI57')
    OR (P.LocationName = 'PERI66') OR (P.LocationName = 'PERI75')OR (P.LocationName = ' PERI84')
    OR (P.LocationName = ' PERI93')OR (P.LocationName = 'PIPE12') OR (P.LocationName = 'PIPE21')
    OR (P.LocationName = 'PIPE30') OR (P.LocationName = 'PIPE4') OR (P.LocationName = 'PIPE49')
    OR (P.LocationName = 'PIPE58')  OR (P.LocationName = 'PIPE67')  OR (P.LocationName = 'TAPR114')
    OR (P.LocationName = 'TAPR163') OR (P.LocationName = 'TAPR173') OR (P.LocationName = 'TAPR232')
    OR (P.LocationName = 'TAPR45') OR (P.LocationName = 'TAPR95') OR (P.LocationName = 'WICR18')
    OR (P.LocationName = 'WICR27') OR (P.LocationName = 'WICR36'))*/
ORDER BY P.LocationName,  E.EventName,  B.ObservationNumber;

