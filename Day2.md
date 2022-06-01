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
