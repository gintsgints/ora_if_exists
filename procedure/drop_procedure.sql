DECLARE
  V_COUNT INTEGER;
  V_PROCEDURE VARCHAR(40);
  V_CURSOR_NAME INTEGER;
  V_RET INTEGER;
BEGIN
  V_PROCEDURE := 'SEND_EMAIL';
  SELECT COUNT(1) INTO V_COUNT FROM USER_OBJECTS WHERE OBJECT_NAME = V_PROCEDURE AND OBJECT_TYPE = 'PROCEDURE';
  IF V_COUNT = 1 THEN
    V_CURSOR_NAME := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(V_CURSOR_NAME, 'DROP PROCEDURE "' || V_PROCEDURE ||'"', DBMS_SQL.NATIVE);
    V_RET := DBMS_SQL.EXECUTE(V_CURSOR_NAME);
  END IF;
END;
