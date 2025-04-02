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
    -- Display supplier_id
    product_table.supplier_id AS supplier_id,
    -- Get only the smallest (leaf-level) categories
    (
        SELECT GROUP_CONCAT(subcategory.id ORDER BY subcategory.id ASC)
        FROM fashion_store.ProductCategory product_category_table
        INNER JOIN fashion_store.Category subcategory 
            ON product_category_table.category_id = subcategory.id
        WHERE product_category_table.product_id = product_table.id
          AND NOT EXISTS (
              SELECT 1
              FROM fashion_store.Category child_category
              WHERE child_category.parent_id = subcategory.id
          )
    ) AS leaf_categories
FROM fashion_store.Product product_table
WHERE product_table.id = ?
GROUP BY product_table.id;
