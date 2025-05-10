
-- Database: bus_reservation_system
CREATE DATABASE IF NOT EXISTS bus_reservation_system;
USE bus_reservation_system;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    type ENUM('passenger', 'admin') NOT NULL
);

CREATE TABLE buses (
    bus_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_no VARCHAR(20) NOT NULL,
    status ENUM('available', 'in_service', 'maintenance', 'cancelled') NOT NULL
);

CREATE TABLE routes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    from_city VARCHAR(100) NOT NULL,
    to_city VARCHAR(100) NOT NULL,
    distance INT NOT NULL
);

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_id INT,
    route_id INT,
    date DATE NOT NULL,
    departure TIME NOT NULL,
    arrival TIME NOT NULL,
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    schedule_id INT,
    seat_no INT NOT NULL,
    status ENUM('booked', 'cancelled') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_status ENUM('pending', 'completed', 'failed') NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bus_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id)
);

CREATE TABLE alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_id INT,
    message TEXT,
    alert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id)
);
