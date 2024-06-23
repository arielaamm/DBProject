DECLARE
    v_duration NUMBER;
BEGIN
    v_duration := calc_project_duration(1);
    IF v_duration > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Project duration: ' || v_duration || ' days');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Project duration calculation failed.');
    END IF;
    
    add_engineer(101, 'John', 'Doe', 'Software', 1, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Engineers added.');
END;
/
