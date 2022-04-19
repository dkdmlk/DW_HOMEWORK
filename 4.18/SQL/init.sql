-- 디바이스 테이블
CREATE TABLE IF NOT EXISTS devices
(
    device_uuid varchar(15) NOT NULL COMMENT '디바이스 고유 번호',
    battery INTEGER(4) NOT NULL COMMENT '배터리 잔량',
    firmware_ver varchar(20) COMMENT '펌웨어 버전(펌웨어 : 하드웨어 장치에 포함된 소프트웨어)',
    is_use BOOLEAN COMMENT '디바이스 사용 여부 (true: 사용, false, 미사용)',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '등록 날짜',
    CONSTRAINT devices_pk PRIMARY KEY (device_uuid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 자동차 테이블
CREATE TABLE IF NOT EXISTS car_information(
    car_number varchar(20) NOT NULL COMMENT '차량 번호판',
    device_uuid varchar(15) NOT NULL COMMENT '디바이스 고유 번호',
    admin_name varchar(30) NOT NULL COMMENT '담당자 이름',
    odometer INTEGER(4) COMMENT '주행 거리',
    latitude varchar(20) COMMENT '현재 위도',
    longitude varchar(20) COMMENT '현재 경도',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '등록 날짜',
    CONSTRAINT car_info_pk PRIMARY KEY (car_number),
    CONSTRAINT car_info_device_uuid_fk FOREIGN KEY (device_uuid) REFERENCES devices(device_uuid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 자동차 위치 기록
CREATE TABLE IF NOT EXISTS car_event_log(
    log_srl BIGINT(20) AUTO_INCREMENT NOT NULL COMMENT '히스토리 번호',
    car_number varchar(20) NOT NULL COMMENT '차량 번호판',
    event_type VARCHAR(10) CHECK (event_type IN ('1', '2', '3', '4')) COMMENT '이벤트 타입 (1: 정상, 2: 배터리 부족, 3: 탈착, 4: 통신 이상)',
    latitude varchar(20) COMMENT '위도',
    longitude varchar(20) COMMENT '경도',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 날짜',
    CONSTRAINT car_event_log_pk PRIMARY KEY (log_srl),
    CONSTRAINT car_event_log_log_srl_fk FOREIGN KEY (car_number) REFERENCES car_information(car_number)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Alt + x : insert 한번에 실행
INSERT INTO devices(device_uuid, battery, firmware_ver, is_use) VALUES('20133344', 100, '1.0.1', TRUE);
INSERT INTO devices(device_uuid, battery, firmware_ver, is_use) VALUES('21130022', 100, '1.0.1', TRUE);
INSERT INTO devices(device_uuid, battery, firmware_ver, is_use) VALUES('22330011', 100, '1.0.1', TRUE);

INSERT INTO car_information(car_number, device_uuid, admin_name, odometer, latitude, longitude) VALUES('359서 9096', '20133344', '현상원', 1500, '36.432039', '127.394448');
INSERT INTO car_information(car_number, device_uuid, admin_name, odometer, latitude, longitude) VALUES('60호 1337', '21130022', '현상원', 4800, '36.432039', '127.394448');
INSERT INTO car_information(car_number, device_uuid, admin_name, odometer, latitude, longitude) VALUES('13주 7777', '22330011', '현상원', 30000, '36.432039', '127.394448');

INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-11 01:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-11 03:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-11 06:33:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-11 09:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-11 10:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '1', '36.433858', '127.39512', '2022-04-12 01:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '3', '36.433858', '127.39512', '2022-04-12 02:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '3', '36.433858', '127.39512', '2022-04-12 03:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '3', '36.433858', '127.39512', '2022-04-12 04:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('359서 9096', '3', '36.433858', '127.39512', '2022-04-12 05:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 01:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 02:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 03:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 04:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 05:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 06:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 07:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 08:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 09:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 10:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '1', '36.433858', '127.39512', '2022-04-11 11:13:11');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('60호 1337', '4', '36.433858', '127.39512', '2022-04-13 14:00:39');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('13주 7777', '1', '36.433858', '127.39512', '2022-04-12 14:00:39');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('13주 7777', '3', '36.433858', '127.39512', '2022-04-12 15:13:09');
INSERT INTO car_event_log(car_number, event_type, latitude, longitude, create_at) VALUES('13주 7777', '3', '36.433858', '127.39512', '2022-04-12 17:20:45');

COMMIT;


1. 차량 수 조회

select
	count(*) 
from car_information


2. 차량에 부착된 디바이스 uuid, battery, create_at 조회.

select
	ci.device_uuid as id,
	d.battery,
	ci.create_at 
from devices as d
inner join car_information as ci
on d.device_uuid = ci.device_uuid

3. UUID '20130099', 배터리 100, 펌웨어 버전 '1.0.1', 사용여부 TRUE인 디바이스를 devices에 등록하시오.

INSERT INTO devices(device_uuid, battery, firmware_ver, is_use) VALUES('20130099', 100, '1.0.1', TRUE);

4. 2022-04-11 이후 탈착 이벤트가 1건 이상 발생된 UUID, 펌웨어 버전 조회.

select 
	 d.device_uuid as UUID,
	 d.firmware_ver as "펌웨어버전"
from car_event_log as cel
inner join car_information as ci
on cel.car_number = ci.car_number 
inner join devices as d
on ci.device_uuid = d.device_uuid
where cel.create_at > 2022-04-11 
and cel.event_type = 3


5. 2022-04-11 ~ 2022-04-13 일별 이벤트 카운트 조회.  

select
	date(create_at),
	count(event_type) 
from car_event_log
group by date(create_at)



6. 전체 디바이스 수, 차량에 부착된 디바이스 수, 차량에 부착하지 않은 디바이스 수 조회.


7. 차량번호 '359서 9096'의 2022-04-11 ~ 2022-04-13일까지 이벤트별 카운트 조회

select
	count(*) 
from car_event_log
where car_number = '359서 9096'
and (create_at between '2022-04-11' and '2022-04-13')
group by event_type 

8. UUID가 '20133344'인 디바이스의 2022-04-11 ~ 2022-04-13에 발생한 이벤트타입, 이벤트 날짜, 차량번호판, 담당자 조회.

select 
	 cel.event_type '사건타입',
	 cel.create_at '사건날짜',
	 cel.car_number as '차번호',
	ci.admin_name as '담당자'	 
from car_event_log as cel
inner join car_information as ci
on cel.car_number = ci.car_number 
inner join devices as d
on ci.device_uuid = d.device_uuid
where d.device_uuid = '20133344' 
and cel.create_at between '2022-04-11' and '2022-04-13'
 
