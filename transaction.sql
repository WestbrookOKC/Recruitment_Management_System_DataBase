BEGIN TRAN
UPDATE Employees
SET EmployeeID = 'E6'
WHERE EmployeeID = 'E5'

UPDATE EmployeeAddress
SET EmployeeID = 'E6'
WHERE EmployeeID = 'E5'
COMMIT TRAN

BEGIN TRAN
UPDATE Candidate
SET CandidateID = '6'
WHERE CandidateID = '5'

UPDATE CandidateAddress
SET CandidateID = '6'
WHERE CandidateID = '5'
COMMIT TRAN

DECLARE @CandidateID Varchar(50);
DECLARE @RoomID Varchar(50);
DECLARE @EmployeesID Varchar(50);
DECLARE @InterviewID Varchar(50);
BEGIN TRY
BEGIN TRAN;
INSERT InterviewInformation
VALUES ('6','R3','8','E3','6','6');
SET @CandidateID = '8';
SET @RoomID = 'R3';
SET @EmployeesID = 'E3';
SET @InterviewID = @@IDENTITY;
INSERT RoomSchedule
VALUES ('6',@RoomID,'2022-05-08','2022-05-09');
INSERT CandidateResponse
VALUES ('6',@CandidateID,@EmployeesID,@InterviewID,'Good');
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN;
END CATCH; 

BEGIN TRAN;
DELETE InterviewInformation
WHERE CandidateID = '4';
IF @@ROWCOUNT > 1
BEGIN
ROLLBACK TRAN;
PRINT 'More Candidatess than expected. ' +
'Deletions rolled back.';
END;
ELSE
BEGIN
COMMIT TRAN;
PRINT 'Deletions committed to the database.';
END; 



