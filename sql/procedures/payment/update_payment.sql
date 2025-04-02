CREATE PROCEDURE UpdatePayment(
    IN payment_id INT,
    IN new_status ENUM('PENDING', 'PAID', 'FAILED', 'CANCELLED') DEFAULT NULL,
    IN new_paid_at DATETIME DEFAULT NULL
)
BEGIN
    UPDATE fashion_store.Payment
    SET 
        status = COALESCE(new_status, status),
        paid_at = COALESCE(new_paid_at, paid_at),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = payment_id;
END;
