EXPLAIN ANALYZE
SELECT 
    b.*,
    u.first_name,
    u.last_name,
    u.email,
    u.phonenumber,
    p.name,
    p.description,
    p.location
FROM "booking" b
LEFT JOIN "User" u
    ON u.user_id = b.user_id
LEFT JOIN "property" p
    ON p.property_id = b.property_id
WHERE 
    b.user_id IN (SELECT user_id FROM "User" WHERE email IS NOT NULL)
    AND b.property_id IN (SELECT property_id FROM "property")
    AND (
        b.status = b.status
        OR u.email LIKE '%@%'
    )
ORDER BY 
    RANDOM();





EXPLAIN ANALYZE
SELECT b.*,u.first_name,u.last_name,u.email,u.phonenumber,p.name,p.description,p.location
FROM "booking" b 
LEFT JOIN "User" u
ON u.user_id = b.user_id  
LEFT JOIN "property" p
ON p.property_id = b.property_id; 