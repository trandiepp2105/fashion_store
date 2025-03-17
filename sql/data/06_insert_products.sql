USE fashion_store;

-- STEP 1: Insert Products for leaf categories (categories without child categories)

INSERT INTO Product (supplier_id, name, description, price, created_at)
SELECT 
    (SELECT id FROM Supplier WHERE name = 'Fashion Supplier A' LIMIT 1) AS supplier_id,
    CONCAT(Category.name, ' Product') AS name,
    CONCAT('Product for ', Category.name) AS description,
    299000 AS price,
    NOW()
FROM Category
WHERE Category.id NOT IN (SELECT DISTINCT parent_id FROM Category WHERE parent_id IS NOT NULL);

-- STEP 2: Map each product to its corresponding leaf category

INSERT INTO ProductCategory (product_id, category_id)
SELECT 
    Product.id,
    Category.id
FROM Product
JOIN Category ON Product.name = CONCAT(Category.name, ' Product')
WHERE Category.id NOT IN (SELECT DISTINCT parent_id FROM Category WHERE parent_id IS NOT NULL);

-- STEP 3: Add product variants for each product
-- Each product has 3 colors (Red, Black, White) and 4 sizes (S, M, L, XL)

INSERT INTO ProductVariant (product_id, color, size, stock_quantity, price)
SELECT 
    Product.id,
    Color.color_name,
    Size.size_name,
    10, -- Example stock quantity for each variant
    Product.price
FROM Product
JOIN (
    SELECT 'Red' AS color_name UNION
    SELECT 'Black' UNION
    SELECT 'White'
) AS Color
JOIN (
    SELECT 'S' AS size_name UNION
    SELECT 'M' UNION
    SELECT 'L' UNION
    SELECT 'XL'
) AS Size;

-- STEP 4: Add main product image for each variant

INSERT INTO ProductImage (product_id, variant_id, url, is_main)
SELECT 
    ProductVariant.product_id,
    ProductVariant.id,
    CONCAT("https://resource-server/product-image/",Product.name, '_', ProductVariant.color, '_', ProductVariant.size, '.jpg'),
    TRUE
FROM ProductVariant
JOIN Product ON ProductVariant.product_id = Product.id;
