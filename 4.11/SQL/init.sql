-- 고객 테이블
CREATE TABLE IF NOT EXISTS customer
(
    customer_id VARCHAR(20) NOT NULL PRIMARY KEY COMMENT '고객 아이디',
    customer_name VARCHAR(20) NOT NULL COMMENT '고객 이름',
    grade VARCHAR(20) CHECK (grade IN ('브론즈', '실버', '골드', 'VIP')) COMMENT '고객 등급',
    is_use BOOLEAN COMMENT '회원 탈퇴 여부 (true: 탈퇴, false, 미탈퇴)',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '고객 등록날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--고객 구매이력 테이블
CREATE TABLE IF NOT EXISTS customer_history_purchase
(
    history_no BIGINT(20) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '히스토리 번호',
    customer_id VARCHAR(20) NOT NULL COMMENT '고객 아이디',
    cost INTEGER(4) COMMENT '비용',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '구매 날짜',
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Alt + x : insert 한번에 실행
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('4431977', 'SMITH', '브론즈', TRUE, '2021-12-07 06:30:13');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('5194998', 'ALLEN', '실버', FALSE, '2021-12-07 07:00:23');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('16045624', 'WARD', '실버', FALSE, '2021-12-07 09:30:37');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('17810814', 'JONES', '실버', FALSE, '2021-12-10 10:20:29');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('22740286', 'MARTIN', '골드', FALSE, '2021-12-11 12:55:31');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('22868779', 'BLAKE', '골드', FALSE, '2021-12-11 12:55:31');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('20381000', 'KING', 'VIP', FALSE, '2021-12-25 01:13:11');

INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1500, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',2000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',800, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',100, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('17810814',250, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('17810814',350, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22740286',400, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22740286',400, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22868779',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',5000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',8000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',6600, '2022-01-03');

-- 1. 탈퇴하지 않은 고객 아이디와 이름, 등급 조회.
select
	customer_id ,
	grade
from customer 
where is_use

-- 2. '2021-12-09' 이후에 가입한 고객 수 조회.
select 
count(*) as '가입고객수'
from customer c 
where create_at > 2021-12-09

-- 3. 구매이력이 있는 고객 아이디와, 이름, 구매날짜, 비용 조회.
select
c.customer_id as '고객 아이디',
c.customer_name as '이름',
chp.create_at as '구매날짜', 
chp.cost as '비용'
from customer as c 
inner join customer_history_purchase as chp
on c.customer_id = chp.customer_id

 



-- 4. 등록된 고객 중 한 번도 구매 이력이 없는 고객 아이디, 이름, 회원 탈퇴 여부 조회.
select 
c.customer_id ,
c.customer_name ,
c.is_use
from customer as c 
left join customer_history_purchase as chp
on c.customer_id = chp.customer_id



-- 5. '2022-01-03'기준 고객 아이디별 구매 건수와 총 비용, 이름, 등급 조회.
select 
	c.customer_id ,
	count(chp.history_no),
	sum(cost),
	c.customer_name ,
	c.grade 
from customer as c 
inner join customer_history_purchase as chp
on c.customer_id = chp.customer_id 
where chp .create_at > 2022-01-03
group by chp.customer_id


-- 6. '2022-01-03'기준 3번 이상 구매한 고객 아이디, 이름, 등급 조회.
select 
	c.customer_id ,
	count(chp.history_no),
	sum(cost),
	c.customer_name ,
	c.grade 
from customer as c 
inner join customer_history_purchase as chp
on c.customer_id = chp.customer_id 
where chp .create_at > 2022-01-03
group by chp.customer_id
having count(chp.history_no)  >= 3


-- 7. 고객번호가 5194998인 고객 등급을 골드로 업데이트 하시오.
UPDATE customer SET grade = '골드' WHERE customer_id = 5194998;