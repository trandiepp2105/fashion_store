-- Query to fetch the user information by ID
SELECT * 
FROM fashion_store.User
WHERE id = ?;

-- Query to delete the user by ID
DELETE FROM fashion_store.User
WHERE id = ?;
