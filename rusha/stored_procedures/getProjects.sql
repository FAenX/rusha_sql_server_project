CREATE PROCEDURE [dbo].[getProjects]
  @param1 int = 0,
  @param2 int = 0,
  @jsonOutput NVARCHAR(MAX) OUTPUT
AS
  SELECT @param1, @param2
  SET @jsonOutput = '[]'
RETURN 0
