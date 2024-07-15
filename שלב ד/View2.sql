CREATE VIEW projects_view AS
SELECT project_id, project_name, start_date, end_date
FROM PROJECTS;

CREATE VIEW engineers_view AS
SELECT engineer_id, first_name, last_name, specialty, project_id, hire_date
FROM ENGINEERS;

-- Query 1: הצגת פרויקטים שיש בהם מהנדסים עם התמחות בהנדסת תוכנה
SELECT p.project_id, p.project_name, e.engineer_id, e.first_name, e.last_name
FROM projects_view p
JOIN engineers_view e ON p.project_id = e.project_id
WHERE e.specialty = 'Software Engineering';
