USE fashion_store;

-- Add parent category: Men
INSERT INTO Category (name, description) VALUES ('Men', 'Men Fashion');
SET @men_id = LAST_INSERT_ID();

-- Add subcategories for Men
INSERT INTO Category (parent_id, name, description) VALUES 
(@men_id, 'Tops & Shirts', 'Men Tops and Shirts'),
(@men_id, 'Pants & Bottoms', 'Men Pants and Bottoms'),
(@men_id, 'Footwear', 'Men Footwear'),
(@men_id, 'Accessories', 'Men Accessories');

-- Get subcategory IDs
SET @tops_id = @men_id + 1;
SET @bottoms_id = @men_id + 2;
SET @footwear_id = @men_id + 3;
SET @accessories_id = @men_id + 4;

-- Men Tops & Shirts
INSERT INTO Category (parent_id, name) VALUES
(@tops_id, 'T-Shirts'),
(@tops_id, 'Shirts'),
(@tops_id, 'Jackets'),
(@tops_id, 'Sweaters'),
(@tops_id, 'Blazers');

-- Men Pants & Bottoms
INSERT INTO Category (parent_id, name) VALUES
(@bottoms_id, 'Jeans'),
(@bottoms_id, 'Trousers'),
(@bottoms_id, 'Shorts'),
(@bottoms_id, 'Joggers');

-- Men Footwear
INSERT INTO Category (parent_id, name) VALUES
(@footwear_id, 'Sneakers'),
(@footwear_id, 'Dress Shoes'),
(@footwear_id, 'Sandals');

-- Men Accessories
INSERT INTO Category (parent_id, name) VALUES
(@accessories_id, 'Belts'),
(@accessories_id, 'Wallets'),
(@accessories_id, 'Hats'),
(@accessories_id, 'Sunglasses'),
(@accessories_id, 'Watches'),
(@accessories_id, 'Socks'),
(@accessories_id, 'Ties');


-- Add parent category: Women
INSERT INTO Category (name, description) VALUES ('Women', 'Women Fashion');
SET @women_id = LAST_INSERT_ID();

-- Add subcategories for Women
INSERT INTO Category (parent_id, name, description) VALUES 
(@women_id, 'Tops & Shirts', 'Women Tops and Shirts'),
(@women_id, 'Dresses & Skirts', 'Women Dresses and Skirts'),
(@women_id, 'Pants & Bottoms', 'Women Pants and Bottoms'),
(@women_id, 'Footwear', 'Women Footwear'),
(@women_id, 'Bags', 'Women Bags'),
(@women_id, 'Accessories', 'Women Accessories');

-- Get subcategory IDs
SET @w_tops_id = @women_id + 1;
SET @w_dresses_id = @women_id + 2;
SET @w_bottoms_id = @women_id + 3;
SET @w_footwear_id = @women_id + 4;
SET @w_accessories_id = @women_id + 6;

-- Women Tops & Shirts
INSERT INTO Category (parent_id, name) VALUES
(@w_tops_id, 'T-Shirts'),
(@w_tops_id, 'Shirts'),
(@w_tops_id, 'Jackets'),
(@w_tops_id, 'Sweaters'),
(@w_tops_id, 'Blouses');

-- Dresses & Skirts
INSERT INTO Category (parent_id, name) VALUES
(@w_dresses_id, 'Office Dresses'),
(@w_dresses_id, 'Casual Dresses'),
(@w_dresses_id, 'Skirts');

-- Women Pants & Bottoms
INSERT INTO Category (parent_id, name) VALUES
(@w_bottoms_id, 'Jeans'),
(@w_bottoms_id, 'Shorts'),
(@w_bottoms_id, 'Wide-Leg Pants'),
(@w_bottoms_id, 'Leggings');

-- Women Footwear
INSERT INTO Category (parent_id, name) VALUES
(@w_footwear_id, 'High Heels'),
(@w_footwear_id, 'Sneakers'),
(@w_footwear_id, 'Sandals'),
(@w_footwear_id, 'Boots');

-- Women Accessories
INSERT INTO Category (parent_id, name) VALUES
(@w_accessories_id, 'Hats'),
(@w_accessories_id, 'Sunglasses'),
(@w_accessories_id, 'Jewelry'),
(@w_accessories_id, 'Socks');

-------------------------------------------------

-- Add parent category: Unisex
INSERT INTO Category (name, description) VALUES ('Unisex', 'Unisex Fashion');
SET @unisex_id = LAST_INSERT_ID();

INSERT INTO Category (parent_id, name) VALUES
(@unisex_id, 'Unisex T-Shirts'),
(@unisex_id, 'Hoodies'),
(@unisex_id, 'Sweaters'),
(@unisex_id, 'Joggers'),
(@unisex_id, 'Shorts'),
(@unisex_id, 'Sneakers'),
(@unisex_id, 'Unisex Accessories');
