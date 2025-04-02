SELECT 
    id,
    order_id,
    amount,
    method,
    status,
    paid_at,
    created_at
FROM fashion_store.Payment
WHERE order_id = COALESCE(?, order_id) AND status = COALESCE(?, status);
