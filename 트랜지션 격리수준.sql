# 트랜지션, 격리
select @@autocommit;
set autocommit=0;
select @@autocommit;
create database sampleDB;
use sampleDB;
create table BusinessCard(Name varchar(255),Address varchar(255), Telephone varchar(255));
insert into Businesscard values ('Bob','Seoul','123-4567');
commit; # 반영하겠다는 의미
set autocommit = 1; # 1로 바꿔줘야 다른 transition이 돌때 문제 없음
select @@tx_isolation; # 현재 repeatable-read임
set tx_isolation = 'READ-COMMITTED';
select @@tx_isolation; # read-committed로 바뀐것 확인 가능
