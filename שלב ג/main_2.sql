DECLARE
    v_engineers_count NUMBER;
BEGIN
    v_engineers_count := count_engineers_in_project(1);
    IF v_engineers_count >= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Number of engineers in project: ' || v_engineers_count);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Counting engineers failed.');
    END IF;
    
    update_project_end_date(1, SYSDATE + 30);
    DBMS_OUTPUT.PUT_LINE('Project end date updated.');
END;
/
