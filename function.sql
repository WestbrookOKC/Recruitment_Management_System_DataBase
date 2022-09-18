IF OBJECT_ID('fnLatestOnboardingCandidate') IS NOT NULL
DROP FUNCTION fnLatestOnboardingCandidate;
GO
CREATE FUNCTION fnLatestOnboardingCandidate()
RETURNS INT
BEGIN
RETURN (SELECT TOP 1 CandidateID 
FROM Onboarding
ORDER BY StartDate DESC)
END

IF OBJECT_ID('fnComplainSuccessful') IS NOT NULL
DROP FUNCTION fnComplainSuccessful;
GO
CREATE FUNCTION fnComplainSuccessful()
RETURNS INT
BEGIN
RETURN (SELECT CandidateID
FROM ComplaintHandling
WHERE Result='Successful')
END

IF OBJECT_ID('fnCandidateInformation') IS NOT NULL
DROP FUNCTION fnCandidateInformation;
GO
CREATE FUNCTION fnCandidateInformation()
RETURNS TABLE
RETURN
(SELECT Candidate.CandidateID,FirstName + ' ' + LastName AS FullName, SSN, Gender,Phone,AddressDetails,City,State,ZipCode,
EmployeeID,Response 
FROM Candidate JOIN CandidateAddress
ON Candidate.CandidateID = CandidateAddress.CandidateID
JOIN CandidateResponse ON CandidateAddress.CandidateID = CandidateResponse.CandidateID);

IF OBJECT_ID('fnCheckJobOpening') IS NOT NULL
DROP FUNCTION fnCheckJobOpening;
GO
CREATE FUNCTION fnCheckJobOpening()
RETURNS TABLE

RETURN (SELECT Job.JobID FROM job
JOIN OpeningJob ON Job.JobID = OpeningJob.JobID
WHERE OpeningJob.NumbersOfPositions > Job.NumbersOfPositions
GROUP BY Job.JobID)

