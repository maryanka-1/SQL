-- сессия 1. Все команды вводятся по очереди по одной в каждом из терминалов (согласно схеме)
SHOW TRANSACTION ISOLATION LEVEL;
begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- сессия 2
SHOW TRANSACTION ISOLATION LEVEL;
begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- после update будет ошибка
commit;
-- после коммита будет сообщение об откате
select * from pizzeria where name = 'Pizza Hut';