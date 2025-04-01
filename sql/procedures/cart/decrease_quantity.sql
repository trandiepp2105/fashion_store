CREATE PROCEDURE fashion_store.DecreaseCartItemQuantity(
    IN cart_item_id INT
)
BEGIN
    DECLARE current_quantity INT;

    -- Get the current quantity of the cart item
    SELECT quantity INTO current_quantity
    FROM fashion_store.CartItem
    WHERE id = cart_item_id;

    -- Check if the current quantity is greater than 0
    IF current_quantity > 0 THEN
        -- Decrease the quantity by 1
        UPDATE fashion_store.CartItem
        SET quantity = quantity - 1
        WHERE id = cart_item_id;
    END IF;
END;
