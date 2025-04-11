



USE HTLN_LandBirds



SELECT P.LocationName AS Plot, Left(E.EventName,4) + Right(E.EventName,15) AS Event
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