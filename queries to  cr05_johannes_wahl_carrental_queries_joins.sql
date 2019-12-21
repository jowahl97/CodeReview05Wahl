SELECT * from client where client.MEMBERSHIP_TYPE = 'B';
Select booking_details.BOOKING_ID, booking_details.DL_NUM from booking_details;
Select client.PLZ from client where client.PLZ = 2604;
select client.Client_ID, client.LNAME, client.PLZ, city.City from client inner join city on client.PLZ = city.PLZ;
SELECT car.REGISTRATION_NUMBER, booking_details.BOOKING_ID FROM booking_details RIGHT JOIN car on booking_details.REG_NUM =  car.REGISTRATION_NUMBER;