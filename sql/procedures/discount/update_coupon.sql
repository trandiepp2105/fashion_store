
CREATE PROCEDURE UpdateCoupon(
    IN new_coupon_id INT,
    IN new_code VARCHAR(50),
    IN new_description TEXT,
    IN new_type ENUM('PERCENTAGE', 'FIXED'),
    IN new_value INT,
    IN new_min_order_value INT,
    IN new_discount_limit INT,
    IN new_start_date DATETIME,
    IN new_end_date DATETIME
)
BEGIN
    UPDATE Coupon
    SET 
        code = COALESCE(new_code, code),
        description = COALESCE(new_description, description),
        type = COALESCE(new_type, type),
        value = COALESCE(new_value, value),
        min_order_value = COALESCE(new_min_order_value, min_order_value),
        discount_limit = COALESCE(new_discount_limit, discount_limit),
        start_date = COALESCE(new_start_date, start_date),
        end_date = COALESCE(new_end_date, end_date),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = new_coupon_id;
END;
