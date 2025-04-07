-- Delete payment by id
DELETE FROM Payment
WHERE id = ?;

-- Delete payment by order_id
DELETE FROM Payment
WHERE order_id = ?;
