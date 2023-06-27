-- SQL View
select * from member0626;
select * from board0626;

-- View 积己
create or replace view member0626_view
as
select * from member0626;

-- View 炼雀
select * from member0626_view;

-- View 积己
create or replace view member0626_view_name
as
select name from member0626;
select * from member0626_view_name;

create or replace view member0626_view_2
as
select name,email from member0626;
select * from member0626_view_2;

create or replace view member0626_view_3(name2,email2)
as
select name,email from member0626;
select * from member0626_view_3;
-- View 昏力
drop view member0626_view;

drop view if EXIT member0626_view_2;
drop view member0626_view_2;




-- index 积己
create index name_idx on member0626(name);

-- index  昏力
drop index name_idx;
