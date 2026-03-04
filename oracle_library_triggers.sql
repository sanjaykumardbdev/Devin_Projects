CREATE TRIGGER before_insert_loan
BEFORE INSERT ON loan
FOR EACH ROW
BEGIN
    -- Trigger logic here
END;