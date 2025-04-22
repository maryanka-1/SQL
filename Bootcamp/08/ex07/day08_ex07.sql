-- сессия 1. Ввод команд в каждой сессии согласно рисунка
begin;
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 2 WHERE name = 'Papa Johns';
commit;

-- сессия 2. Ввод команд в каждой сессии согласно рисунка
begin;
UPDATE pizzeria SET rating = 4.5 WHERE name = 'Papa Johns';
UPDATE pizzeria SET rating = 4.8 WHERE name = 'Pizza Hut';
ERROR:  deadlock detected
DETAIL:  Process 31569 waits for ShareLock on transaction 768; blocked by process 31633.
Process 31633 waits for ShareLock on transaction 769; blocked by process 31569.
HINT:  See server log for query details.
CONTEXT:  while updating tuple (0,7) in relation "pizzeria"
commit;
ROLLBACK
