-- Step B: Queries and constraints

-- Query 1: Retrieve project details along with the number of engineers working on each project
SELECT p.project_id, p.project_name, p.start_date, p.end_date, COUNT(e.engineer_id) AS num_engineers
FROM Projects p
LEFT JOIN Engineers e ON p.project_id = e.project_id
GROUP BY p.project_id, p.project_name, p.start_date, p.end_date;

-- Query 2: Retrieve safety officer details along with their department name
SELECT so.officer_id, so.first_name, so.last_name, so.certification, d.department_name, so.hire_date
FROM SafetyOfficers so
JOIN Departments d ON so.department_id = d.department_id;

-- Query 3: Retrieve project manager details along with their project and department names
SELECT pm.manager_id, pm.first_name, pm.last_name, p.project_name, d.department_name, pm.hire_date
FROM ProjectManagers pm
JOIN Projects p ON pm.project_id = p.project_id
JOIN Departments d ON pm.department_id = d.department_id;

-- Query 4: Retrieve office technician details along with their manager's name
SELECT ot.technician_id, ot.first_name, ot.last_name, pm.first_name AS manager_first_name, pm.last_name AS manager_last_name, ot.hire_date
FROM OfficeTechnicians ot
LEFT JOIN ProjectManagers pm ON ot.manager_id = pm.manager_id;


-- 2. 2 delete queries
-- Delete query 1: Remove engineers who have been hired before a certain date
DELETE FROM Engineers
WHERE hire_date < TO_DATE('2020-01-01', 'YYYY-MM-DD');


-- Delete query 2: Remove projects that have no engineers assigned
DELETE FROM Projects
WHERE project_id NOT IN (SELECT project_id FROM Engineers);

-- 3. 2 update queries
-- Update query 1: Update the specialty of engineers working on a specific project
UPDATE Engineers
SET specialty = 'Civil'
WHERE project_id = (SELECT project_id FROM Projects WHERE project_name = 'Namfix');

-- Update query 2: Update the hire date of safety officers in a specific department
UPDATE SafetyOfficers
SET hire_date = ADD_MONTHS(hire_date, 6)
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Safety Department');
