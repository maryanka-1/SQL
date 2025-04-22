-- сессия 1. Все команды вводятся по очереди по одной в каждом из терминалов
SHOW TRANSACTION ISOLATION LEVEL;
begin;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- сессия 2
begin;
select * from pizzeria where name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';