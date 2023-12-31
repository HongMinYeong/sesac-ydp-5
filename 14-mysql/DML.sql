
CREATE TABLE CUSTOMER (
	CUSTID CHAR(10) PRIMARY KEY,
	CUSTNAME VARCHAR(10) NOT NULL,
	ADDR CHAR(11) NOT NULL,
	PHONE CHAR(11),
    BIRTH DATE 
	-- Age int check (Age >=18)
	);
      
DESC CUSTOMER;
-- 외래키 제약조건
-- 두 테이블 사이의 관계를 맺음
-- 다른 테이블의 기본키를 외래키로 연결
-- 기준 테이블: 기본키를 갖는 테이블(CUSTOMER)
-- 참조 테이블: 외래키가 있는 테이블(ORDERS)
-- 형식 : FOREIGN KEY (row_name) REFERENCES 기준_테이블(row_name) 

-- ON UPDATE CASCADE : 기준 테이블의 데이터가 변경되면 참조 테이블의 데이터도 변경 
-- ON DELETE CASCADE : 기준 테이블의 데이터가 삭제되면 참조 테이블의 데이터도 삭제 

-- 테이블 ORDERS 생성
CREATE TABLE ORDERS (
	ORDERID int PRIMARY KEY AUTO_INCREMENT,
	CUSTID CHAR(10) NOT NULL,
	PRODNAME CHAR(6) NOT NULL,
	PRICE INT NOT NULL,
	AMOUNT SMALLINT NOT NULL,
	FOREIGN KEY (CUSTID) REFERENCES CUSTOMER(CUSTID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 테이블 삭제 순서!
-- customer table, orders table이 customer.custid 를 기준으로 "관계" 맺음
-- customer table 존재하는 회원만 orders 테이블에 데이터를 추가할 수 있음
-- 만약에 orders 테이블이 있는데, customer 테이블을 삭제 (drop) 하면?
-- orders 테이블은 어떤 고객의 생일 정보를 알고 싶어도 customer 테이블 자체가 날라갔기 때문에 알 수 없음. 
-- pk-fk 연결된 테이블은 외래키가 설정된 테이블 (참조 테이블) 먼저 삭제
-- (1) orders 테이블 삭제 -> (2) customer 테이블 삭제


-- INSERT 추가 
INSERT INTO CUSTOMER (CUSTID,CUSTNAME,ADDR,PHONE,BIRTH) 
			VALUES ('LUCKY','강해원','미국 뉴욕','01022223333','2002-03-05');

INSERT INTO CUSTOMER (ADDR,PHONE,BIRTH,CUSTID,CUSTNAME) 
	VALUES ('대한민국 부산', '01098765432', '2007-04-28', 'WOW', '이지은');
    
    -- 속성을 지정하지 않는다면, 컬럼이 정이된 순서대로 입력
INSERT INTO CUSTOMER VALUES('HAPPY', '최시은', '일본 오키나와', '01033331234', '1970-10-31');    

-- 여러 튜플 동시 추가 
INSERT INTO CUSTOMER VALUES
		('ASDF', '강세희', '대한민국 부산', '01033331235', '2004-11-11'),
        ('SDFG', '윤지성', '일본 도쿄', '01033331236', '1995-02-15'),
        ('DFGH', '이재은', '미국 뉴욕', '01033331237', '2004-06-07');

INSERT INTO CUSTOMER VALUES
		('KIWI', '김키위', '대한민국 서울', '01012341234', '1990-03-17'),
		('APPLE', '이사과', '대한민국 포항', '01012344321', '1992-06-17');

INSERT INTO ORDERS VALUES 
	(NULL, 'KIWI', '프링글스', '3000', 5),
	(NULL, 'APPLE', '프링글스', '3000', 1),
	(NULL, 'KIWI', '홈런볼', '2000', 3);

-- UPDATE 수정 
-- CUSTID 가 HAPPY인 고객의 주소를 대한민국 서울로 변경
UPDATE CUSTOMER SET ADDR = '대한민국 서울' WHERE CUSTID = 'HAPPY';

-- DELETE 삭제
-- CUSTID 가 HAPPY 인 사람의 정보를 테이블에서 삭제
DELETE FROM CUSTOMER WHERE CUSTID = 'HAPPY';

-- 고객 테이블에 'apple'고객을 삭제했을 때, 주문 테이블에서 'apple' 고객의 주문 정보가 함께 삭제되는지?
DELETE FROM CUSTOMER WHERE CUSTID= 'APPLE';

-- SELECT 조회
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;


-- 틀리면 다 지워버리기  
DROP TABLE CUSTOMER;
DROP TABLE ORDERS;

-- SET FOREIGN_KEY_CHECKS = 1;

TRUNCATE TABLE CUSTOMER;
TRUNCATE TABLE ORDERS;



-- SELECT 실습 -------

INSERT INTO customer VALUES('bunny', '강해린', '대한민국 서울', '01012341234', '2000-02-23');
INSERT INTO customer VALUES('hello', '이지민', '대한민국 포항', '01022221234', '1999-08-08');
INSERT INTO customer VALUES('kiwi', '최지수', '미국 뉴욕', '01050005000', '1990-12-25');
INSERT INTO customer VALUES('imminji01', '강민지', '영국 런던', '01060001000', '1995-01-11');
INSERT INTO customer VALUES('lalala', '홍수지', '미국 로스앤젤레스', '01010109090', '2007-05-16');
INSERT INTO customer VALUES('jjjeee', '홍은정', '대한민국 서울', '01099991111', '2004-08-17');
INSERT INTO customer VALUES('wow123', '이민혁', '일본 삿포로', '01011223344', '1994-05-31');
INSERT INTO customer VALUES('minjipark', '박민지', '프랑스 파리', '01088776655', '1998-04-08');
INSERT INTO customer VALUES('jy9987', '강지연', '일본 삿포로', '01012312323', '1996-09-01');




INSERT INTO orders VALUES(NULL, 'jy9987', '프링글스', 3500, 2);
INSERT INTO orders VALUES(NULL, 'kiwi', '새우깡', 1200, 1);
INSERT INTO orders VALUES(NULL, 'hello', '홈런볼', 4200, 2);
INSERT INTO orders VALUES(NULL, 'minjipark', '맛동산', 2400, 1);
INSERT INTO orders VALUES(NULL, 'bunny', '오감자', 1500, 4);
INSERT INTO orders VALUES(NULL, 'jjjeee', '양파링', 2000, 1);
INSERT INTO orders VALUES(NULL, 'hello', '자갈치', 1300, 2);
INSERT INTO orders VALUES(NULL, 'jjjeee', '감자깡', 1200, 4);
INSERT INTO orders VALUES(NULL, 'bunny', '죠리퐁', 1500, 3);
INSERT INTO orders VALUES(NULL, 'kiwi', '꼬깔콘', 1700, 2);
INSERT INTO orders VALUES(NULL, 'hello', '버터링', 4000, 2);
INSERT INTO orders VALUES(NULL, 'minjipark', '칙촉', 4000, 1);
INSERT INTO orders VALUES(NULL, 'wow123', '콘초', 1700, 3);
INSERT INTO orders VALUES(NULL, 'imminji01', '꼬북칩', 2000, 2);
INSERT INTO orders VALUES(NULL, 'bunny', '썬칩', 1800, 5);
INSERT INTO orders VALUES(NULL, 'kiwi', '고구마깡', 1300, 3);
INSERT INTO orders VALUES(NULL, 'jy9987', '오징어집', 1700, 5);
INSERT INTO orders VALUES(NULL, 'jjjeee', '바나나킥', 2000, 4);
INSERT INTO orders VALUES(NULL, 'imminji01', '초코파이', 5000, 2);

-- 모든 고객의 아이디를 검색
SELECT CUSTID FROM CUSTOMER;

-- 모든 고객의 아이디, 생년월일 검색
SELECT CUSTID, BIRTH FROM CUSTOMER;

-- 모든 고객의 생년월일, 아이디 검색 (순서 있음))
SELECT BIRTH, CUSTID FROM CUSTOMER;

-- 모든 고객의 아이디, 이름, 주소,전화번호, 생년월일 검색
SELECT CUSTID, CUSTNAME,ADDR,PHONE,BIRTH FROM CUSTOMER;

-- * 와일드 카드 사용 
SELECT * FROM CUSTOMER;

위에랑 동일.

-- 고객 테이블에 있는 모든 주소 검색
SELECT ADDR FROM CUSTOMER;
-- DISTINCT : 중복제거 
SELECT DISTINCT ADDR  FROM CUSTOMER;

-- < WHERE 조건 >
-- 비교: =, <>, <, <=, >, >=
-- 범위: BETWEEN
-- 집합: IN, NOT IN
-- 패턴: LIKE
-- NULL: IS NULL, IS NOT NULL
-- 복합조건: AND, OR, NOT

-- 비교
-- 고객 이름이 강해린인 고객의 생일을 검색
SELECT BIRTH FROM CUSTOMER WHERE CUSTNAME = '강해린';
-- 고객 이름이 강해린이 아닌 고객들의 생일 검색 
SELECT BIRTH FROM CUSTOMER WHERE CUSTNAME != '강해린';
-- 사전순으로 박민지보다 뒤에 위치한 고객의 모든 정보 검색
SELECT * FROM CUSTOMER WHERE CUSTNAME>'박민지' ;
-- 범위
-- 1995년이상 2000년 이하 출생 고객 검색
SELECT * FROM CUSTOMER WHERE BIRTH BETWEEN '1995-01-01' AND '2000-12-31' ;
SELECT * FROM CUSTOMER WHERE BIRTH >= '1995-01-01' AND BIRTH <= '2000-12-31' ;


-- 집합
-- 주소가 서울 혹은 런던인 고객 검색
SELECT * FROM CUSTOMER WHERE ADDR IN ('대한민국 서울','영국 런던' );
SELECT * FROM CUSTOMER WHERE ADDR = '대한민국 서울' OR ADDR = '영국 런던';
-- 주소가 서울 혹은 런던이 아닌 고객 검색
SELECT * FROM CUSTOMER WHERE ADDR NOT IN ('대한민국 서울','영국 런던' );


-- 패턴
-- 주소가 '미국 로스앤젤레스'인 고객을 검색
SELECT * FROM CUSTOMER WHERE ADDR LIKE '미국 로스앤젤레스';

-- 주소에 '미국'이 포함되어 있는 고객 검색
-- %: 0개 이상 문자열
SELECT * FROM CUSTOMER WHERE ADDR LIKE '%미국%';

-- 고객 이름 두번째 글자가 '지'인 고객 검색
-- _:임의의 하나의 문자
SELECT * FROM CUSTOMER WHERE CUSTNAME LIKE '_지%';
-- 참고
SELECT * FROM CUSTOMER WHERE CUSTNAME LIKE '_지'; -- 검색 결과 0 

-- 고객 이름 세번째 글자가 '수'인 고객
SELECT * FROM CUSTOMER WHERE CUSTNAME LIKE '__수%';
-- 참고

SELECT * FROM CUSTOMER WHERE CUSTNAME LIKE '%수'; -- 이름이 몇자든 마지막 글자가 수이면 다 선택



-- 복합조건 (AND, OR, NOT)
-- 주소지가 대한민국이고, 2000년생 이후 출생 고객 검색
SELECT * FROM CUSTOMER WHERE ADDR LIKE '대한민국%' AND BIRTH >= '2000-01-01';
-- 주소지가 미국이거나 영국인 고객 검색
SELECT * FROM CUSTOMER WHERE ADDR LIKE '미국%' OR ADDR LIKE '영국%';
-- 휴대폰 번호 마지막 자리가 4가 아닌 고객 검색
SELECT * FROM CUSTOMER WHERE PHONE NOT LIKE '%_4'; -- 언더바가 들어가야 무조건 4로 끝남 

-- < ORDER BY > 
-- order by 없음: pk 기준 오름차순 정렬
select * from customer;

select * from customer order by custname;

select * from customer order by custname desc;

-- where 절과 order by 함께 사용 (단, 이 때 order by 가 where 보다 뒤에 위치해야 함)
-- 2000년생 이후 출생자 중에서 주소를 기준으로 내림차순 검색
select * from customer where birth >= '2000-01-01' order by addr desc;
-- select * from customer order by addr desc where birth >= '2000-01-01'; -- error: 구문 순서 오류


-- 2000년생 이후 출생자 중에서 주소를 기준으로 내림차순 그리고 아이디를 기준으로 내림차순 검색
select * from customer where birth >= '2000-01-01' order by addr desc, custid desc;

-- 2000년생 이후 출생자 중에서 주소를 기준으로 오름차순 그리고 아이디를 기준으로 내림차순 검색
select * from customer where birth >= '2000-01-01' order by addr, custid desc;

-- < LIMIT >
-- 행의 개수를 제한
select * from customer where birth >= '2000-01-01' limit 2;
select * from customer limit 3;

-- < 집계 함수 > 
-- 계산하여 어떤 값을 리턴하는 "함수"
-- group by 절과 함께 쓰이는 케이스가 많음
select * from orders;

-- 주문 테이블에서 상품의 총 판매 개수 검색
select sum(amount) from orders;

-- 주문 테이블에서 총 판매 개수 검색 + 의미있는 열이름으로 변경 
select sum(amount) as 'total_amount' from orders;

-- 주문 테이블에서 총 판매 개수, 평균 판매 개수, 상품 최저가, 상품 최고가 검색
-- avg_amount, min_price, max_price
select sum(amount) as 'total_amount', 
	avg(amount) as 'avg_amount', 
	min(price) as 'min_amount', 
	max(price) as 'max_amount' 
from orders;
    
-- 주문 테이블에서 총 주문 건수 (= 튜플 개수)
select count(*) from orders;

-- 주문 테이블에서 주문한 고객 수 (중복 없이)
select count(distinct custid) from orders;


-- < GROUP BY >
-- "~별로"

-- 고객별로 주문한 주문 건수 구하기
select custid, count(*) from orders group by custid;

-- 고객별로 주문한 상품 총 수량 구하기
select custid, sum(amount) from orders group by custid;

-- 고객별로 주문한 총 주문액 구하기
select custid, sum(price * amount) from orders group by custid;

-- 상품별로 판매 개수 구하기
select prodname, sum(amount) from orders group by prodname;

-- < HAVING > 
-- group by 절 이후 추가 조건

-- 총 주문액이 10000원 이상인 고객에 대해서 고객별로 주문한 상품 총 수량 구하기
select custid, sum(amount), sum(price * amount) from orders 
	group by custid 
	having sum(price * amount) >= 10000;

/* select custid, sum(amount), sum(price * amount) from orders 
	where sum(price * amount) >= 10000
	group by custid; -- error code 1111. grop 함수 잘못 사용 */
	
-- 총 주문액이 10000원 이상인 고객에 대해서 고객별로 주문한 상품 총 수량 구하기 
-- (단, custid가 'bunny'인 고객은 제외하고 출력할 것)
-- where, group by, having 모두 사용한 예시
select custid, sum(amount), sum(price * amount) from orders 
	where custid != 'bunny'
	group by custid 
	having sum(price * amount) >= 10000;
    
-- group by 주의 사항
-- select 절에서 group by 에서 사용한 속성과 집계함수만 사용 가능
-- 고객별로 주문한 주문 건수 구하기
select custid, count(*) from orders group by custid;


/*
where vs. having

having
- 그룹에 대해서 필터링 (그래서 group by 함께 쓰임)
- group by 보다 뒤에 위치
- 집계함수랑 함께 사용 가능

where
- 각각의 행을 필터링
- group by 보다 앞에 위치
- 집계함수를 쓸 수는 있으나 having 처럼 자유롭게 쓸 수는 없음
*/