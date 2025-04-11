









USE HTLN_LandBirds;


SELECT P.Name AS PeriodID, P.StartDate AS SamplingPeriodStartDate, E.EventDateTime AS VegetationSamplingEvent

FROM dbo.SamplingPeriod AS P

  JOIN dbo.VegetationSamplingEvent AS E
  ON P.ID = E.SamplingPeriodID


ORDER BY P.Name, P.StartDate,  E.EventDateTime;


