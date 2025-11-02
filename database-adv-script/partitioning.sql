CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price NUMERIC(10,2),
    status VARCHAR(50),
    CONSTRAINT booking_date_check CHECK (start_date IS NOT NULL)
) PARTITION BY RANGE (start_date);



CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_future PARTITION OF booking
    DEFAULT;

INSERT INTO booking
SELECT * FROM booking_old;

CREATE INDEX idx_booking_2024_user_id ON booking_2024(user_id);
CREATE INDEX idx_booking_2025_user_id ON booking_2025(user_id);
CREATE INDEX idx_booking_2024_property_id ON booking_2024(property_id);
CREATE INDEX idx_booking_2025_property_id ON booking_2025(property_id);