-- Insert Order.Sql Query Placeholder
INSERT INTO fashion_store.Order (user_id, shipping_info_id, total_amount, final_amount, status)
VALUES (?, ?, ?, ?, 'PENDING');

-- Get the order_id of the newly created order 
SET @order_id = LAST_INSERT_ID();

-- Add items to the order
INSERT INTO OrderItem (order_id, product_id, variant_id, quantity)
VALUES 
  (@order_id, ?, ?, ?),
  (@order_id, ?, ?, ?),
  ...;