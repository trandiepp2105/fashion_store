CREATE PROCEDURE CreateUserWithRole(
    IN user_name VARCHAR(255),
    IN user_email VARCHAR(255),
    IN user_password VARCHAR(255),
    IN user_phone_number VARCHAR(20),
    IN role_id INT
)
BEGIN
    -- Start transaction
    START TRANSACTION;

    -- Insert a new user
    INSERT INTO fashion_store.User (name, email, password, phone_number)
    VALUES (user_name, user_email, user_password, user_phone_number);

    -- Assign a role to the newly created user
    INSERT INTO fashion_store.UserRole (user_id, role_id)
    VALUES (LAST_INSERT_ID(), role_id);

    -- Commit transaction
    COMMIT;
END;
