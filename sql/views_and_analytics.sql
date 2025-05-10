
CREATE VIEW revenue_by_date AS
SELECT DATE(payment_date) AS date, SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'completed'
GROUP BY DATE(payment_date);

CREATE VIEW passenger_count_by_route AS
SELECT r.from_city, r.to_city, COUNT(b.booking_id) AS total_passengers
FROM bookings b
JOIN schedule s ON b.schedule_id = s.schedule_id
JOIN routes r ON s.route_id = r.route_id
GROUP BY r.from_city, r.to_city;

CREATE VIEW active_buses_and_bookings AS
SELECT b.bus_no, r.from_city, r.to_city, COUNT(bo.booking_id) AS total_bookings
FROM buses b
JOIN schedule s ON b.bus_id = s.bus_id
JOIN routes r ON s.route_id = r.route_id
LEFT JOIN bookings bo ON s.schedule_id = bo.schedule_id AND bo.status = 'booked'
WHERE b.status = 'available'
GROUP BY b.bus_no, r.from_city, r.to_city;
