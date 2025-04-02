CREATE PROCEDURE UpdateOrderReturn(
    IN return_id INT,
    IN new_status ENUM('Pending', 'Completed', 'Refunded', 'Rejected') DEFAULT NULL,
    IN new_total_refund INT DEFAULT NULL,
    IN new_processed_at DATETIME DEFAULT NULL
)
BEGIN
    UPDATE fashion_store.OrderReturn
    SET 
        status = COALESCE(new_status, status),
        total_refund = COALESCE(new_total_refund, total_refund),
        processed_at = COALESCE(new_processed_at, processed_at),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = return_id;
END;
