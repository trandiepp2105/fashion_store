SELECT 
    product_variant_table.id,
    product_variant_table.product_id,
    product_variant_table.variant_id,
    variant_table.color,
    variant_table.size,
    product_variant_table.stock_quantity,
    product_variant_table.image_url,
    product_variant_table.created_at,
    product_variant_table.updated_at
FROM fashion_store.ProductVariant product_variant_table
LEFT JOIN fashion_store.Variant variant_table 
    ON product_variant_table.variant_id = variant_table.id
WHERE product_variant_table.product_id = ?;
