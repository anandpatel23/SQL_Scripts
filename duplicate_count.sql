USE Registry
GO 

--- Duplicate Count within Drive ---
SELECT 
	DriveSource,
	DriveFileName,
	count(*) AS Count
FROM 
	Registry.R.DriveItem
GROUP BY
	DriveSource,
	DriveFileName
HAVING
	count(*) > 1

--- Filtering Drive for unwanted items ---
SELECT 
	DriveSource,
	DriveFileName,
	UPPER(Filepath) AS Filepath
FROM 
	Registry.R.DriveItem
WHERE
	Filepath LIKE '%\BIN\%' AND /* Look within BIN Folder */
	Filepath NOT LIKE '%TEST%' AND /* Do not include items within TEST */
	Filepath NOT LIKE '%PREVIOUS%' AND /* Do not include items with PREVIOUS in path */
	Filepath NOT LIKE '%20%' AND /* Do not include items like 2000, 2001,..., 2010, 2011, etc. */
	Filepath NOT LIKE '%0%' AND /* Dot include items like 07, 08, 09, etc. -> Assuming year */
	FilePath NOT LIKE '%OLD%'/* Do not include items that are OLD */