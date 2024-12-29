SELECT sequence_name FROM user_sequences WHERE sequence_name = 'BOOKING_RESERVATION_ID_SEQ';

ALTER TABLE BILL
DROP CONSTRAINT EMPLOYEE_BILL_FK
DROP CONSTRAINT BOOKING_BILL_FK;

ALTER TABLE BOOKING
DROP CONSTRAINT CLIENT_BOOKING_FK
DROP CONSTRAINT ROOM_BOOKING_FK;

ALTER TABLE EMPLOYEE
DROP CONSTRAINT EMPLOYEE_BILL_FK;

ALTER TABLE BOOKING_SERVICE_FK
DROP CONSTRAINT BOOKING_SERVICE_FK_BOOKING_FK
DROP CONSTRAINT BOOKING_SERVICE_FK_SERVICE_FK;


DROP SEQUENCE BOOKING_RESERVATION_ID_SEQ;
DROP SEQUENCE service_service_id_seq;
DROP SEQUENCE room_room_id_seq;
DROP SEQUENCE employee_employee_id_seq;
DROP SEQUENCE client_client_id_seq;


DROP table BILL;
DROP table BOOKING;
drop table CLIENT;
drop table ROOM;
drop table SERVICE;
drop table BOOKING_SERVICE_FK;
drop table EMPLOYEE;

purge table BILL;
purge table CLIENT;
purge table ROOM;
purge table BOOKING_SERVICE_FK;
purge table SERVICE;
purge table EMPLOYEE;
purge table BOOKING;


--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'BILL' AND constraint_type = 'R';
--
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'BOOKING' AND constraint_type = 'R';
--
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'ROOM' AND constraint_type = 'R';
--
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'CLIENT' AND constraint_type = 'R';
--
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'BOOKING_SERVICE_FK' AND constraint_type = 'R';
--
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'SERVICE' AND constraint_type = 'R';
----
--SELECT constraint_name 
--FROM user_constraints 
--WHERE table_name = 'EMPLOYEE' AND constraint_type = 'R';
