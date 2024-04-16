-- CREATE TABLE T1 (
--     A INTEGER
-- );


-- pragma recursive_triggers = on;

create trigger R2
after insert on T1
for each row
when exists (select * from T1 where A = 2)
begin
UPDATE T1 SET A=3;
end;


create trigger R1 
after insert on T1 
for each row 
begin
UPDATE T1 SET A = 2;
end;


INSERT INTO T1 VALUES(1);