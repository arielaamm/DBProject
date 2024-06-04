--
-- Insert Data Script
-- Date: May 20 2024 21:30
-- Generated for inserting data into tables in the correct order considering foreign key constraints
--

-- Insert data into Projects
INSERT INTO Projects (project_id, project_name, start_date, end_date) VALUES 
    (1, 'Project A', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD')),
    (2, 'Project B', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'))
/
-- Insert data into Departments
INSERT INTO Departments (department_id, department_name) VALUES 
    (1, 'Engineering'),
    (2, 'Safety'),
    (3, 'Management')
/
-- Insert data into Engineers
INSERT INTO Engineers (engineer_id, first_name, last_name, specialty, project_id, hire_date, project_id1) VALUES 
    (1, 'John', 'Doe', 'Civil', 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL),
    (2, 'Jane', 'Smith', 'Electrical', 2, TO_DATE('2023-02-20', 'YYYY-MM-DD'), NULL)
/
-- Insert data into SafetyOfficers
INSERT INTO SafetyOfficers (officer_id, first_name, last_name, certification, department_id, hire_date, department_id1) VALUES 
    (1, 'Alice', 'Brown', 'Certified', 2, TO_DATE('2023-03-10', 'YYYY-MM-DD'), NULL),
    (2, 'Bob', 'White', 'Certified', 2, TO_DATE('2023-04-25', 'YYYY-MM-DD'), NULL)
/
-- Insert data into ProjectManagers
INSERT INTO ProjectManagers (manager_id, first_name, last_name, project_id, department_id, hire_date, department_id1, project_id1) VALUES 
    (1, 'Michael', 'Johnson', 1, 3, TO_DATE('2022-11-01', 'YYYY-MM-DD'), NULL, NULL),
    (2, 'Emma', 'Williams', 2, 3, TO_DATE('2022-12-15', 'YYYY-MM-DD'), NULL, NULL)
/
-- Insert data into OfficeTechnicians
INSERT INTO OfficeTechnicians (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id) VALUES 
    (1, 'Charlie', 'Green', 1, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 1),
    (2, 'Dave', 'Black', 2, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 2)
/

exit;
