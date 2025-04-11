


USE HTLN_LandBirds;


SELECT DISTINCT P.LocationName AS Plot, E.EventName



FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN LU.BirdSpecies AS S
    ON B.BirdSpeciesID = S.ID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
  JOIN LU.ParkUnit AS U
    ON P.ParkUnitID = U.ID
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

-- WHERE ((E.EventDateTime < '20110101')  AND (E.EventDateTime > '20100101')) AND
     --((LEFT(P.LocationName,4) = 'HEHO') OR (LEFT(P.LocationName,4) = 'PIPE'))*/ 
    -- (LEFT(P.LocationName,4) = 'HEHO')

    WHERE (P.LocationName = 'HEHO30') OR (P.LocationName = 'HEHO35' )

ORDER BY  P.LocationName, E.EventName;
