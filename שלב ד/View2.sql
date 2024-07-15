-- Create view for new wing perspective
CREATE VIEW NewWingView AS
SELECT 
    p.project_id, 
    p.project_name, 
    p.start_date, 
    p.end_date, 
    e.engineer_id, 
    e.first_name AS engineer_first_name, 
    e.last_name AS engineer_last_name, 
    m.manager_id, 
    m.first_name AS manager_first_name, 
    m.last_name AS manager_last_name
FROM 
    PROJECTS p
JOIN 
    ENGINEERS e ON p.project_id = e.project_id
JOIN 
    MANAGERS m ON p.project_id = m.project_id;

-- Query 1: Retrieve all engineers working on a specific project
SELECT * FROM NewWingView WHERE project_id = 1;

-- Query 2: Retrieve all projects overseen by a specific manager
SELECT DISTINCT project_id, project_name, start_date, end_date 
FROM NewWingView 
WHERE manager_id = 1;

-- Query 3: Retrieve all managers and their respective projects
SELECT DISTINCT manager_id, manager_first_name, manager_last_name, project_id, project_name
FROM NewWingView;

-- Query 4: Retrieve all engineers in a specific specialty
SELECT * FROM NewWingView WHERE specialty = 'Aerospace';
