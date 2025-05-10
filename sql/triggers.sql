
DELIMITER //
CREATE TRIGGER update_seat_after_cancel
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    IF OLD.status = 'booked' AND NEW.status = 'cancelled' THEN
        UPDATE buses
        SET status = 'available'
        WHERE bus_id = (SELECT bus_id FROM schedule WHERE schedule_id = NEW.schedule_id);
    END IF;
END //
DELIMITER ;
