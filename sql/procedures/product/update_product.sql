
CREATE PROCEDURE UpdateProduct(
    IN prod_id INT,
    IN new_supplier_id INT,
    IN new_name VARCHAR(255),
    IN new_description TEXT,
    IN new_original_price INT,
    IN new_selling_price INT,
    IN new_total_rating INT,
    IN new_rating_sum INT,
    IN new_image_url VARCHAR(255)
)
BEGIN
    UPDATE Product
    SET
        supplier_id = COALESCE(new_supplier_id, supplier_id),
        name = COALESCE(new_name, name),
        description = COALESCE(new_description, description),
        original_price = COALESCE(new_original_price, original_price),
        selling_price = COALESCE(new_selling_price, selling_price),
        total_rating = COALESCE(new_total_rating, total_rating),
        rating_sum = COALESCE(new_rating_sum, rating_sum),
        image_url = COALESCE(new_image_url, image_url),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = prod_id;
END;
