alter PROCEDURE [dbo].[sp_insert_project]
  @project_name NVARCHAR(255),
  @local_git_repo NVARCHAR(255),
  @jsonOutput NVARCHAR(MAX) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  INSERT INTO projects (project_name, local_git_repo)
  VALUES (@project_name, @local_git_repo);
  SET @jsonOutput = JSON_QUERY((
    SELECT * FROM projects WHERE id = SCOPE_IDENTITY()
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES    
    ));
  RETURN 0;
END

/**
unit test

declare @project_name NVARCHAR(255) = 'test project';
declare @local_git_repo NVARCHAR(255) = 'C:\test\project';
declare @jsonOutput NVARCHAR(255);

exec dbo.sp_insert_project @project_name, @local_git_repo, @jsonOutput OUTPUT;

SELECT @jsonOutput;

*/

