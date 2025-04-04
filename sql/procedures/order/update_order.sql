CREATE PROCEDURE UpdateOrder(
    IN order_id INT,
    IN new_shipping_info_id INT,
    IN new_total_amount INT,
    IN new_final_amount INT,
    IN new_status ENUM('PENDING', 'PACKED', 'DELIVERING', 'DELIVERED', 'CANCELLED', 'RETURNED')
)
BEGIN
    UPDATE fashion_store.Orders
    SET 
        shipping_info_id = COALESCE(new_shipping_info_id, shipping_info_id),
        total_amount = COALESCE(new_total_amount, total_amount),
        final_amount = COALESCE(new_final_amount, final_amount),
        status = COALESCE(new_status, status),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = new_order_id;
END;