CREATE OR REPLACE PROCEDURE update_project_end_date(
    p_project_id IN NUMBER,
    p_end_date IN DATE
)
IS
    CURSOR project_cursor IS
        SELECT project_id FROM Projects WHERE project_id = p_project_id;
    project_rec project_cursor%ROWTYPE;
BEGIN
    OPEN project_cursor;
    FETCH project_cursor INTO project_rec;
    IF project_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Project not found.');
    ELSE
        UPDATE Projects
        SET end_date = p_end_date
        WHERE project_id = p_project_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No rows updated.');
        END IF;
    END IF;
    CLOSE project_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating project: ' || SQLERRM);
END;
/
