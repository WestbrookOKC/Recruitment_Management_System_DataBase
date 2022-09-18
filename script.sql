CREATE ROLE HumanResouresHiring;
GRANT INSERT,UPDATE ON Candidate TO HumanResouresHiring;
GRANT INSERT,UPDATE ON Application TO HumanResouresHiring;
GRANT INSERT,UPDATE ON InterviewInformation TO HumanResouresHiring;
GRANT INSERT,UPDATE ON ContractInformation TO HumanResouresHiring;
GRANT INSERT,UPDATE ON Onboarding TO HumanResouresHiring;
ALTER ROLE db_datareader ADD MEMBER HumanResouresHiring;

CREATE ROLE HumanResouresOrganizationDevelopment;
GRANT INSERT,UPDATE ON Job TO HumanResouresOrganizationDevelopment;
GRANT INSERT,UPDATE ON OpeningJob TO HumanResouresOrganizationDevelopment;
GRANT INSERT,UPDATE ON OnboardingBackgroundCheck TO HumanResouresOrganizationDevelopment;
GRANT INSERT,UPDATE ON Employees TO HumanResouresOrganizationDevelopment;
GRANT INSERT,UPDATE ON EmployeeAddress TO HumanResouresOrganizationDevelopment;
ALTER ROLE db_datareader ADD MEMBER HumanResouresOrganizationDevelopment;

CREATE LOGIN Fall2022 WITH PASSWORD ='12345678',DEFAULT_DATABASE=Recruitment;
CREATE USER DAMON FOR LOGIN Fall2022;
ALTER ROLE HumanResouresHiring ADD MEMBER DAMON;

GO
CREATE SCHEMA KAIQI;
GO
ALTER SCHEMA KAIQI TRANSFER dbo.Employees;
ALTER USER DAMON WITH DEFAULT_SCHEMA = KAIQI;
GRANT SELECT,UPDATE,INSERT,DELETE, EXECUTE ON SCHEMA :: KAIQI TO DAMON
