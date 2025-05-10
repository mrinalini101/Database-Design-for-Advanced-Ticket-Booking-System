
SELECT * FROM buses b
JOIN schedule s ON b.bus_id = s.bus_id
JOIN routes r ON s.route_id = r.route_id
WHERE r.from_city = 'Delhi' AND r.to_city = 'Jaipur' AND b.status = 'available';

SELECT * FROM bookings b
JOIN schedule s ON b.schedule_id = s.schedule_id
WHERE b.user_id = 1 AND b.status = 'booked';

SELECT * FROM revenue_by_date
WHERE date = '2025-05-01';

SELECT * FROM passenger_count_by_route;

SELECT * FROM active_buses_and_bookings;
