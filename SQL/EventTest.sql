


USE HTLN_LandBirds;




SELECT E.EventName, Left(E.EventName,4) + Right(E.EventName,15), SUBSTRING(E.EventName,11,4)
FROM dbo.BirdSamplingEvent AS E

