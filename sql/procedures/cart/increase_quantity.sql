CREATE PROCEDURE fashion_store.IncreaseCartItemQuantity(
    IN cart_item_id INT
)
BEGIN
    DECLARE variant_id INT;
    DECLARE current_quantity INT;
    DECLARE variant_stock INT;

    -- Get the variant ID and current quantity of the cart item
    SELECT variant_id, quantity INTO variant_id, current_quantity
    FROM fashion_store.CartItem
    WHERE id = cart_item_id;

    -- Get the stock of the specific variant
    SELECT stock_quantity INTO variant_stock
    FROM fashion_store.ProductVariant
    WHERE id = variant_id;

    -- Check if the current quantity is less than the variant stock
    IF current_quantity < variant_stock THEN
        -- Increase the quantity by 1
        UPDATE fashion_store.CartItem
        SET quantity = quantity + 1
        WHERE id = cart_item_id;
    END IF;
END;

