USE master
GO

IF DB_ID('Recruitment') IS NOT NULL
    DROP DATABASE Recruitment
GO

/****** Object:  Database Recruitment    ******/
CREATE DATABASE Recruitment
GO

DROP TABLE IF EXISTS Application;
CREATE TABLE Application(
    ApplicationID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    OpeningJobID VARCHAR(32) NOT NULL,
    DocumentID VARCHAR(32) NOT NULL,
    PRIMARY KEY (ApplicationID)
);



DROP TABLE IF EXISTS Document;
CREATE TABLE Document(
    DocumentID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    CVs VARCHAR(900),
    ReferenceLetters VARCHAR(900),
    CoverLetter VARCHAR(900),
    PRIMARY KEY (DocumentID)
);


DROP TABLE IF EXISTS Test;
CREATE TABLE Test(
    TestID VARCHAR(32) NOT NULL,
    ApplicationID VARCHAR(32) NOT NULL,
    Type VARCHAR(255),
    StartTime DATE,
    EndTimes DATE,
    Answers VARCHAR(255),
    Grade INTEGER,
    CandidateID VARCHAR(32),
    PRIMARY KEY (TestID)
);




DROP TABLE IF EXISTS Job;
CREATE TABLE Job(
    JobID VARCHAR(32) NOT NULL,
    Title VARCHAR(255),
    Type VARCHAR(255),
    Medium NUMERIC(24,6),
    NumbersOfPositions INTEGER,
    PRIMARY KEY (JobID)
);



DROP TABLE IF EXISTS OpeningJob;
CREATE TABLE OpeningJob(
    OpeningJobID VARCHAR(32) NOT NULL,
    NumbersOfPositions VARCHAR(255) NOT NULL,
    JobID VARCHAR(32) NOT NULL,
    PRIMARY KEY (OpeningJobID)
);


DROP TABLE IF EXISTS Evaluation;
CREATE TABLE Evaluation(
    EvaluationID VARCHAR(32) NOT NULL,
    ApplicationID VARCHAR(32) NOT NULL,
    EvaluationNotes VARCHAR(255),
    Result VARCHAR(255),
    CandidateID VARCHAR(32),
    PRIMARY KEY (EvaluationID)
);



DROP TABLE IF EXISTS Reimbursement;
CREATE TABLE Reimbursement(
    ReimbursementID VARCHAR(32) NOT NULL,
    Request NUMERIC(24,6),
    Processed NUMERIC(24,6),
    Amount NUMERIC(24,6),
    PRIMARY KEY (ReimbursementID)
);



DROP TABLE IF EXISTS Bulletin;
CREATE TABLE Bulletin(
    BulletinID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    JobID VARCHAR(255),
    StartDate DATE,
    PRIMARY KEY (BulletinID)
);



DROP TABLE IF EXISTS InterviewInformation;
CREATE TABLE InterviewInformation(
    InterviewInformationID VARCHAR(32) NOT NULL,
    RoomID VARCHAR(32),
    CandidateID VARCHAR(32) NOT NULL,
    EmployeeID VARCHAR(32) NOT NULL,
    ReimbursementID VARCHAR(32),
    ApplicationID VARCHAR(32),
    PRIMARY KEY (InterviewInformationID)
);



DROP TABLE IF EXISTS ContractInformation;
CREATE TABLE ContractInformation(
    ContractInformationID VARCHAR(32) NOT NULL,
    Position VARCHAR(255),
    Salary NUMERIC(24,6),
    Status VARCHAR(255),
    CandidateID VARCHAR(32),
    PRIMARY KEY (ContractInformationID)
);



DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
    EmployeeID VARCHAR(32) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    SSN VARCHAR(255),
    Gender VARCHAR(255),
    Phone VARCHAR(255),
    PRIMARY KEY (EmployeeID)
);



DROP TABLE IF EXISTS EmployeeAddress;
CREATE TABLE EmployeeAddress(
    EmployeeAddressID VARCHAR(32) NOT NULL,
    EmployeeID VARCHAR(32) NOT NULL,
    AddressDetails VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    ZipCode VARCHAR(255),
    PRIMARY KEY (EmployeeAddressID)
);



DROP TABLE IF EXISTS Candidate;
CREATE TABLE Candidate(
    CandidateID VARCHAR(32) NOT NULL,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    SSN VARCHAR(255),
    Gender VARCHAR(255),
    Phone VARCHAR(255),
    PRIMARY KEY (CandidateID)
);



DROP TABLE IF EXISTS CandidateAddress;
CREATE TABLE CandidateAddress(
    CandidateAddressID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    AddressDetails VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    ZipCode VARCHAR(255),
    PRIMARY KEY (CandidateAddressID)
);



DROP TABLE IF EXISTS Room;
CREATE TABLE Room(
    RoomID VARCHAR(32) NOT NULL,
    Type VARCHAR(255),
    Capacity VARCHAR(255),
    Status VARCHAR(255) NOT NULL,
    PRIMARY KEY (RoomID)
);



DROP TABLE IF EXISTS RoomSchedule;
CREATE TABLE RoomSchedule(
    ScheduleID VARCHAR(32) NOT NULL,
    RoomID VARCHAR(32) NOT NULL,
    StartTime DATE,
    EndTime DATE,
    PRIMARY KEY (ScheduleID)
);



DROP TABLE IF EXISTS BlackList;
CREATE TABLE BlackList(
    BlackListID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PRIMARY KEY (BlackListID)
);


DROP TABLE IF EXISTS ComplaintHandling;
CREATE TABLE ComplaintHandling(
    ComplainID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    Result VARCHAR(255),
    PRIMARY KEY (ComplainID)
);


DROP TABLE IF EXISTS CandidateResponse;
CREATE TABLE CandidateResponse(
    CandidateResponseID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    EmployeeID VARCHAR(32) NOT NULL,
    InterviewInformationID VARCHAR(32) NOT NULL,
    Response VARCHAR(255),
    PRIMARY KEY (CandidateResponseID)
);



DROP TABLE IF EXISTS OnboardingBackgroundCheck;
CREATE TABLE OnboardingBackgroundCheck(
    CheckID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(32) NOT NULL,
    Diploma VARCHAR(1) NOT NULL DEFAULT  0,
    Transcript VARCHAR(1) NOT NULL DEFAULT  0,
    Passport VARCHAR(1) NOT NULL DEFAULT  0,
    IDCard VARCHAR(1) NOT NULL DEFAULT  0,
    PRIMARY KEY (CheckID)
);


DROP TABLE IF EXISTS Onboarding;
CREATE TABLE Onboarding(
    OnboardingID VARCHAR(32) NOT NULL,
    CandidateID VARCHAR(255) NOT NULL,
    EmployeeID VARCHAR(255) NOT NULL,
    JobID VARCHAR(255),
    StartDate DATE,
    PRIMARY KEY (OnboardingID)
);


