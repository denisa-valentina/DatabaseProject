
------------------------------------------------------------- SCRIPT PENTRU ACTUALIZARE DE DATE ---------------------------------------------------------
----- NOTA: ACEST SCRIPT TREBUIE RULAT DUPA SCRIPT-UL INSERARE.SQL
------------------------------------------------------------- ACTUALIZARE TABELA BOOKING ---------------------------------------------------------


----- NOTA EXPLICATIVA: ACTUALIZAREA DATELOR DIN ENTITATEA BOOKING (CU UPDATE) SE VA FACE DUP? FIECARE DAT? CÂND AM GENERAT FACTURI NOI 
update booking
    set services_price = 0, status = 'derulare';

update booking
    SET services_price = (
    SELECT SUM(price)
    FROM service
    JOIN booking_service_fk ON booking_service_fk.service_id = service.service_id
    WHERE booking_service_fk.reservation_id = booking.reservation_id);

update booking
       set room_total_price = (check_out_date - check_in_date) * (select max(price) FROM room r WHERE r.room_id = room_id);

--- exemplul 1 de use-case
update booking
    set status = case
                    when reservation_id in (select reservation_id from bill) then 'onorata'
                    when reservation_id not in (select reservation_id from bill) and check_out_date < sysdate then 'anulata'
                    else 'derulare'
                end;
            

--update booking
--    set status = 'onorata'
--    where reservation_id in (select reservation_id from bill);
--    
--update booking
--    set status = 'anulata'
--    where reservation_id not in (select reservation_id from bill) and check_out_date < sysdate;
       
       
------------------------------------------------------------- ACTUALIZARE TABELA BILL ---------------------------------------------------------  
update bill
    set total_price = (select MAX(room_total_price) from Booking b where b.reservation_id = reservation_id) +
				    (select MAX(services_price) from Booking b where b.reservation_id = reservation_id)
    where reservation_id in (select reservation_id from booking);
    
SELECT * FROM room;
select * from client;
select * from employee;
select * from service;
select * from booking;
select * from booking_service_fk;
select * from bill;