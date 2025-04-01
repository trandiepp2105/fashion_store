CREATE PROCEDURE UpdateUserInfo(
    IN user_id INT,
    IN new_name VARCHAR(255) DEFAULT NULL,
    IN new_email VARCHAR(255) DEFAULT NULL,
    IN new_phone_number VARCHAR(20) DEFAULT NULL,
    IN new_password VARCHAR(255) DEFAULT NULL
)
BEGIN
    -- Update name if provided
    IF new_name IS NOT NULL THEN
        UPDATE fashion_store.User
        SET name = new_name
        WHERE id = user_id;
    END IF;

    -- Update email if provided
    IF new_email IS NOT NULL THEN
        UPDATE fashion_store.User
        SET email = new_email
        WHERE id = user_id;
    END IF;

    -- Update phone_number if provided
    IF new_phone_number IS NOT NULL THEN
        UPDATE fashion_store.User
        SET phone_number = new_phone_number
        WHERE id = user_id;
    END IF;

    -- Update password if provided
    IF new_password IS NOT NULL THEN
        UPDATE fashion_store.User
        SET password = new_password
        WHERE id = user_id;
    END IF;
END;
