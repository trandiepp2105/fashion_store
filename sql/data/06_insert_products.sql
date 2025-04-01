USE fashion_store;

-- STEP 1: Insert Variants (Color & Size Combinations)
INSERT INTO Variant (color, size)
SELECT color, size
FROM (
    SELECT 'Red' AS color UNION
    SELECT 'Black' UNION
    SELECT 'White'
) AS Colors
CROSS JOIN (
    SELECT 'S' AS size UNION
    SELECT 'M' UNION
    SELECT 'L' UNION
    SELECT 'XL'
) AS Sizes;

-- STEP 2: Insert Products for leaf categories
INSERT INTO Product (supplier_id, name, description, original_price, selling_price, created_at)
SELECT 
    (SELECT id FROM Supplier WHERE company_name = 'Fashion Supplier A' LIMIT 1) AS supplier_id,
    CONCAT(Category.name, ' Product') AS name,
    CONCAT('Product for ', Category.name) AS description,
    299000 AS original_price,
    199000 AS selling_price,
    NOW()
FROM Category
WHERE Category.id NOT IN (SELECT DISTINCT parent_id FROM Category WHERE parent_id IS NOT NULL);

-- STEP 3: Map each product to its corresponding leaf category
INSERT INTO ProductCategory (product_id, category_id)
SELECT 
    Product.id,
    Category.id
FROM Product
JOIN Category ON Product.name = CONCAT(Category.name, ' Product')
WHERE Category.id NOT IN (SELECT DISTINCT parent_id FROM Category WHERE parent_id IS NOT NULL);

-- STEP 4: Assign Variants to Products
INSERT INTO ProductVariant (product_id, variant_id, stock_quantity)
SELECT 
    Product.id,
    Variant.id,
    10
FROM Product
CROSS JOIN Variant;