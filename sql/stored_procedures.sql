
DELIMITER //
CREATE PROCEDURE BookSeat(IN user_id INT, IN schedule_id INT, IN seat_no INT)
BEGIN
    DECLARE available_seats INT;
    
    SELECT COUNT(*) INTO available_seats
    FROM bookings
    WHERE schedule_id = schedule_id AND seat_no = seat_no AND status = 'booked';

    IF available_seats = 0 THEN
        INSERT INTO bookings (user_id, schedule_id, seat_no, status)
        VALUES (user_id, schedule_id, seat_no, 'booked');
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Seat is already booked';
    END IF;
END //
DELIMITER ;
