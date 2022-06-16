# 이전 테이블에서 별도의 csv파일로 save한 다음 저장된 csv파일에서 load데이터를 통해 새로 테이블 생성 후 내용 추가
use world;
show variables like 'secure%';
select name,code into outfile 'c:\ProgramData\MySQL\MySQL Server 8.0\Uploads\country.csv' fields terminated by ',' from country;
create table sample_country (name varchar(255),code varchar(255));
desc sample_country; # 내용은 없는 상태
select * from sample_country;
load data infile 'c:\ProgramData\MySQL\MySQL Server 8.0\Uploads\country.csv' into table sample_country fields terminated by ','; # 239개 로드 해오는 과정
select * from sample_country limit 10; 