



USE HTLN_LandBirds;

SELECT L.LocationName AS Plot,  S.SubPlotNumber AS SubPlot, 
Left(E.EventDateTime,11) AS EventDate,T.TaxonCode, T.ScientificName,  
D.Name AS DBHClass, C.TreeCount

FROM dbo.Plot AS L 

  JOIN dbo.VegetationSamplingEvent AS E
  ON L.ID = E.PlotID
  JOIN dbo.SubPlot AS S
  ON E.ID = S.VegetationSamplingEventID
  JOIN dbo.TreeTally AS C
  ON S.ID = C.SubplotID
  JOIN LU.DBHClass AS D
  ON C.DBHClassID = D.ID
  JOIN LU.TreeSpecies AS T
  ON C.TreeSpeciesID = T.ID

  /*

WHERE (E.EventDateTime > CAST('20160101' AS datetime)) AND 
     ((LEFT(L.LocationName,4) = 'PERI') OR 
     (LEFT(L.LocationName,4) = 'GWCA') OR 
	 (LEFT(L.LocationName,4) = 'WICR'))

*/ 
WHERE (E.EventDateTime > CAST('20210101' AS datetime))

ORDER BY Plot, SubPlot, EventDate, T.TaxonCode, D.Code
