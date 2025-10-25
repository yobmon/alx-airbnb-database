
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES 
('550e8400-e29b-41d4-a716-446655440001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', 'guest'),
('550e8400-e29b-41d4-a716-446655440002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', 'guest');

INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES
('550e8400-e29b-41d4-a716-446655440003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pw_3', 'host'),
('550e8400-e29b-41d4-a716-446655440004', 'David', 'Brown', 'david@example.com', 'hashed_pw_4', 'host');

INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES
('550e8400-e29b-41d4-a716-446655440005', 'Eve', 'Davis', 'eve@example.com', 'hashed_pw_5', 'admin');

INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 'Cozy Apartment', '2-bedroom apartment in downtown', 'New York', 120.00),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 'Beach House', 'Spacious house with ocean view', 'Miami', 250.00);
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '2025-11-01', '2025-11-05', 480.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '2025-12-10', '2025-12-15', 1250.00, 'pending');
SELECT * FROM users;
SELECT * FROM properties;
SELECT * FROM bookings;
SELECT * FROM payments;
SELECT * FROM reviews;
