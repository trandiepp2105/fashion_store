
CREATE PROCEDURE AddProductRating(
    IN p_product_id INT,
    IN p_user_id INT,
    IN p_rating INT
)
BEGIN
    -- Add new rating
    INSERT INTO ProductRating(product_id, user_id, rating)
    VALUES (p_product_id, p_user_id, p_rating);

    -- Update rating in Product table
    UPDATE Product
    SET 
        total_rating = total_rating + 1,
        rating_sum = rating_sum + p_rating,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_product_id;
END;
