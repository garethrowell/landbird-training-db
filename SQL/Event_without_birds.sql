



USE HTLN_LandBirds



SELECT P.LocationName AS Plot, Left(E.EventName,4) + Right(E.EventName,15) AS Event, E.Temperature_C,  W.Code AS Wind, R.Code AS Precip, E.Clouds_pct AS Percent_Cloud, N.Code AS Noise
FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.Noise AS N
    ON E.NoiseID = N.ID
  JOIN LU.Rain AS R
    ON E.RainID = R.ID
  JOIN LU.Wind AS W
	ON E.WindID = W.ID

ORDER BY P.LocationName;