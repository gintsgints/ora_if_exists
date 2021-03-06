﻿DECLARE
  V_COUNT INTEGER;
  V_TABLE VARCHAR(40);
  V_CURSOR_NAME INTEGER;
  V_RET INTEGER;
BEGIN
  V_TABLE := 'posts';
  SELECT COUNT(1) INTO V_COUNT FROM USER_TABLES WHERE TABLE_NAME = V_TABLE;
  IF V_COUNT = 1 THEN
    V_CURSOR_NAME := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(V_CURSOR_NAME, 'DROP TABLE "' || V_TABLE ||'"', DBMS_SQL.NATIVE);
    V_RET := DBMS_SQL.EXECUTE(V_CURSOR_NAME);
  END IF;
END;
