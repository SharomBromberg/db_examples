-- Crear tabla T1
CREATE TABLE T1 (
    A INTEGER
);

-- -- Crear tabla T2
-- CREATE TABLE T2 (
--     A INTEGER
-- );

-- -- Crear tabla T3
-- CREATE TABLE T3 (
--     A INTEGER
-- );

-- -- Crear tabla T4
-- CREATE TABLE T4 (
--     A INTEGER
-- );



-- we can toggle a variable in the SQLite session called recursive triggers.
-- If we turn recursive triggers on, then that checking is turned
-- off and triggers can be activated arbitrarily many times
-- during a trigger processing session.

pragma recursive_triggers = on;

create trigger R1 
after insert on T1 
for each row 
when (select count(*) from T1) < 10
begin
    INSERT INTO T1 VALUES(New.A+1);
end;


INSERT INTO T1 VALUES(1);

-- The first tuple in T-1, the
-- one, is the tuple that we inserted with our command.

-- The second tuple, the two was inserted automatically by the trigger.


-- para que me muestre la tabla del 1 al 10 que incluye esta condición when (select count(*) from T1) < 10
-- debo ejecutar todo al mismo tiempo  CREATE TABLE T1 ( A INTEGER); , pragma recursive_triggers = on;
--create trigger R1  after insert on T1  for each row  when (select count(*) from T1) < 10
-- begin INSERT INTO T1 VALUES(New.A+1); end;,  INSERT INTO T1 VALUES(1);

