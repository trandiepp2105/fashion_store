-- Assign Admin Role to Admin User
INSERT INTO UserRole (user_id, role_id) 
VALUES (
    (SELECT id FROM User WHERE email = 'admin@gmail.com'),
    (SELECT id FROM Role WHERE name = 'admin')
);

-- Assign Customer Role to Customer User
INSERT INTO UserRole (user_id, role_id) 
VALUES (
    (SELECT id FROM User WHERE email = 'customer@gmail.com'),
    (SELECT id FROM Role WHERE name = 'customer')
);
