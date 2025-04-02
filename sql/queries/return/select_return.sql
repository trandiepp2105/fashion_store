SELECT 
    id,
    order_id,
    total_refund,
    total_items,
    status,
    general_reason,
    created_at,
    processed_at
FROM fashion_store.OrderReturn
WHERE order_id = COALESCE(?, order_id) AND status = COALESCE(?, status);
