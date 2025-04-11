USE HTLN_LandBirds;




SELECT DISTINCT P.LocationName AS Plot

FROM dbo.BirdSamplingEvent AS E
  JOIN dbo.BirdObservation as B
    ON E.ID = B.BirdSamplingEventID
  JOIN dbo.Plot AS P
    ON E.PlotID = P.ID
WHERE (E.EventDateTime > CAST('20170101' AS datetime)) AND P.LocationName LIKE N'EFMO%'
ORDER BY P.LocationName
