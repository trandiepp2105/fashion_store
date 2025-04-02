CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    -- Update the order status to CANCELLED
    UPDATE Orders
    SET status = 'CANCELLED'
    WHERE id = orderId;

    -- Create a new return record
    INSERT INTO OrderReturn (order_id, total_refund, total_items, status, general_reason)
    SELECT 
        id AS order_id,
        total_amount AS total_refund,
        (SELECT COUNT(*) FROM OrderItem WHERE order_id = Orders.id) AS total_items,
        'Pending' AS status,
        'Order cancelled by user' AS general_reason
    FROM Orders
    WHERE id = orderId;

    -- Get the newly created return ID
    SET @returnId = LAST_INSERT_ID();

    -- Insert return items
    INSERT INTO OrderItemReturn (order_return_id, order_item_id, quantity_returned, refund_amount, return_reason)
    SELECT 
        @returnId AS order_return_id,
        id AS order_item_id,
        quantity AS quantity_returned,
        (quantity * (SELECT price FROM ProductVariant WHERE id = variant_id)) AS refund_amount,
        'Order cancelled by user' AS return_reason
    FROM OrderItem
    WHERE order_id = orderId;
END;
