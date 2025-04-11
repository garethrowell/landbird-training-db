




USE HTLN_LandBirds



SELECT P.Code, S.Name AS SamplingPeriodID, StartDate, Enddate,  R.Version AS ProtocolVersion
FROM dbo.SamplingPeriod AS S
  JOIN dbo.Protocol AS R
    ON S.ProtocolID = R.ID
  JOIN LU.ParkUnit AS P
    ON S.ParkUnitID = P.ID

ORDER BY StartDate, S.Name;