INSERT INTO fashion_store.Coupon (code, description, type, value, min_order_value, discount_limit, start_date, end_date)
VALUES (
    'NEWCOUPON2023', -- Replace with your desired coupon code
    'Discount for new customers', -- Replace with your desired description
    'PERCENTAGE', -- Replace with 'FIXED' if needed
    20, -- Replace with your desired discount value
    100, -- Replace with your desired minimum order value
    50, -- Replace with your desired discount limit
    DATE_ADD(CURRENT_DATE, INTERVAL 5 DAY),
    DATE_ADD(DATE_ADD(CURRENT_DATE, INTERVAL 5 DAY), INTERVAL 1 MONTH)
);
