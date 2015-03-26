CREATE PROCEDURE getTable 
@TableName NVARCHAR(128)

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Query NVARCHAR(MAX);

	SET @Query = 'SELECT * FROM ConfigItemRegistry.' + @TableName
	EXECUTE @Query
END

/* exec getTable @tableName = 'CIRSTG.LinuxItem'
   exec getTable @tableName = 'CIR.BusinessApplication' */ 