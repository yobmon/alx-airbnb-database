CREATE INDEX idx_firname ON User(first_name);
CREATE INDEX idx_price ON property(total_price);
CREATE INDEX idx_proprty ON property(name);
EXPLAIN ANALYZE SELECT * FROM "User" WHERE first_name = 'Alice';

EXPLAIN ANALYZE SELECT * FROM "booking" WHERE total_price = '300';


EXPLAIN ANALYZE SELECT * FROM "booking" WHERE name = 'coozy apartment';