

INSERT Application (ApplicationID,CandidateID,OpeningJobID,DocumentID) VALUES
('1','1','1','1'),
('2','2','2','2'),
('3','3','3','3'),
('4','4','4','4'),
('5','5','5','5')
GO

INSERT Document (DocumentID,CandidateID,CVs,ReferenceLetters,CoverLetter) VALUES
('1','1','/Desktop/Document/CV_Paul','/Desktop/Document/ReferenceLetter_Paul','/Desktop/Document/CoverLetter_Paul'),
('2','2','/Desktop/Document/CV_Richel','/Desktop/Document/ReferenceLetter_Richel','/Desktop/Document/CoverLetter_Richel'),
('3','3','/Desktop/Document/CV_Kalus','/Desktop/Document/ReferenceLetter_Kalus','/Desktop/Document/CoverLetter_Kalus'),
('4','4','/Desktop/Document/CV_Damon','/Desktop/Document/ReferenceLetter_Damon','/Desktop/Document/CoverLetter_Damon'),
('5','5','/Desktop/Document/CV_Yogesh','/Desktop/Document/ReferenceLetter_Yogesh','/Desktop/Document/CoverLetter_Yogesh')
GO

INSERT Test (TestID,ApplicationID,Type,StartTime,EndTimes,Answers,Grade,CandidateID) VALUES
('1','1','T/F',CAST('2022-05-01 11:00:00' AS SmallDateTime),CAST('2022-05-02 12:00:00' AS SmallDateTime),'T','95','1'),
('2','2','T/F',CAST('2022-05-02 12:00:00' AS SmallDateTime),CAST('2022-05-03 13:00:00' AS SmallDateTime),'T','85','2'),
('3','3','T/F',CAST('2022-05-03 13:00:00' AS SmallDateTime),CAST('2022-05-04 14:00:00' AS SmallDateTime),'T','75','3'),
('4','4','T/F',CAST('2022-05-04 14:00:00' AS SmallDateTime),CAST('2022-05-05 15:00:00' AS SmallDateTime),'T','65','4'),
('5','5','T/F',CAST('2022-05-05 15:00:00' AS SmallDateTime),CAST('2022-05-06 16:00:00' AS SmallDateTime),'T','55','5')
GO


INSERT Job (JobID,Title,Type,Medium,NumbersOfPositions) VALUES
('1001','SoftwareEngineer','InformationTechnology',8000,10),
('1002','Accounting','Finance',3000,10),
('1003','SoftwareTestor','InformationTechnology',5000,10),
('1004','SoftwareArchitect','InformationTechnology',10000,10),
('1005','DataAnalyst','Finance',5000,10)
GO

INSERT OpeningJob (OpeningJobID,NumbersOfPositions,JobID) VALUES
('1001',5,'1001'),
('1002',3,'1002'),
('1003',2,'1003'),
('1004',6,'1004'),
('1005',8,'1005')
GO

INSERT Evaluation (EvaluationID,ApplicationID,EvaluationNotes,Result,CandidateID) VALUES
('1','1','He good at designing software','Pass','1'),
('2','2','He good at speaking','Pass','2'),
('3','3','She does not have enough experience','Fail','3'),
('4','4','She is not suitable for this job','Fail','4'),
('5','5','Just so so.','Pass','5')
GO


INSERT Reimbursement (ReimbursementID,Request,Processed,Amount) VALUES
('1',3000,3000,0),
('2',3000,2000,1000),
('3',5000,2000,3000),
('4',6000,3000,3000),
('5',2000,1000,1000)
GO

INSERT Bulletin(BulletinID,CandidateID,JobID,StartDate) VALUES
('1','1','1001','2022-05-05'),
('2','2','1002','2022-05-08'),
('5','5','1005','2022-05-20')
GO


INSERT InterviewInformation(InterviewInformationID,RoomID,CandidateID,EmployeeID,ReimbursementID,ApplicationID) VALUES
('1','R1','1','E1','1','1'),
('2','R2','2','E2','2','2'),
('3','R3','3','E3','3','3'),
('4','R4','4','E4','4','4'),
('5','R5','5','E5','5','5')
GO

INSERT ContractInformation(ContractInformationID,Position,Salary,Status,CandidateID) VALUES
('1','1001',5000,'Accept','1'),
('2','1002',3000,'Rejected','2'),
('5','1005',8000,'Waiting','5')
GO


INSERT Employees(EmployeeID,FirstName,LastName,SSN,Gender,Phone) VALUES
('E1','Yun','Ma','123','Male','315-222-5555'),
('E2','Adison','Jack','153','Male','615-222-5555'),
('E3','Westbrook','Russell','223','Male','665-222-5555'),
('E4','James','Lebron','523','Male','689-222-5555'),
('E5','Mu','Yan','823','Female','854-222-5555')
GO

INSERT EmployeeAddress(EmployeeAddressID,EmployeeID,AddressDetails,City,State,ZipCode) VALUES
('E1','E1','150 Henry Street','Syracuse','New York','13210'),
('E2','E2','350 Mashall Street','Syracuse','New York','13215'),
('E3','E3','550 Nico Street','Los Angeles','California','31780'),
('E4','E4','850 Malo Street','San Francisco','California','31785'),
('E5','E5','155 Mohan Street','Syracuse','New York','13210')
GO

INSERT Candidate(CandidateID,FirstName,LastName,SSN,Gender,Phone) VALUES
('1','Paul','Hope','111','Male','315-111-5555'),
('2','Richel','Zhang','222','Male','222-222-5555'),
('3','Kalus','Liang','333','Female','665-333-5555'),
('4','Damon','Zhang','444','Female','689-444-5555'),
('5','Yogesh','Shen','555','Male','854-555-5555')
GO

INSERT CandidateAddress(CandidateAddressID,CandidateID,AddressDetails,City,State,ZipCode) VALUES
('1','1','155 Law Street','Syracuse','New York','13213'),
('2','2','351 Joke Street','Syracuse','New York','13225'),
('3','3','321 Lakers Street','Los Angeles','California','31785'),
('4','4','470 Fish Street','San Francisco','California','31235'),
('5','5','255 Audi Street','Syracuse','New York','13210')
GO

INSERT Room(RoomID,Type,Capacity,Status) VALUES
('R1','Big','100','Free'),
('R2','Big','100','Free'),
('R3','Medium','50','Free'),
('R4','Medium','50','Free'),
('R5','Small','20','Free')
GO

INSERT RoomSchedule(ScheduleID,RoomID,StartTime,EndTime) VALUES
('1','1',CAST('2021-01-03 00:00:00' AS SmallDateTime),CAST('2021-01-03 01:00:00' AS SmallDateTime)),
('2','2',CAST('2021-01-03 01:00:00' AS SmallDateTime),CAST('2021-01-03 02:00:00' AS SmallDateTime)),
('3','3',CAST('2021-01-03 02:00:00' AS SmallDateTime),CAST('2021-01-03 03:00:00' AS SmallDateTime)),
('4','4',CAST('2021-01-03 03:00:00' AS SmallDateTime),CAST('2021-01-03 04:00:00' AS SmallDateTime)),
('5','5',CAST('2021-01-03 04:00:00' AS SmallDateTime),CAST('2021-01-03 05:00:00' AS SmallDateTime))
GO

INSERT BlackList(BlackListID,CandidateID,FirstName,LastName) VALUES
('1','1','Mo','XiaoJun')
GO

INSERT ComplaintHandling(ComplainID,CandidateID,Result) VALUES
('1','3','Failed'),
('2','4','Successful')
GO

INSERT CandidateResponse(CandidateResponseID,CandidateID,EmployeeID,InterviewInformationID,Response) VALUES
('1','1','E1','1','Good'),
('2','2','E2','2','He is too pushful'),
('3','3','E3','3','He is friendly'),
('4','4','E4','4','Good'),
('5','5','E5','5','She is experienced')
GO

INSERT OnboardingBackgroundCheck(CheckID,CandidateID,Diploma,Transcript,Passport,IDCard)VALUES
('1','1','1','1','1','0'),
('2','2','1','1','1','1'),
('3','5','0','1','1','0')
GO

INSERT Onboarding(OnboardingID,CandidateID,EmployeeID,JobID,StartDate) VALUES
('1','1','E6','1001','2022-08-01'),
('2','2','E7','1002','2022-08-01'),
('3','5','E8','1005','2022-08-01')
GO






















