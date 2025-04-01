
CREATE PROCEDURE fashion_store.ChangeCartItemVariant(
    IN cart_item_id INT,
    IN new_variant_id INT
)
BEGIN
    DECLARE product_id INT;
    DECLARE valid_variant_count INT;

    -- Get the product ID of the cart item
    SELECT product_id INTO product_id
    FROM fashion_store.CartItem
    WHERE id = cart_item_id;

    -- Check if the new variant ID belongs to the same product
    SELECT COUNT(*) INTO valid_variant_count
    FROM fashion_store.ProductVariant
    WHERE id = new_variant_id AND product_id = product_id;

    -- If the new variant is valid, update the cart item
    IF valid_variant_count > 0 THEN
        UPDATE fashion_store.CartItem
        SET variant_id = new_variant_id
        WHERE id = cart_item_id;
    END IF;
END;
