CREATE OR REPLACE FUNCTION calc_project_duration(p_project_id IN NUMBER)
RETURN NUMBER
IS
    v_start_date DATE;
    v_end_date DATE;
    v_duration NUMBER;
BEGIN
    BEGIN
        SELECT start_date, end_date INTO v_start_date, v_end_date 
        FROM Projects
        WHERE project_id = p_project_id;
        
        v_duration := v_end_date - v_start_date;
        RETURN v_duration;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN -1; -- Project not found
        WHEN OTHERS THEN
            RETURN -2; -- Other errors
    END;
END;
/
