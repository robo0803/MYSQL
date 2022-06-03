#참조 무결성
insert into country(Name, Code) values ('ZZZ','ZZZ');
insert into city(Name, CountryCode) values ('YYY','ZZZ');
insert into city(Name,CountryCode) values ('MMM','TTT');
delete from country where Code='ZZZ'; # 참조하고 있는 상태라 삭제 불가능

# 스키마 생성, 수정, 삭제
drop database sampleDB;
create database sampleDB;
use sampleDB;
create table BusinessCard(Name varchar(255),Address varchar(255) , Telephone varchar(255));
desc BusinessCard;
insert into BusinessCard values ('Bob','Seoul','123-4567');
insert into BusinessCard values ('Sam','Busan','321-4567');
select * from BusinessCard;

alter table BusinessCard add column ID int; # id 추가
desc BusinessCard;
alter table BusinessCard change Address Adress1 varchar(255); # address -> address1
desc BusinessCard;
alter table BusinessCard modify Adress1 char(255);
desc BusinessCard;

alter table BusinessCard add primary key(ID); # null값이 들어가 있어서 기본키 지정 불가
SET SQL_SAFE_UPDATES = 0;
update BusinessCard set ID=1 where Name='Bob';
update BusinessCard set ID=2 where Name='Sam';
select * from BusinessCard;

alter table BusinessCard add primary key(ID); # id 컬럼을 기본키로 지정
desc BusinessCard;

alter table BusinessCard add unique (ID);
desc BusinessCard;

alter table BusinessCard alter Adress1 set default 'Seoul'; #seoul로 기본값 지정
desc BusinessCard;

alter table BusinessCard rename BusinessCards;
desc BusinessCards;

# 스키마 삭제
show tables;
select * from BusinessCards;
truncate table BusinessCards; # 테이블 안 내용 삭제
desc BusinessCards;
drop table BusinessCards; # 테이블 자체 삭제
desc BusinessCards;
drop database sampleDB; # db 자체 삭제
show databases;