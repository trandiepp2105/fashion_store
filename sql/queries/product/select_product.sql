SELECT 
    product_table.id,
    product_table.name,
    product_table.description,
    product_table.original_price,
    product_table.selling_price,
    product_table.image_url,
    product_table.created_at,
    product_table.updated_at,
    -- Calculate rating as rating_sum / total_ratings
    CASE 
        WHEN product_table.total_rating > 0 THEN product_table.rating_sum / product_table.total_rating
        ELSE 0
    END AS rating,
    -- Calculate stock as the sum of stock_quantity from ProductVariant
    (
        SELECT COALESCE(SUM(product_variant_table.stock_quantity), 0)
        FROM fashion_store.ProductVariant product_variant_table
        WHERE product_variant_table.product_id = product_table.id
    ) AS stock,
    -- Display supplier_id instead of company_name
    product_table.supplier_id AS supplier_id
FROM fashion_store.Product product_table;
