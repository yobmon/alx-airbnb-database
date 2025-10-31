 SELECT user_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;


SELECT
    property_id,
    name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number
FROM (
    SELECT
        p.property_id,
        p.name,
        COALESCE(COUNT(b.booking_id), 0) AS total_bookings
    FROM property p
    LEFT JOIN booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
) AS booking_counts
ORDER BY booking_rank;
