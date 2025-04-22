-- Создание триггерной функции 
CREATE FUNCTION fnc_trg_person_delete_audit() 
RETURNS trigger AS 
$$
BEGIN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
RETURN NULL;
END;
$$
LANGUAGE  plpgsql;


-- Создание триггера
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

select *
From person_audit;