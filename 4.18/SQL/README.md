### 테이블 설명
    상원아이티는 아프리카에 차량렌트사업을 하려고 한다.
    아프리카는 도난률이 높아 렌트차량에 IoT디바이스를 부착시켜 실시간으로 위치를 추적하려고 한다.
    devices는 IoT디바이스 정보가 저장.
    car_information는 렌트 차량 정보가 저장. 
    단, 디바이스가 부착된 렌트 차량 정보만 저장할 수 있다.
    car_event_log은 IoT디바이스가 부착된 렌트차량 이벤트(운행기록)가 저장.

## 문제

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
 
