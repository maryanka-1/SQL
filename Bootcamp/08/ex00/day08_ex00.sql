-- сессия 1.
begin;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- сессия 2.
select * from pizzeria where name = 'Pizza Hut';
-- вторая команда после ввода commit; в первой сессии
select * from pizzeria where name = 'Pizza Hut';
