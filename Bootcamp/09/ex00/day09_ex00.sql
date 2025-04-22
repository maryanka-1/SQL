CREATE TABLE person_audit (
    created timestamp with time zone DEFAULT current_timestamp NOT NULL,
    type_event char(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

-- Создание триггерной функции 
CREATE FUNCTION fnc_trg_person_insert_audit() 
RETURNS trigger AS 
$$
BEGIN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
RETURN NEW;
END;
$$
LANGUAGE  plpgsql;


-- Создание триггера
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

select *
From person_audit;
-- delete from person
-- where name = 'Damir';