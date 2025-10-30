SELECT name
FROM property
WHERE property_id IN (
    SELECT property_id  
    FROM review  
    WHERE rating > 4
);
SELECT first_name 
FROM "User"
 WHERE user_id IN (SELECT user_id FROM "booking");
