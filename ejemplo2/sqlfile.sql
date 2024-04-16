-- Crear tabla T1
CREATE TABLE T1 (
    A INTEGER
);

-- Crear tabla T2
CREATE TABLE T2 (
    A INTEGER
);

-- Crear tabla T3
CREATE TABLE T3 (
    A INTEGER
);

-- -- Crear tabla T4
-- CREATE TABLE T4 (
--     A INTEGER
-- );

pragma recursive_triggers = on;

create trigger R1 
after insert on T1 
for each row 
begin
    INSERT INTO T2 VALUES(New.A+1);
end;

create trigger R2 
after insert on T2 
for each row 
begin
    INSERT INTO T3 VALUES(New.A+1);
end;
 
create trigger R3
after insert on T3
for each row
when (select count(*) from T1) < 100
begin
    INSERT INTO T1 VALUES(New.A+1);
end;

INSERT INTO T1 VALUES(1);

-- When the size reached 100, not exceeded 100