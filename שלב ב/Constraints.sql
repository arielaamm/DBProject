-- Constraint: chk_project_dates on Projects table
-- Ensures that the end_date of a project is later than the start_date.
ALTER TABLE Projects
ADD CONSTRAINT chk_project_dates CHECK (end_date > start_date);

-- Constraint: chk_department_name_length on Departments table
-- Ensures that the length of the department_name is at least 3 characters.
ALTER TABLE Departments
ADD CONSTRAINT chk_department_name_length CHECK (LENGTH(department_name) >= 3);

-- Constraint: chk_engineer_specialty on Engineers table
-- Ensures that the specialty of an engineer is not an empty string.
ALTER TABLE Engineers
ADD CONSTRAINT chk_engineer_specialty CHECK (specialty IS NOT NULL AND specialty <> '');

-- Constraint: default_certification on SafetyOfficers table
-- Sets a default value of 'Basic' for the certification column.
ALTER TABLE SafetyOfficers
MODIFY (certification DEFAULT 'Basic');
