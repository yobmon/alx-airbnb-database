 SELECT user_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;



SELECT 
    p.property_id,
    p.name,
    COALESCE(COUNT(b.booking_id), 0) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
