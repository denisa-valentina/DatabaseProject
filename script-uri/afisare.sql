------------------------------ SCRIPT PENTRU VIZUALIZAREA DATELOR DIN TABELE -------------------------


----- relatia ONE-TO-MANY dintre tabela Room si Booking
SELECT b.reservation_id, r.room_number, b.check_in_date, b.check_out_date,
         r.floor, r.capacity, b.reservation_date      
FROM room r, booking b
where b.room_id = r.room_id;

----- relatia ONE-TO-MANY dintre tabela Client si Booking
SELECT c.client_id, b.reservation_id, b.check_in_date, b.check_out_date
FROM client c, booking b
where c.client_id = b.client_id;

----- relatia ONE-TO-MANY dintre tabela Employee si Bill
SELECT b.reservation_id, e.employee_id
FROM employee e, bill b
where e.employee_id = b.employee_id;

----- relatia ONE-TO-ONE dintre Booking si Bill
SELECT book.reservation_id, bi.total_price, book.status, bi.payment_date, bi.payment_method 
FROM booking book, bill bi
where book.reservation_id = bi.reservation_id;


----- relatia MANY-TO-MANY dintre Booking si Service
SELECT b.reservation_id, b.reservation_date, s.service_name, s.price, s.description
FROM booking b, booking_service_fk bsf, service s
WHERE b.reservation_id = bsf.reservation_id and bsf.service_id = s.service_id;


-- USE CASE PENTRU SERVICES
select service_name,
    case
        when service_name = 'spa' then 'functioneaza pe timpul zilei'
        when service_name = 'restaurant' or service_name = 'fitness' then 'functioneaza toata ziua'
        when service_name = 'cazino' then 'functioneaza pe timpul noptii'
    end Program_de_functionare_servicii
from service;

-- USE CASE PENTRU ANGAJATI
select name,
    case
        when job = 'receptie' then 'lucreaza intre orele 8:00 si 18:00'
        when job = 'chelner' then 'lucreaza intre orele 5:00 si 23:00'
        when job = 'manager' then 'lucreaza intre orele 8:00 si 16:00'
        when job = 'instalator' then 'lucreaza intre orele 8:00 si 17:00'
        when job = 'menajer' then 'lucreaza intre orele 7:00 si 15:00'
    end as Program_de_lucru
from employee;