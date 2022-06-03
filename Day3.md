# 중복정보 제거
- 테이블 간의 정보는 중복되지 않아야 함
- 정규화를 통해 중복성 제거
- 중복성 제거 후 필요한 정보는 외래키를 통한 조인을 통해 필요한 정보를 구함

# 참조무결성
- 외래키에 적용되는 규칙
- 외래키와 참조되는 원래 테이블의 키와 관계를 명시
- 외래키를 참조하면 원래 테이블에 해당 레코드 값이 반드시 존재해야 함
- 원래 레코드를 삭제하려면 참조하는 외래키값을 먼저 null로 만들어야 함

# 스키마 수정
- 이미 생성된 스키마에 대해 수정할 경우 사용
- ALTER TABLE 테이블명 ADD 컬럼명 데이터타입
- ALTER TABLE 테이블명 DROP COLUMN 컬럼명
- ALTER TABLE 테이블명 CHANGE 컬럼명 NEW 컬럼명 데이터타입(컬럼명변경)
- ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입(컬럼타입변경)

### 기본키 제약조건 추가/기본키 제약조건 삭제
- ALTER TABLE 테이블명 ADD PRIMARY KEY(컬럼명)
- ALTER TABLE 테이블명 DROP PRIMARY KEY

### UNIQUE 제약조건 추가/삭제
- ALTER TABLE 테이블명 ADD UNIQUE (컬럼명)
- ALTER TABLE 테이블명 ADD CONSTRAINT 제약명 UNIQUE(컬럼명1,컬럼명2)
- ALTER TABLE 테이블명 DROP UNIQUE 제약명

### 외래키 제약조건 추가/삭제
- ALTER TABLE 테이블명 ADD FOREIGN KEY(컬럼명) REFERENCES 원테이블명(원컬럼명)
- ALTER TABLE 테이블명 DROP 


### 테이블명
- ALTER TABLE 테이블명 RENAME NEW_테이블명;

### CHECK 제약조건 추가 / 삭제
- ALTER TABLE 테이블명 ADD CHECK 조건
-                       ADD CONSTRAINT 조건명 CHECK(조건절)
-                       DROP CHECK 조건명

### DEFAULT 제약조건
- ALTER TABLE 테이블명 ALTER 컬럼명 SET DEFAULT 기본값
-                                  DROP DEFAULT

# 스키마 삭제
### 데이터 베이스 삭제
- DROP DATABASE 데이터베이스명 : 데이터베이스 삭제
-
### 테이블 삭제
- DROP TABLE 테이블명 : 테이블 삭제 , 내용과 테이블 전체 삭제
- DELETER FROM 테이블명: 레코드를 일일히 하나씩 지움, 테이블 스키마는 유지
- TRUNCATE TABLE 테이블명 : 테이블 내용만 지움, 테이블 스키마는 유지, 전용명령어

