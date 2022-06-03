show databases;
use world;
show tables;
desc city;
select * from city;
select Name from city where CountryCode='KOR';

select * from city where CountryCode ='KOR' and population between 100000 and 500000 order by CountryCode, Name desc;
select * from city where CountryCode = 'KOR' order by Population desc limit 10;
select count(*) from city where CountryCode = 'KOR' order by Population desc ; 
select sum(Population) from city where CountryCode='KOR' order by Population desc;
select avg(Population) from city where CountryCode='KOR' order by Population desc;
select max(Population) from city where CountryCode='KOR' order by Population desc;
select * from city where Population = 9981619; # 서울임

select Name, length(Name) from city where CountryCode='KOR';
select Name, length(Name),upper(mid(Name,1,3)) from city where CountryCode='KOR';

desc country;
select * from country limit 10;
select name, lifeexpectancy, round(lifeexpectancy,0) from country limit 10; # 기대수명 정수부분만 출력

CREATE VIEW SAMPLEVIEW AS SELECT CITY.COUNTRYCODE AS ABBR, COUNTRY.NAME AS FULLNAME FROM CITY JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE WHERE CITY.COUNTRYCODE='KOR';
SELECT * FROM SAMPLEVIEW;

create table city_new select * from city where CountryCode='KOR';
select * from city_new; # 스키마는 CITY = CITY_NEW

insert into city_new select * from city where CountryCode='CHN'; #append의 의미
select * from city_new;

insert into city_new select * from city where CountryCode='JPN'; #append의 의미
select count(*) from city_new;
select * from city_new;

select distinct CountryCode from city_new; # 한국,중국,일본 세 나라가 들어있는지 확인가능(중복제외)

select name,length(Name), Population from city limit 10;
select upper(name),length(Name), Population from city limit 10;
select upper(mid(name,1,3)),length(Name), Population from city limit 10;

# 나라 이름이 세 글자만 출력되도록
select case when length(Name)>3 then upper(mid(Name,1,3))
			when length(Name)<=3 then upper(Name)
            end,Population from city limit 10;

desc city;
# 인구수에 따라 level0~level3 
select Name, Population, case when Population <=100000 then 'level0'
								when Population <=1000000 then 'level1'
                                when Population <=10000000 then 'level2'
                                when Population >10000000 then 'level3'
                                end from city order by Population desc limit 20;
                                
select count(*) from city where CountryCode like 'K%' ; 
select count(*) from city where CountryCode like '%k' ; 
select count(*) from city where CountryCode like '%K%' ; 
select count(*) from city where CountryCode like 'k__'; #k로 시작하는 3자리 국가코드

select Name from country where LifeExpectancy is null;
select count(Name) from country where LifeExpectancy is not null;
select avg(LifeExpectancy) from country; # 기대수명이 null은 빼고 avg계산
select avg(ifnull(LifeExpectancy , 0)) from country; # 기대수명이 null인 것도 0으로 계산한것

select CountryCode, count(CountryCode) from city group by CountryCode; # 각 나라별로 도시가 몇개인지 
select CountryCode, count(CountryCode) from city group by CountryCode having CountryCode='KOR'; 
select CountryCode, count(CountryCode) from city group by CountryCode having count(CountryCode)>70 ;

#sub query사용
select count(*) from city where CountryCode = (select Code from country where Name = 'South Korea'); 

select avg(Population) from city where CountryCode = 'KOR';
select Name, Population from city where Population >(select avg(Population) from city where CountryCode = 'KOR');

# all, any
select Name, Population from city where Population > all(select Population from city where CountryCode = 'KOR');
select Name, Population from city where Population < any(select Population from city where CountryCode = 'KOR');

select CountryCode, count(CountryCode) from city group by CountryCode;
select CountryCode, count(CountryCode) from city where CountryCode IN(select code from Country where name in('south Korea','china','japan'))group by CountryCode;
select Name, countrycode, population from city where (name, countrycode) in (select name,countrycode from 
city where population > 5000000);

select count(*) from city where exists (select * from city where countrycode = 'kor'); #true
select count(*) from city where not exists (select * from city where countrycode = 'kor'); #false

# union
(select * from city where countrycode = 'kor') union (select * from city where countrycode='chn');
(select countrycode from city where countrycode = 'kor') union (select countrycode from city where countrycode='chn'); # 중복 없애고 출력하므로 kor,chn두 줄 나옴
(select countrycode from city where countrycode = 'kor') union all (select countrycode from city where countrycode='chn'); # 중복 허용

create database sampleDB;
show databases;
use sampleDB;

create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
show tables;
insert into BusinessCard values('Bob','Seoul','12-4567');
insert into BusinessCard values('Sample','Busan','321-4567');
select * from BusinessCard;
drop table BusinessCard;

create table BusinessCard (Name varchar(255) not null, Address varchar(255), Telephone varchar(255));
desc BusinessCard;
insert into BusinessCard values('Bob',NULL,NULL);
insert into BusinessCard values(NULL,NULL,NULL); # name은 null값이 못 오게 만들었기 때문에 오류 발생
drop table BusinessCard;

create table BusinessCard (Name varchar(255) unique, Address varchar(255), Telephone varchar(255));
desc BusinessCard;
insert into BusinessCard values('Bob',NULL,NULL);
insert into BusinessCard values('Bob',NULL,NULL); # unique이므로 같은 이름 추가할 수 없음alter
drop table BusinessCard;

create table BusinessCard (id int, Name varchar(255) , Address varchar(255), Telephone varchar(255), primary key(id));
desc BusinessCard;
insert into BusinessCard values(1,NULL,NULL,null);
insert into BusinessCard values(null,NULL,NULL,null); # 기본키는 null값을 가질 수 없음
insert into BusinessCard values(1,NULL,NULL,null); # 1값이 있으므로 중복 불가
select * from BusinessCard;

create table Salary (id int not null, salary_amount int, business_card_id int not null, foreign key(business_card_id) references BusinessCard(id));
desc Salary;
show create table Salary;
insert into Salary values(1,1000,1);
insert into Salary values(2,2000,2); #2번 record가 business table에 없으므로 추가 불가
insert into Salary values(3,3000,3); #3번 record가 business table에 없으므로 추가 불가

# auto_increment
create table BC(id int auto_increment, name varchar(255), primary key(id));
desc BC;
insert into BC(Name) values ('Bob');
insert into BC(Name) values ('Sam');
select * from BC;

#참조 무결성
insert into country(Name, Code) values ('ZZZ','ZZZ');
insert into city(Name, CountryCode) values ('YYY','ZZZ');
insert into city(Name,CountryCode) values ('MMM','TTT');
delete from country where Code='ZZZ'; # 참조하고 있는 상태라 삭제 불가능

