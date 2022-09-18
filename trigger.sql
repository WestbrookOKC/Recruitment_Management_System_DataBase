
IF OBJECT_ID('Job_INSERT_UPDATE') IS NOT NULL
DROP TRIGGER Job_INSERT_UPDATE;
GO
CREATE TRIGGER Job_INSERT_UPDATE
ON Job
AFTER INSERT
AS
BEGIN
	DECLARE @OPENINGJOBID VARCHAR(50)
	DECLARE @NUMBEROFPOSITION VARCHAR(50)
	DECLARE @JOBID VARCHAR(50)
	SELECT @OPENINGJOBID = JOBID FROM inserted
	SELECT @NUMBEROFPOSITION = NumbersOfPositions FROM inserted
	SELECT @JOBID = JOBID FROM inserted
	INSERT INTO OpeningJob(OpeningJobID,NumbersOfPositions,JobID)VALUES
	(@OPENINGJOBID,@NUMBEROFPOSITION,@JOBID)
END

IF OBJECT_ID('Onboarding_UPDATE') IS NOT NULL
DROP TRIGGER Onboarding_UPDATE;
GO
CREATE TRIGGER Onboarding_UPDATE
ON Onboarding
AFTER UPDATE
AS
UPDATE OnboardingBackgroundCheck
SET CandidateID = (SELECT Inserted.CandidateID FROM Inserted)

CREATE TRIGGER Database_CreateTable_DropTable
ON DATABASE
AFTER CREATE_TABLE, DROP_TABLE
AS
DECLARE @EventData xml;
SELECT @EventData = EVENTDATA();
DECLARE @EventType varchar(100);
SET @EventType =
@EventData.value('(/EVENT_INSTANCE/EventType)[1]',
'varchar(100)');
IF @EventType = 'CREATE_TABLE'
PRINT 'A new table has been created.';
ELSE
PRINT 'A table has been dropped.';
PRINT CONVERT(varchar(max), @EventData);

CREATE TRIGGER Invoices_UPDATE
ON Reimbursement
AFTER UPDATE
AS
IF EXISTS 
(SELECT *
FROM Deleted JOIN Reimbursement
ON Deleted.ReimbursementID = Reimbursement.ReimbursementID
WHERE Deleted.Amount <> Reimbursement.Amount)
BEGIN
PRINT('DO NOT EXIST')
END


