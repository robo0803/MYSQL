use mysql;
show tables;
desc user;
select user,host from user;
create user 'sampleUser'@'localhost' identified by 'test'; # sampleUser 생성
select user,host from user;
create user 'sampleUser'@'%' identified by 'test'; # 외부에서도 접근가능하도록 지정
select user,host from user;

show grants for 'sampleUser'@'localhost';
show grants for 'sampleUser'@'%'; # 원격접속 상태확인
show databases;
grant all on world.* to 'sampleUser'@'localhost' identified by 'test';
show grants for 'sampleUser'@'%';
grant select on world.city to 'sampleUser'@'%' identified by 'test';
show grants for 'sampleUser'@'%';
grant update(CountryCode) on world.city to 'sampleUser'@'%' identified by 'test';
show grants for 'sampleUser'@'%';
