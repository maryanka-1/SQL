-- сессия 1. Все команды вводятся по очереди согласно схемы
SHOW TRANSACTION ISOLATION LEVEL;
begin;
select * from pizzeria where name = 'Pizza Hut';
-- во второй сессии вносятся апдейты и коммит
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- сессия 2
SHOW TRANSACTION ISOLATION LEVEL;
begin;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
commit;
-- в первой сессии селект, коммит и снова селект
select * from pizzeria where name = 'Pizza Hut';