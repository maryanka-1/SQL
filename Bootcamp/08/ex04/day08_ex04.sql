-- сессия 1. Все команды вводятся по очереди по одной в каждом из терминалов (согласно схеме)
begin;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
select * from pizzeria where name = 'Pizza Hut';
-- во второй сессии выполняется запрос на обновление и коммит
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- сессия 2
begin;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
commit;
-- в первой сессии селект, коммит и снова селект
select * from pizzeria where name = 'Pizza Hut';