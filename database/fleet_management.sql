-- Database: fleet_management
CREATE DATABASE IF NOT EXISTS fleet_management;
USE fleet_management;

-- Users Table (for Admins and Drivers)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'driver') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Buses Table
CREATE TABLE IF NOT EXISTS buses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bus_number VARCHAR(20) NOT NULL UNIQUE,
    bus_model VARCHAR(50),
    capacity INT,
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Drivers Table
CREATE TABLE IF NOT EXISTS drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Routes Table
CREATE TABLE IF NOT EXISTS routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    route_name VARCHAR(50) NOT NULL,
    origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bus Assignments Table (to assign buses to specific routes and drivers)
CREATE TABLE IF NOT EXISTS bus_assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bus_id INT NOT NULL,
    driver_id INT NOT NULL,
    route_id INT NOT NULL,
    assignment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (bus_id) REFERENCES buses(id) ON DELETE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES drivers(id) ON DELETE CASCADE,
    FOREIGN KEY (route_id) REFERENCES routes(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Leave Table (for Drivers' Leave Management)
CREATE TABLE IF NOT EXISTS driver_leaves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    leave_date DATE NOT NULL,
    reason VARCHAR(255),
    status ENUM('pending', 'approved', 'denied') DEFAULT 'pending',
    FOREIGN KEY (driver_id) REFERENCES drivers(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data for testing
-- Admin User
INSERT INTO users (username, password, role) VALUES
('admin', MD5('admin123'), 'admin'); -- Note: In production, use a more secure password hashing method.

-- Sample Driver User
INSERT INTO users (username, password, role) VALUES
('driver1', MD5('driver123'), 'driver');

-- Sample Drivers
INSERT INTO drivers (user_id, name, license_number, phone, address) VALUES
(2, 'John Doe', 'DL123456', '1234567890', '123 Elm Street, Cityville');

-- Sample Buses
INSERT INTO buses (bus_number, bus_model, capacity) VALUES
('BUS001', 'Model X', 40),
('BUS002', 'Model Y', 35);

-- Sample Routes
INSERT INTO routes (route_name, origin, destination, departure_time, arrival_time) VALUES
('Route 1', 'City A', 'City B', '08:00:00', '10:00:00'),
('Route 2', 'City B', 'City C', '12:00:00', '14:00:00');

-- Sample Assignments
INSERT INTO bus_assignments (bus_id, driver_id, route_id) VALUES
(1, 1, 1),
(2, 1, 2);
