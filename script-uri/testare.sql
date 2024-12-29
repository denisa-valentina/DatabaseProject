--------------------------------------------------------- SCRIPT PENTRU TESTARE ---------------------------------------------------------



------------------------------------------------------------- TABELA ROOM ---------------------------------------------------------
------> CONSTRANGERI DE TIP NN
-- aceste campuri nu accepta NULL-uri in mod implicit
-- ===== room_number
INSERT INTO room (room_number, floor, capacity, price)
VALUES(NULL, 3, 3, 150);
--Error at Command Line : 10 Column : 8
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."ROOM"."ROOM_NUMBER")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== floor
INSERT INTO room (room_number, floor, capacity, price)
VALUES(203, NULL, 3, 150);
--Error at Command Line : 24 Column : 13
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."ROOM"."FLOOR")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== capacity
INSERT INTO room (room_number, floor, capacity, price)
VALUES(507, 5, NULL, 120);
--Error at Command Line : 14 Column : 16
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."ROOM"."CAPACITY")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== price
INSERT INTO room (room_number, floor, capacity, price)
VALUES(507, 5, 3, NULL);
--Error at Command Line : 42 Column : 19
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."ROOM"."PRICE")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.


-----> CONSTRANGERI DE TIP CK (apare eroare daca conditia nu este indeplinita)

-- ===== room_number
UPDATE room
    set room_number = 154
    where room_number = 103;
--Error report -
--ORA-02290: check constraint (BD001.ROOM_ROOM_NUMBER_CK) violated

-- ===== floor
-- OBS: check-ul pentru etaj (floor) nu poate fi verificat, fiindca exista un trigger care
-- se activeaza inainte in momentul in care camera nu apartine etajului (camerele 100-109 apartin etajului 1 etc.)
UPDATE room
    set floor = 0
    where room_number = 103;
--Error at Command Line : 59 Column : 8
--Error report -
--SQL Error: ORA-20001: Ati gresit etajul.
--ORA-06512: at "BD001.TRG_ROOM_FLOOR", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_ROOM_FLOOR'

-- ===== capacity 
UPDATE room
    set capacity = 6
    where room_number = 103;
--Error report -
--ORA-02290: check constraint (BD001.ROOM_CAPACITY_CK) violated

-- ===== price
INSERT INTO room (room_number, floor, capacity, price)
VALUES(307, 3, 7, 0);
--Error report -
--ORA-02290: check constraint (BD001.ROOM_PRICE_CK) violated


-----> CONSTRANGERI DE TIP UK
INSERT INTO room (room_number, floor, capacity, price)
VALUES(103, 1, 4, 250); -- camera 103 a fost deja introdusa in tabela
--Error report -
--ORA-00001: unique constraint (BD001.ROOM_UK) violated

------> CONSTRANGERI DE TIP PK

-- ===== room_id
alter table room
drop column room_id;
--Error report -
--ORA-12992: cannot drop parent key column
--12992. 00000 -  "cannot drop parent key column"
--*Cause:    An attempt was made to drop a parent key column.
--*Action:   Drop all constraints referencing the parent key column, or
--           specify CASCADE CONSTRAINTS in statement.

------------------------------------------------------------- TABELA CLIENT ---------------------------------------------------------

----> CONSTRANGERI DE TIP UK

-- ===== phone_number
INSERT INTO client (name, birth_date, phone_number, email)
VALUES('Ana Petrescu', TO_DATE('21.04.2000', 'DD.MM.YYYY'), '0724134891', 'ana_petrescu@gmail.com');
--Error report -
--ORA-00001: unique constraint (BD001.CLIENT_UK) violated

-----> CONSTRANGERI DE TIP NN

-- ===== phone_number
UPDATE client
    set phone_number = NULL
    where name like 'Ana Petrescu';
--Error at Command Line : 63 Column : 9
--Error report -
--SQL Error: ORA-01407: cannot update ("BD001"."CLIENT"."PHONE_NUMBER") to NULL
--01407. 00000 -  "cannot update (%s) to NULL"
--*Cause:    
--*Action:

-- ===== name
UPDATE client
    set name = NULL
    where name like 'Ana Petrescu';
--Error at Command Line : 129 Column : 9
--Error report -
--SQL Error: ORA-01407: cannot update ("BD001"."CLIENT"."NAME") to NULL
--01407. 00000 -  "cannot update (%s) to NULL"
--*Cause:    
--*Action:


-----> CONSTRANGERI DE TIP CK

-- ===== phone_number
UPDATE client
    set phone_number = '0avfrrg'
    where name like 'Ana Petrescu';
--Error report -
--ORA-02290: check constraint (BD001.CLIENT_PHONE_NUMBER_CK) violated

-- ===== name
UPDATE client
    set name = '0avfrrg'
    where name like 'Ana Petrescu';
--Error report -
--ORA-02290: check constraint (BD001.CLIENT_NAME_CK) violated

-- ===== email
UPDATE client
    set email = '0avfrrg'
    where name like 'Ana Petrescu';
--Error report -
--ORA-02290: check constraint (BD001.CLIENT_EMAIL_CK) violated

-------> constrangeri de tip PK

-- ===== client_id
alter table client
drop column client_id;
--Error report -
--ORA-12992: cannot drop parent key column
--12992. 00000 -  "cannot drop parent key column"
--*Cause:    An attempt was made to drop a parent key column.
--*Action:   Drop all constraints referencing the parent key column, or
--           specify CASCADE CONSTRAINTS in statement.

---------> testare trigger
update client
set birth_date = TO_DATE('1.01.2025', 'DD.MM.YYYY');
--SQL Error: ORA-20001: Data invalida : 01.01.2025 00:00:00 trebuie sa fie mai devreme decat data curenta.
--ORA-06512: at "BD001.TRG_CLIENT_BIRTH_DATE", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_CLIENT_BIRTH_DATE'

------------------------------------------------------------- TABELA EMPLOYEE ---------------------------------------------------------

-------> CONSTRANGERI DE TIP UK
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Istrate Diana', '0715463417', 'chelner', TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
--Error report -
--ORA-00001: unique constraint (BD001.EMPLOYEE_UK) violated

-------> CONSTRANGERI DE TIP CK

-- ===== phone_number
UPDATE employee
    set phone_number = '071546341a'
    where employee_id = 102;
--Error report -
--ORA-02290: check constraint (BD001.EMPLOYEE_PHONE_NUMBER_CK) violated

-- ===== name
UPDATE employee
    set name = '071546341a'
    where employee_id = 102;
--Error report -
--ORA-02290: check constraint (BD001.EMPLOYEE_NAME_CK) violated

-- ===== job
UPDATE employee
    set job = 'lala'
    where employee_id = 102;
--Error report -
--ORA-02290: check constraint (BD001.EMPLOYEE_JOB_CK) violated
    
-- ===== salary
UPDATE employee
    set salary = 0
    where employee_id = 102;
--Error report -
--ORA-02290: check constraint (BD001.EMPLOYEE_SALARY_CK) violated

------> CONSTRANGERI DE TIP NN

-- ===== phone_number
insert into employee(name, job, hire_date, salary)
VALUES('Istrate Diana', 'chelner', TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
--Error report -
--ORA-01400: cannot insert NULL into ("BD001"."EMPLOYEE"."PHONE_NUMBER")

-- ===== name
insert into employee(name, job, hire_date, salary)
VALUES(NULL, 'chelner', TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
--Error at Command Line : 204 Column : 8
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."EMPLOYEE"."NAME")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== job
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Istrate Diana', '0713592369', NULL, TO_DATE('21.04.2024', 'DD.MM.YYYY'), 3000);
--Error at Command Line : 214 Column : 39
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."EMPLOYEE"."JOB")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== hire_date
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Istrate Diana', '0713592369', 'chelner', NULL, 3000);
--Error at Command Line : 224 Column : 50
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."EMPLOYEE"."HIRE_DATE")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-- ===== salary
insert into employee(name, phone_number, job, hire_date, salary)
VALUES('Istrate Diana', '0713592369', 'chelner', TO_DATE('21.04.2024', 'DD.MM.YYYY'), NULL);
--Error at Command Line : 234 Column : 87
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."EMPLOYEE"."SALARY")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

-------> CONSTRANGERI DE TIP PK

-- ===== employee_id
alter table employee
drop column employee_id;
--Error report -
--ORA-12992: cannot drop parent key column
--12992. 00000 -  "cannot drop parent key column"
--*Cause:    An attempt was made to drop a parent key column.
--*Action:   Drop all constraints referencing the parent key column, or
--           specify CASCADE CONSTRAINTS in statement.

---------> testare trigger
update employee 
set hire_date = TO_DATE('1.01.2025', 'DD.MM.YYYY');
--Error report -
--SQL Error: ORA-20001: Data invalida : 01.01.2025 00:00:00 trebuie sa fie mai devreme decat data curenta.
--ORA-06512: at "BD001.TRG_EMPLOYEE_HIRE_DATE", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_EMPLOYEE_HIRE_DATE'

------------------------------------------------------------- TABELA SERVICE --------------------------------------------------------

-----> CONSTRANGERI DE TIP PK
-- ===== service_id
alter table service
drop column service_id;
--Error report -
--ORA-12992: cannot drop parent key column
--12992. 00000 -  "cannot drop parent key column"
--*Cause:    An attempt was made to drop a parent key column.
--*Action:   Drop all constraints referencing the parent key column, or
--           specify CASCADE CONSTRAINTS in statement.

------> CONSTRANGERI DE TIP UK
insert into service(service_name, price, description)
VALUES ('spa', 100, '07:00-18:00');
--Error starting at line : 174 in command -
--insert into service(service_name, price, description)
--VALUES ('spa', 100, '07:00-18:00')
--Error report -
--ORA-00001: unique constraint (BD001.SERVICE_UK) violated


------> CONSTRANGERI DE TIP CK
-- ===== service_name
insert into service(service_name, price, description)
VALUES ('patinoar', 100, '07:00-18:00');
--Error report -
--ORA-02290: check constraint (BD001.SERVICE_SERVICE_NAME_CK) violated

-- ===== price
update service
    set price = 0
where price = 100;
--Error report -
--ORA-02290: check constraint (BD001.SERVICE_PRICE_CK) violated

------> CONSTRANGERI DE TIP NN
-- ===== service_name
insert into service(price, description)
VALUES (100, '07:00-18:00');
--Error report -
--ORA-01400: cannot insert NULL into ("BD001"."SERVICE"."SERVICE_NAME")

-- ===== price
insert into service(service_name, price, description)
VALUES ('spa', NULL, '07:00-18:00');
--Error at Command Line : 306 Column : 16
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."SERVICE"."PRICE")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

------------------------------------------------------------- TABELA BOOKING --------------------------------------------------------

------> CONSTRANGERI DE TIP PK
-- ===== reservation_id
alter table booking
drop column reservation_id;
--Error report -
--ORA-12992: cannot drop parent key column
--12992. 00000 -  "cannot drop parent key column"
--*Cause:    An attempt was made to drop a parent key column.
--*Action:   Drop all constraints referencing the parent key column, or
--           specify CASCADE CONSTRAINTS in statement.

------> CONSTRANGERI DE TIP NN
update booking
set reservation_id = null
where reservation_id = 100001;
--Error at Command Line : 218 Column : 5
--Error report -
--SQL Error: ORA-01407: cannot update ("BD001"."BOOKING"."RESERVATION_ID") to NULL
--01407. 00000 -  "cannot update (%s) to NULL"
--*Cause:    
--*Action:

update booking
set check_in_date = null
where reservation_id = 100001;
--Error report -
--SQL Error: ORA-01407: cannot update ("BD001"."BOOKING"."CHECK_IN_DATE") to NULL
--01407. 00000 -  "cannot update (%s) to NULL"

update booking
set check_out_date = null
where reservation_id = 100001;
--Error report -
--SQL Error: ORA-01407: cannot update ("BD001"."BOOKING"."CHECK_OUT_DATE") to NULL
--01407. 00000 -  "cannot update (%s) to NULL"


-------> testare trigger
insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('22.12.2024', 'DD.MM.YYYY'), TO_DATE('28.12.2024', 'DD.MM.YYYY'), TO_DATE('8.12.2024', 'DD.MM.YYYY'), 10003, 1004);
--Error report -
--SQL Error: ORA-20001: Data invalida : 22.12.2024 00:00:00 trebuie sa fie dupa data curenta si dupa incheierea altor rezervari.
--ORA-06512: at "BD001.TRG_BOOKING_INSERT_CHECK_IN_DATE", line 12
--ORA-04088: error during execution of trigger 'BD001.TRG_BOOKING_INSERT_CHECK_IN_DATE'

update booking
set reservation_date = TO_DATE('25.12.2024', 'DD.MM.YYYY');
--SQL Error: ORA-20001: Data invalida : 01.01.2025 00:00:00 trebuie sa fie mai devreme decat data curenta si decat data de check-in.
--ORA-06512: at "BD001.TRG_BOOKING_RESERVATION_DATE", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_BOOKING_RESERVATION_DATE'

update booking
set check_out_date = TO_DATE('12.12.2024', 'DD.MM.YYYY');
--Error at Command Line : 377 Column : 8
--Error report -
--SQL Error: ORA-20001: Data invalida: 12.12.2024 00:00:00 trebuie sa fie mai dupa data de check-in, adica 01.01.2025 00:00:00
--ORA-06512: at "BD001.TRG_BOOKING_CHECK_OUT_DATE", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_BOOKING_CHECK_OUT_DATE'


------> CONSTRANGERI DE TIP FK
insert into booking (check_in_date, check_out_date, reservation_date, client_id, room_id)
VALUES(TO_DATE('22.12.2024', 'DD.MM.YYYY'), TO_DATE('28.12.2024', 'DD.MM.YYYY'), TO_DATE('8.12.2024', 'DD.MM.YYYY'), 10003, 1078);
--Error report -
--ORA-02291: integrity constraint (BD001.ROOM_BOOKING_FK) violated - parent key not found

update booking
set client_id = 10987;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

update booking
set room_id = 7777;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

------> CONSTRANGERI DE TIP CK
update booking
set status = 'altceva';
--Error report -
--ORA-02290: check constraint (BD001.SYS_C001813667) violated

update booking
set room_total_price = 0;
--Error report -
--ORA-02290: check constraint (BD001.BOOKING_ROOM_TOTAL_PRICE_CK) violated

update booking
set services_price = -1;
--Error report -
--ORA-02290: check constraint (BD001.BOOKING_SERVICES_PRICE_CK) violated

-------------------------------------------------------- TABELA BOOKING-SERVICE --------------------------------------------------------

-----------> CONSTRANGERI DE TIP FK
update booking_service_fk
set reservation_id = 109876;
--Error report -
--ORA-02291: integrity constraint (BD001.BOOKING_SERVICE_FK_BOOKING_FK) violated - parent key not found

insert into booking_service_fk(reservation_id, client_id, room_id, service_id)
VALUES(100050, 10005, 1001, 11);
--Error report -
--ORA-02291: integrity constraint (BD001.BOOKING_SERVICE_FK_BOOKING_FK) violated - parent key not found

update booking_service_fk
set client_id = 10987;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

update booking_service_fk
set room_id = 7777;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

-------------------------------------------------------- TABELA BILL --------------------------------------------------------

-----------> CONSTRANGERI DE TIP FK
update bill
set reservation_id = 247841;
--Error report -
--ORA-02291: integrity constraint (BD001.BOOKING_BILL_FK) violated - parent key not found

update bill
set client_id = 10987;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

update bill
set room_id = 7777;
--Error report -
--ORA-02292: integrity constraint (BD001.BOOKING_BILL_FK) violated - child record found

UPDATE bill
    set name = '071546341a'
    where employee_id = 102;

insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(180233, TO_DATE('7.12.2024', 'DD.MM.YYYY'), 'numerar', 103, 10001, 1007);
--Error report -
--ORA-02291: integrity constraint (BD001.BOOKING_BILL_FK) violated - parent key not found


--------> CONSTRANGERI DE TIP NN
insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(100001, TO_DATE('7.12.2024', 'DD.MM.YYYY'), 'numerar', 102, 10005, NULL);
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD001"."BILL"."ROOM_ID")
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.


------> CONSTRANGERI DE TIP UK
insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(100001, TO_DATE('7.12.2024', 'DD.MM.YYYY'), 'numerar', 103, 10005, 1001);
--Error report -
--ORA-00001: unique constraint (BD001.BILL__IDX) violated


------> testare trigger
insert into bill(reservation_id, payment_date, payment_method, employee_id, client_id, room_id)
VALUES(100003, TO_DATE('7.12.2024', 'DD.MM.YYYY'), 'numerar', 100, 10001, 1007);
--Error report -
--SQL Error: ORA-20001: Acest angajat nu se ocupa de plati, nefiind un receptioner.
--ORA-06512: at "BD001.TRG_BILL_EMPLOYEE_ID", line 9
--ORA-04088: error during execution of trigger 'BD001.TRG_BILL_EMPLOYEE_ID'

update bill
set payment_date = TO_DATE('25.12.2024', 'DD.MM.YYYY');
--Error report -
--SQL Error: ORA-20001: Data invalida : 25.12.2024 00:00:00 trebuie sa fie inainte de data curenta.
--ORA-06512: at "BD001.TRG_BILL_PAYMENT_DATE", line 4
--ORA-04088: error during execution of trigger 'BD001.TRG_BILL_PAYMENT_DATE'

-------> CONSTRANGERI DE TIP CK
update bill
set payment_method = 'altceva';
--Error report -
--ORA-02290: check constraint (BD001.BILL_PAYMENT_METHOD_CK) violated

update bill
set total_price = -1;
--Error report -
--ORA-02290: check constraint (BD001.BILL_TOTAL_PRICE_CK) violated
