
CREATE PROCEDURE add_product_variant(
    IN p_product_id INT,
    IN p_color VARCHAR(20),
    IN p_size VARCHAR(20),
    IN p_quantity INT,
    IN p_image_url VARCHAR(255)
)
BEGIN
    DECLARE v_variant_id INT;

    -- Check if the color and size combination exists in the Variant table
    SELECT id INTO v_variant_id
    FROM Variant
    WHERE color = p_color AND size = p_size;

    -- If the combination does not exist, insert it and get the new variant ID
    IF v_variant_id IS NULL THEN
        INSERT INTO Variant (color, size)
        VALUES (p_color, p_size);
        SET v_variant_id = LAST_INSERT_ID();
    END IF;

    -- Check if the product-variant combination already exists in ProductVariant
    IF NOT EXISTS (
        SELECT 1
        FROM ProductVariant
        WHERE product_id = p_product_id AND variant_id = v_variant_id
    ) THEN
        -- Insert the new product-variant combination
        INSERT INTO ProductVariant (product_id, variant_id, stock_quantity, image_url)
        VALUES (p_product_id, v_variant_id, p_quantity, p_image_url);
    END IF;
END;
