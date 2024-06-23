CREATE OR REPLACE FUNCTION count_engineers_in_project(p_project_id IN NUMBER)
RETURN NUMBER
IS
    TYPE ref_cursor IS REF CURSOR;
    c_ref ref_cursor;
    v_count NUMBER := 0;
    rec Engineers%ROWTYPE;
BEGIN
    OPEN c_ref FOR SELECT * FROM Engineers WHERE project_id = p_project_id;
    LOOP
        FETCH c_ref INTO rec;
        EXIT WHEN c_ref%NOTFOUND;
        v_count := v_count + 1;
    END LOOP;
    CLOSE c_ref;
    RETURN v_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; -- No engineers found
    WHEN OTHERS THEN
        RETURN -1; -- Other errors
END;
/
