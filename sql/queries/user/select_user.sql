-- Query to fetch all users with their roles
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id;

-- Query to fetch detailed information of a user by user ID
SELECT 
    user_table.*, 
    order_table.id AS order_id, 
    order_table.total_amount, 
    order_table.status AS order_status, 
    shipping_info_table.recipient_name, 
    shipping_info_table.province_city, 
    shipping_info_table.district, 
    shipping_info_table.ward_commune, 
    shipping_info_table.specific_address, 
    shipping_info_table.phone_number AS shipping_phone_number
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.Orders order_table ON user_table.id = order_table.user_id
LEFT JOIN 
    fashion_store.ShippingInfo shipping_info_table ON user_table.id = shipping_info_table.user_id
WHERE 
    user_table.id = ?;

-- Query to filter users by name
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id
WHERE 
    user_table.name LIKE CONCAT('%', ?, '%');

-- Query to filter users by email
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id
WHERE 
    user_table.email LIKE CONCAT('%', ?, '%');

-- Query to filter users by phone number
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id
WHERE 
    user_table.phone_number LIKE CONCAT('%', ?, '%');

-- Query to filter users by status
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id
WHERE 
    user_table.active = ?;

-- Query to filter users by role name
SELECT 
    user_table.*, 
    role_table.name AS role_name
FROM 
    fashion_store.User user_table
LEFT JOIN 
    fashion_store.UserRole user_role_table ON user_table.id = user_role_table.user_id
LEFT JOIN 
    fashion_store.Role role_table ON user_role_table.role_id = role_table.id
WHERE 
    role_table.name LIKE CONCAT('%', ?, '%');
