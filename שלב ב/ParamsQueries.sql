-- Query 1: Search for Projects by Name
-- This query allows the user to search for projects based on a partial name match.
-- Options Used: name, hint, type, required.
-- Usage: Enter a part of the project's name when prompted.
SELECT *
FROM Projects
WHERE project_name LIKE '%' || &<name="project_name" hint="Enter the project's name" type="string" required="true"> || '%'
/
-- End of Query 1


-- Query 2: Engineers Hired After a Certain Date
-- This query retrieves engineers that were hired after a specified date.
-- Options Used: name, hint, type, required.
-- Usage: Enter the hire date in DD/MM/YYYY format when prompted.
SELECT e.*
FROM Engineers e
WHERE hire_date > TO_DATE('&<name="hire_date" hint="Enter the hire date in DD/MM/YYYY format">' , 'DD/MM/YYYY')
/
-- End of Query 2

-- Query 3: Filter Project Managers by Department with Default Value
-- This query retrieves project managers based on their department, with a default value of '1'.
-- Options Used: name, hint, type, default.
-- Usage: Enter the department ID or leave it blank to use the default value.
SELECT pm.*
FROM ProjectManagers pm
WHERE pm.department_id = &<name="department_id" hint="Enter the department ID" default="1">
ORDER BY hire_date;
/
-- End of Query 3


-- Query 4: Sorting Departments by Name with Checkbox for Descending Order
-- This query retrieves departments sorted by their name, with an option to sort in descending order.
-- Options Used: name, checkbox.
-- Usage: Check the box if you want the sort order to be descending.

SELECT *
FROM Departments d
ORDER BY d.department_name &<name="Descending_sort_order" checkbox="DESC, ASC" hint="Check for descending sort order">
/
-- End of Query 4


-- Query 5: Filter Engineers by Multiple Specialties
-- This query allows filtering engineers based on multiple specialties.
-- Options Used: name, list.
-- Usage: Select one specialty from the provided list.
SELECT *
FROM Engineers
WHERE specialty IN (&<name="specialty_list" list="SELECT DISTINCT specialty FROM Engineers ORDER BY specialty">)
/
-- End of Query 5
