



USE HTLN_LandBirds;

SELECT L.LocationName AS LocationID, P.Name AS PeriodID, S.SubPlotNumber
FROM dbo.SamplingPeriod AS P

  JOIN dbo.VegetationSamplingEvent AS E
  ON P.ID = E.SamplingPeriodID
  JOIN dbo.Plot AS L
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON  E.ID = S.VegetationSamplingEventID

  WHERE S.SubPlotNumber = 0


