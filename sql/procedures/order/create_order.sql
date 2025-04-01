CREATE PROCEDURE CreateOrder(
    IN user_id INT,
    IN cart_item_ids JSON,
    OUT order_id INT
)
BEGIN
    DECLARE total_amount INT DEFAULT 0;
    DECLARE cart_item_id INT;
    DECLARE cart_item_count INT DEFAULT 0;
    DECLARE idx INT DEFAULT 0;

    -- Start transaction
    START TRANSACTION;

    -- Calculate total amount from cart items
    SET cart_item_count = JSON_LENGTH(cart_item_ids);
    WHILE idx < cart_item_count DO
        SET cart_item_id = JSON_EXTRACT(cart_item_ids, CONCAT('$[', idx, ']'));
        SET total_amount = total_amount + (
            SELECT ci.quantity * pv.selling_price
            FROM fashion_store.CartItem ci
            JOIN fashion_store.ProductVariant pv ON ci.variant_id = pv.id
            WHERE ci.id = cart_item_id
        );
        SET idx = idx + 1;
    END WHILE;

    -- Insert new order
    INSERT INTO fashion_store.Orders (user_id, total_amount, final_amount, status)
    VALUES (user_id, total_amount, total_amount, 'PENDING');
    SET order_id = LAST_INSERT_ID();

    -- Move cart items to order items
    SET idx = 0;
    WHILE idx < cart_item_count DO
        SET cart_item_id = JSON_EXTRACT(cart_item_ids, CONCAT('$[', idx, ']'));
        INSERT INTO fashion_store.OrderItem (order_id, product_id, variant_id, quantity)
        SELECT 
            order_id,
            ci.product_id,
            ci.variant_id,
            ci.quantity
        FROM fashion_store.CartItem ci
        WHERE ci.id = cart_item_id;

        -- Remove cart item after moving
        DELETE FROM fashion_store.CartItem WHERE id = cart_item_id;

        SET idx = idx + 1;
    END WHILE;

    -- Commit transaction
    COMMIT;
END;
