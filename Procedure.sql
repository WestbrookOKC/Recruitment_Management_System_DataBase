IF OBJECT_ID('spDeletePositionLeft') IS NOT NULL
DROP PROC spDeletePositionLeft;
GO
CREATE PROC spDeletePositionLeft
	@JobID Varchar(50)
AS
UPDATE OpeningJob
SET NumbersOfPositions = NumbersOfPositions - 1
WHERE OpeningJobID = @JobID

IF OBJECT_ID('spRejectOffer') IS NOT NULL
DROP PROC spRejectOffer;
GO
CREATE PROC spRejectOffer AS
UPDATE OpeningJob
SET NumbersOfPositions = NumbersOfPositions + 1
WHERE OpeningJobID = (SELECT Position FROM ContractInformation WHERE Status = 'Rejected' )

IF OBJECT_ID('spAuditReimbursement') IS NOT NULL
DROP PROC spAuditReimbursement;
GO
CREATE PROC spAuditReimbursement
	@ReimbursementID INT,
	@Request MONEY = 0,
	@Processed MONEY= 0
AS
SET @Request = (SELECT Request FROM Reimbursement WHERE ReimbursementID = @ReimbursementID);
SET @Processed = (SELECT Processed FROM Reimbursement WHERE ReimbursementID = @ReimbursementID)

IF @Request < @Processed
	THROW 50001, 'Invalid Reimbursement', 1;


IF OBJECT_ID('spNewEmployeeSalaryRange') IS NOT NULL
DROP PROC spNewEmployeeSalaryRange;
GO
CREATE PROCEDURE spNewEmployeeSalaryRange
@EmployeeName VARCHAR(100)= NULL,
@SalaryMax MONEY = NULL,
@SalaryMin MONEY= NULL
AS
IF @EmployeeName IS NULL
SET @EmployeeName='%';
IF @SalaryMin IS NULL 
SELECT @SalaryMin=MIN(Salary) FROM ContractInformation
IF @SalaryMax IS NULL OR @SalaryMax=0
SELECT @SalaryMax=MAX(Salary) FROM ContractInformation

SELECT Salary,FirstName +' '+ LastName AS FullName
FROM ContractInformation JOIN Candidate 
ON ContractInformation.CandidateID = Candidate.CandidateID
WHERE Salary >=@SalaryMin  AND
Salary <=@SalaryMax AND
FirstName LIKE @EmployeeName 
ORDER BY Salary DESC;





