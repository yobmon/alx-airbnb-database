SELECT s.first_name, y.booking_id
FROM "booking" y
INNER JOIN "User" s ON s.user_id = y.user_id;

SELECT p.name ,r.rating ,r.comment 
FROM "property" p 
LEFT JOIN "review" r 
ON p.property_id =r.property_id;


SELECT u.user_id,b.status 
FROM "User" u 
FULL OUTER JOIN "booking" b 
on u.user_id = b.user_id;