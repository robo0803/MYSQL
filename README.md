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


# 논리연산자(and , or, not)
select * from city where country='kor' and population>=1000000;

# 논리연산자(in, between)
select * from city where country in ('kor','chn','jpn');
select * from city where country= 'kor' and (population between 100000 and 5000000);

# 결과정렬(ORDER BY)
select * from 테이블명 where 조건절 order by 컬럼명 asc/desc,...
기본값: 오름차순 정렬 

# 결과값 일부 조회 
select 컬럼명1, 컬럼명2, ... from 테이블명 where 조건절 limit 숫자

# 집합함수
select aggregation_function(컬럼명) from 테이블명 where 조건절;

# 유용한 함수들
-length() : 레코드의 문자열 컬럼의 글자수 리턴
-mid() : 문자열의 중간부분 리턴
-upper()/Lower() : 문자열을 대문자/소문자로 리턴
-round() : 레코드의 숫자 컬럼값을 반올림해서 리턴

# JOIN 의 개념
* 서로 다른 테이블을 공통 컬럼을 기준으로 합치는 테이블단위연산
* select * from 테이블1 join 테이블2 on 테이블1.컬럼명 = 테이블2.컬럼명...
* 조인시 서로 다른 테이블에 같은 컬럼명이 존재하면 구분을 위해 테이블명 * 컬럼명으로 사용해 표시

- inner join : 조인 시 null값을 허용하지 않음
- left join : 조인시 join 의 왼쪽 테이블의 null 값을 포함해서 표시
- right join : 조인시 join의 오른쪽 테이블의 null값을 포함해서 표시
- full join : mysql은 지원하지 않음

# ALIAS(별명)
- 조인할 때 많이 사용
- select 테이블명1.컬럼명1 as 별명1, 테이블명2.컬럼명2 as 별명2 from ...

# 뷰(view)
- SQL쿼리의 결과값을 임시테이블로 저장해서 사용할 수 있음
- 사용용도가 끝나면 명시적으로 삭제해야 함(DROP VIEW....)
- CREATE VIEW 뷰명 AS SELECT ...





