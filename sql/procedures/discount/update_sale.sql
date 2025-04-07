
CREATE PROCEDURE UpdateSale(
    IN new_sale_id INT,
    IN new_name VARCHAR(255),
    IN new_description TEXT,
    IN new_type ENUM('PERCENTAGE', 'FIXED'),
    IN new_value INT,
    IN new_start_date DATETIME,
    IN new_end_date DATETIME
)
BEGIN
    UPDATE Sale
    SET 
        name = COALESCE(new_name, name),
        description = COALESCE(new_description, description),
        type = COALESCE(new_type, type),
        value = COALESCE(new_value, value),
        start_date = COALESCE(new_start_date, start_date),
        end_date = COALESCE(new_end_date, end_date),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = new_sale_id;
END;

-- Call
CALL UpdateSale(
    ?, -- sale_id
    ?, -- name
    ?, -- description
    ?, -- type
    ?, -- value (?% off)
    ?, -- start_date
    ?  -- end_date
);