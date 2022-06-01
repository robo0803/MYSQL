# SELECT INTO
- 쿼리 결과를 새 테이블로 만든다.
- CREATE TABLE 테이블명 SELECT * FROM 테이블명
- 기존에 존재하지 않는 테이블이 새로 생성됨(일종의 뷰와 동일한 효과)

# INSERT INTO SELECT
- 쿼리결과를 기존의 테이블에 추가
- INSERT INTO 테이블명1 SELECT * FROM 테이블명2 WHERE 조건절...
- 두 개의 별도 쿼리를 하나로 합침
- SELECT 하는 테이블과 INSERT 하는 테이블은 동일한 구조를 가져야 함

# CASE ... WHEN ... END
- 조건문(IF/SWITCH문)에 해당
- CASE WHEN 조건값1 THEN...
        WHEN 조건값2 THEN...
        ELSE...
  END

# LIKE 검색
- 정확한 키워드를 모를 경우 일부만으로 검색하는 방법
- 와일드카드(%,_)를 사용해 패턴매칭
SELECT 컬럼명 FROM 테이블명 WHERE 컬럶명 LIKE 패턴
- 와일드카드 : %: 0-N글자 / _ : 1글자
- LIKE와 OR를 중복해서 사용하지 않도록 해야 함

# NULL값
- 해당 컬럼의 값이 없다는 의미
- NULL값을 가지고 있는 컬럼을 검색하려면 IS NULL
- NULL값이 아닌 값을 가지고 있는 컬럼 검색하려면 IS NOT NULL

# NULL 함수 (IF NULL())
- 숫자컬럼 연산할 때 NULL을 처리해주는 함수
- NULL값이 나오면 다른 값(주로0)으로 대체해서 계산에 문제없도록 처리
- 숫자연산/집합함수(예:SUM())의 경우는 처리가 내장되어 있음
- 직접 함수나 쿼리에 넣는 경우는 NULL함수를 사용해야 함

# GROUP BY/HAVING
- SELECT 컬럼명, 집합함수명(컬럼명) FROM 테이블명 GROUP BY 컬럼명;
- HAVING은 집합연산에 WHERE 조건절 대체로 사용

# 서브쿼리(SUBQUERY)
- 쿼리문 내에 또 다른 쿼리문이 있는 형태
- ORDER BY 사용 못함

### 다중행 연산자
- ALL : 여러 개의 레코드의 AND효과(가장 큰 값보다 큰)
- ANY : 여러 개의 레코드의 OR효과(가장 작은 값보다 큰)
- IN/EXISTS : 결과값 중에 있는 것 중에서의 의미

# 집합연산
- 합집합,교집합,차집합...
- MYSQL에서는 INTERSECT/MINUS는 지원하지 않음

### UNION
- 두 쿼리의 결과값을 합쳐서 리턴함 
- SELECT 쿼리1 UNION SELECT 쿼리2 UNION...
- 다른 테이블이라도 결과값의 형식만 일치하면 됨

### UNION ALL - 중복을 허용하는 UNION
- SELECT 쿼리1 UNION ALL SELECT 쿼리2 UNION...

# 스키마 
- DDL : 데이터베이스와 테이블을 CRUD
- 테이블에 대한 정보는 메타데이터로 데이터사전에 저장,관리됨
- 데이터 베이스 생성
- CREATE DATABASE 데이터베이스명;
- 테이블 생성
- CREATE TABEL 테이브명(컬럼명1 데이터타입(크기),컬럼명2...);

# 자료형
### 정수형
- TINYINT
- INT
- BIGIINT

### 실수형(길이, 소수점 이하 자리 수)
- FLOAT
- DOUBLE
- DECIMAL

### 문자열
- CHAR 고정길이 문자열(최대 255자)
- VARCHAR 가변길이 문자열(최대 65,535자)

# 제약조건
- UNIQUE
- NOT NULL
- PRIMARY KEY
- CHECK
- AUTO INCREMENT 
