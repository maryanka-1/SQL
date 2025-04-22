-- сессия 1. Все команды вводятся по очереди по одной в каждом из терминалов (согласно схеме)
begin;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
select sum(rating) from pizzeria;
-- во второй сессии выполняется запрос на обновление и коммит
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- сессия 2
begin;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
commit;
-- в первой сессии селект, коммит и снова селект
select sum(rating) from pizzeria;