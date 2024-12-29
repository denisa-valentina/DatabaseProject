set pages 100;

---------- SIDE NOTE:
--- script-ul cu extensia .ddl creeaza toate tabelele proiectului, avand constrangerile si trigger-ele impuse in data modeler
--- acest script insereaza date in tabele
--- script-ul actualizare.sql actualizeaza datele astfel incat toate sa fie la zi (unele preturi sunt calculate dupa generarea facturii)
--- script-ul afisare.sql afiseaza tabele dupa relatiile definite in sql data modeler
--- script-ul testare.sql verifica toate tipurile de constrangeri implementate, luand fiecare tabela in parte (verifica si unele triggere)
--- script-ul DeleteTables.sql sterge toate tabelele, asta in cazul in care se doreste reluarea pasilor

--- OBS : SCRIPT-UL ACTUALIZARE.SQL TREBUIE RULAT DUPA RRULAREA ACESTUI SCRIPT (PENTRU CA PRETURILE SA FIE ACTUALIZATE)



-------------------------------------------------------------------- SCRIPT-URI CARE INSEREAZA DATE IN TABELE --------------------------------------------------------------------------- 


--------------------------------------------------------------------------------  TABELA DE CAMERE -------------------------------------------------------------------------------- 
INSERT INTO room (room_number, floor, capacity, price)
VALUES(103, 1, 4, 100);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(303, 3, 2, 110);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(409, 4, 2, 130);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(510, 5, 3, 150);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(906, 9, 1, 200);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(108, 1, 1, 300);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(204, 2, 3, 190);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(810, 8, 4, 120);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(404, 4, 2, 130);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(208, 2, 5, 110);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(708, 7, 3, 150);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(202, 2, 1, 130);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(405, 4, 3, 160);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(605, 6, 5, 130);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(503, 5, 1, 100);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(306, 3, 2, 200);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(903, 9, 1, 250);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(701, 7, 2, 550);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(804, 8, 1, 450);

INSERT INTO room (room_number, floor, capacity, price)
VALUES(909, 9, 4, 450);

SELECT * FROM room;


--------------------------------------------------------------------------------  TABELA DE CLIENTI -------------------------------------------------------------------------------- 
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Ana Petrescu', TO_DATE('21.04.2000', 'DD.MM.YYYY'), '0724134891', 'ana_petrescu@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Dan Castor', TO_DATE('13.07.1997', 'DD.MM.YYYY'), '0724144567', 'dan_castor@yahoo.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Elena Dumitriu', TO_DATE('1.03.1970', 'DD.MM.YYYY'), '0723134111', 'elena_dumitriu@yahoo.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Ioana Petrea', TO_DATE('11.11.2001', 'DD.MM.YYYY'), '0724134891', 'ioana_petrea@yahoo.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Bianca Marin', TO_DATE('12.10.2003', 'DD.MM.YYYY'), '0778125000', 'bianca_marin@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Dana Matei', TO_DATE('23.08.1995', 'DD.MM.YYYY'), '0781268924', 'dana_matei@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Aurel Stan', TO_DATE('11.08.1997', 'DD.MM.YYYY'), '0781248983', 'aurel_stan@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Vlad David', TO_DATE('1.02.2001', 'DD.MM.YYYY'), '0791848013', 'vlad_david@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Daria Florea', TO_DATE('12.11.2003', 'DD.MM.YYYY'), '0741449153', 'daria_florea@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Flavius Barcan', TO_DATE('07.07.2004', 'DD.MM.YYYY'), '0711464112', 'flavius_barcan@gmail.com');
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Tiberius Dan', TO_DATE('17.12.1995', 'DD.MM.YYYY'), '0776122295', 'tiberius_dan@gmail.com');

select * from client;
        
--------------------------------------------------------------------------------  TABELA DE ANGAJATI -------------------------------------------------------------------------------- 
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Istrate Diana', '0715463417', 'chelner', TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Lunca Darius', '0761334129', 'manager', TO_DATE('11.10.2023', 'DD.MM.YYYY'), 3500);
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Stoleriu Andrei', '0711523493', 'receptie', TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Ioana Deliu', '0712583125', 'receptie', TO_DATE('11.05.2022', 'DD.MM.YYYY'), 3100);
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Laura Prodan', '0712091765', 'chelner', TO_DATE('10.11.2019', 'DD.MM.YYYY'), 2550);

select * from employee;

--------------------------------------------------------------------------------  TABELA DE SERVICII -------------------------------------------------------------------------------- 
insert into service(service_name, price, description)
VALUES ('spa', 100, '07:00-18:00');
insert into service(service_name, price, description)
VALUES ('fitness', 50, '06:00-21:00');
insert into service(service_name, price, description)
VALUES ('restaurant', 20, '06:00-22:00');
insert into service(service_name, price, description)
VALUES ('cazino', 100, '18:00-24:00');

select * from service;

-------------------------------------------------------------------------------- TABELA DE REZERVARI -------------------------------------------------------------------------------- 
insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('1.01.2025', 'DD.MM.YYYY'), TO_DATE('3.01.2025', 'DD.MM.YYYY'), TO_DATE('8.12.2024', 'DD.MM.YYYY'), 10003, 1004);

insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('30.12.2024', 'DD.MM.YYYY'), TO_DATE('5.01.2025', 'DD.MM.YYYY'), TO_DATE('7.12.2024', 'DD.MM.YYYY'), 10005, 1001);

insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('12.05.2025', 'DD.MM.YYYY'), TO_DATE('15.05.2025', 'DD.MM.YYYY'), TO_DATE('5.12.2024', 'DD.MM.YYYY'), 10002, 1002);

insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('10.02.2025', 'DD.MM.YYYY'), TO_DATE('12.02.2025', 'DD.MM.YYYY'), TO_DATE('8.12.2024', 'DD.MM.YYYY'), 10001, 1007);

insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('15.03.2025', 'DD.MM.YYYY'), TO_DATE('25.03.2025', 'DD.MM.YYYY'), TO_DATE('7.12.2024', 'DD.MM.YYYY'), 10001, 1007);

insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('24.12.2024', 'DD.MM.YYYY'), TO_DATE('25.12.2024', 'DD.MM.YYYY'), TO_DATE('6.12.2024', 'DD.MM.YYYY'), 10010, 1018);

select * from booking;

--------------------------------------------------------- TABELA CARE CONECTEAZA REZERVARILE DE SERVICII ---------------------------------------------------------------- 
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100001, 10005, 1001, 10);
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100001, 10005, 1001, 11);
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100003, 10001, 1007, 12);
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100002, 10002, 1002, 10);
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100002, 10002, 1002, 11);
insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100002, 10002, 1002, 12);

select * from booking_service_fk;

---------------------------------------------------------------------- TABELA DE FACTURI -----------------------------------------------------------------------------
insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(100001, TO_DATE('18.12.2024', 'DD.MM.YYYY'), 'numerar', 102, 10005, 1001);
insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(100002, TO_DATE('18.12.2024', 'DD.MM.YYYY'), 'numerar', 103, 10002, 1002);
insert into bill(reservation_id, payment_date, payment_method, card_number, employee_id, client_id, room_id)
VALUES(100004, TO_DATE('18.12.2024', 'DD.MM.YYYY'), 'card', 4111111111111111, 102, 10001, 1007);

select * from bill;