CREATE OR REPLACE PROCEDURE add_engineer(
    p_engineer_id IN NUMBER,
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_specialty IN VARCHAR2,
    p_project_id IN NUMBER,
    p_hire_date IN DATE
)
IS
BEGIN
    FOR i IN 1..3 LOOP
        BEGIN
            INSERT INTO Engineers (engineer_id, first_name, last_name, specialty, project_id, hire_date)
            VALUES (p_engineer_id + i, p_first_name || i, p_last_name || i, p_specialty, p_project_id, p_hire_date);
            EXIT; -- Exit loop if insert is successful
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error adding engineer ' || i || ': ' || SQLERRM);
                -- Retry logic or other handling can go here
        END;
    END LOOP;
END;
/
