
IF OBJECT_ID('Candidate_V') IS NOT NULL
    DROP VIEW Candidate_V
GO
CREATE VIEW Candidate_V AS
SELECT Candidate.CandidateID,FirstName,LastName,APPLICATION.ApplicationID,OpeningJobID,Result
FROM Candidate
JOIN Application ON Candidate.CandidateID = Application.CandidateID
JOIN Evaluation ON Evaluation.ApplicationID = Application.ApplicationID

IF OBJECT_ID('InterviewManagement_V') IS NOT NULL
    DROP VIEW InterviewManagement_V
GO
CREATE VIEW InterviewManagement_V AS 
SELECT Candidate.CandidateID,FirstName,LastName,Gender,EmployeeID
FROM Onboarding JOIN Candidate
ON Onboarding.CandidateID = Candidate.CandidateID

IF OBJECT_ID('UbuntuJobLeft_V') IS NOT NULL
    DROP VIEW UbuntuJobLeft_V
GO
CREATE VIEW UbuntuJobLeft_V AS
SELECT Job.JobID, Title,Type AS Apartment,Medium AS MediumSalary,OpeningJob.NumbersOfPositions AS NumberOfPositionsLeft 
FROM Job JOIN OpeningJob
ON Job.JobID = OpeningJobID

IF OBJECT_ID('InterviewRoom_V') IS NOT NULL
    DROP VIEW InterviewRoom_V
GO
CREATE VIEW InterviewRoom_V AS
SELECT InterviewInformationID,InterviewInformation.RoomID,CandidateID,EmployeeID,StartTime,EndTime
FROM InterviewInformation JOIN RoomSchedule
ON InterviewInformation.RoomID = RoomSchedule.RoomID













