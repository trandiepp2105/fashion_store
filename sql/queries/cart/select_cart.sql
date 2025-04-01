SELECT 
    CartItem.id AS cart_item_id,
    CartItem.quantity,
    CartItem.added_at,
    Product.name AS product_name,
    Product.description AS product_description,
    Product.original_price,
    Product.selling_price,
    Product.image_url AS product_image_url,
    Variant.color AS variant_color,
    Variant.size AS variant_size,
    ProductVariant.stock_quantity AS variant_stock_quantity,
    ProductVariant.image_url AS variant_image_url
FROM 
    fashion_store.CartItem
JOIN 
    fashion_store.Product ON CartItem.product_id = Product.id
LEFT JOIN 
    fashion_store.ProductVariant ON CartItem.variant_id = ProductVariant.id
LEFT JOIN 
    fashion_store.Variant ON ProductVariant.variant_id = Variant.id
WHERE 
    CartItem.user_id = ?;
