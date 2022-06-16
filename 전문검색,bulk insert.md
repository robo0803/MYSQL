# 전문검색(Full Text Search)
- 기존 SQL의 LIKE검색은 여러 개의 검색필터를 동시에 매칭시키는 방식
- 여러 개의 조건문을 AND/OR 시킬 경우 심각한 성능 저하
- '빅데이터'란 단어를 검색하면 통합검색은 카페, 블로그 등을 검색
    - cafe like '%빅데이터%' or blog like '%빅데이터%' ...
- 결과는 동일하지만 DB서버에 부담을 주지 않는 방식 - full text search!
- 기본적으로 컬럼 내용 전체를 단순 문자열로 생각하고 검색하는 방식
- 문자편집기의 편집 찾기/바꾸기 메뉴의 동작방식과 유사

### mysql 의 full text search방식
- 자연어 검색 
- 불린 검색
- 쿼리 확장 검색
### full text search 인덱스 생성
- alter table 테이블명 add fulltext(컬럼명);

### 설정파일 수정
- 기존 full text index가 있으면 인덱스 재구성
   - repair table 테이블명 quick;

### 자연어 검색
- where match(컬럼명) against('검색어/검색문장')
  - 검색의 정확도 확인 as score
  - 결과는 검색의 정확도에 대한 내림차순 정렬

### 불린 검색
- 검색의 정확도에 따른 정렬이 안되고 연산자 사용한 구문 검색 가능
- 필수단어(+), 예외단어(-) 부분단어(*)
  - where match(컬럼명) against('"단어*"-제외단어 in boolean mode);

# BUlk Insert
- insert의 경우 레코드를 추가한 후 내부적으로 인덱스 재구성이 필요
- 여러 개의 레코드를 넣을 경우 하나의 레코드 입력시마다 이 작업이 연속적 발생
- 이런 문제점 해결해 줌

### 인덱스 작업 정지
alter table '테이블명' disable keys;

### 인덱스 작업 재설정
alter table '테이블명' enable keys;

### 주의할 점
load data/select into outfile의 경우 보안 문제로 특정 디렉토리에만 가능하도록 설정해야 함
