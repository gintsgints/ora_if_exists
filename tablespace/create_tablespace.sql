DECLARE
  v_exists number;
BEGIN
  select count(*) into v_exists
  from dba_tablespaces
  where tablespace_name = 'TABLESPACE_NAME';
  IF v_exists = 0 THEN
    EXECUTE IMMEDIATE 'CREATE TABLESPACE "TABLESPACE_NAME"';
  END IF;
END;
/