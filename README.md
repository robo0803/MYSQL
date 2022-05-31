# MYSQL
show databases; // DB들의 리스트를 표시하라
use world; //WORLD DB를 사용한다
show tables; //      의 테이블리스트를 표시하라
desc city; //city테이블의 구조를 표시하라
select * from city; // city테이블의 내용을 표시하라

select 컬럼명 from 테이블명 where 조건절;
insert into 테이블명(컬럼명) values(값);
update 테이블명 set 컬럼명=값, ... where 조건절;
delete from 테이블명 where 조건절;
