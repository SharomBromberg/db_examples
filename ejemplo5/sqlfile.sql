create table T1(A int);
create table T2(A float);


insert into T1 values (1);
insert into T1 values (1);
insert into T1 values (1);
insert into T1 values (1);

create trigger R1
after insert on T1
for each row
begin
  insert into T2 select avg(A) from T1;
end;

insert into T1 select A+1 from T1;
-- select * from T1;
-- select * from T2;

-- /**************************************************************
--   CLEANUP
-- **************************************************************/

-- delete from T1;
-- delete from T2;
-- delete from T3;
-- delete from T4;

-- drop table T1;
-- drop table T2;
-- drop table T3;
-- drop table T4;
