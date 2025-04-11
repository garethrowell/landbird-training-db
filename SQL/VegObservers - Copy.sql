
USE HTLN_LandBirds;

SELECT L.LocationName AS Plot, Left(E.EventDateTime,11) AS EventDate, C.ContactName

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.VegetationObserver As O
  ON E.ID = O.VegetationSamplingEventID
  JOIN dbo.Contact AS C
  ON C.ID = O.ContactID

WHERE (E.EventDateTime > CAST('20160101' AS datetime)) AND 
     ((LEFT(L.LocationName,4) = 'PERI') OR 
     (LEFT(L.LocationName,4) = 'GWCA') OR 
	 (LEFT(L.LocationName,4) = 'WICR'))


ORDER BY Plot, EventDate, ContactName
