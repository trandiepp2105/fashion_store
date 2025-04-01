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

-- Get subcategory IDs (Note: This method assumes contiguous IDs, might be fragile)
SET @men_tops_id = @men_id + 1;
SET @men_bottoms_id = @men_id + 2;
SET @men_footwear_id = @men_id + 3;
SET @men_accessories_id = @men_id + 4;

-- Men Tops & Shirts (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@men_tops_id, 'T-Shirts', 'Men Casual T-Shirts'),
(@men_tops_id, 'Shirts', 'Men Formal and Casual Shirts'),
(@men_tops_id, 'Jackets', 'Men Outerwear Jackets'),
(@men_tops_id, 'Sweaters', 'Men Knitwear and Sweaters'),
(@men_tops_id, 'Blazers', 'Men Blazers and Sport Coats');

-- Men Pants & Bottoms (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@men_bottoms_id, 'Jeans', 'Men Denim Jeans Collection'),
(@men_bottoms_id, 'Trousers', 'Men Formal and Casual Trousers'),
(@men_bottoms_id, 'Shorts', 'Men Casual Shorts'),
(@men_bottoms_id, 'Joggers', 'Men Athletic and Casual Joggers');

-- Men Footwear (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@men_footwear_id, 'Sneakers', 'Men Casual and Athletic Sneakers'),
(@men_footwear_id, 'Dress Shoes', 'Men Formal Dress Shoes'),
(@men_footwear_id, 'Sandals', 'Men Casual Sandals');

-- Men Accessories (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@men_accessories_id, 'Belts', 'Men Leather and Casual Belts'),
(@men_accessories_id, 'Wallets', 'Men Wallets and Cardholders'),
(@men_accessories_id, 'Hats', 'Men Hats and Caps'),
(@men_accessories_id, 'Sunglasses', 'Men Fashion Sunglasses'),
(@men_accessories_id, 'Watches', 'Men Wristwatches'),
(@men_accessories_id, 'Socks', 'Men Dress and Casual Socks'),
(@men_accessories_id, 'Ties', 'Men Neckties and Bow Ties');


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

-- Get subcategory IDs (Note: This method assumes contiguous IDs, might be fragile)
SET @w_tops_id = @women_id + 1;
SET @w_dresses_id = @women_id + 2;
SET @w_bottoms_id = @women_id + 3;
SET @w_footwear_id = @women_id + 4;
-- Assuming Bags is +5
SET @w_accessories_id = @women_id + 6;

-- Women Tops & Shirts (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@w_tops_id, 'T-Shirts', 'Women Casual T-Shirts'),
(@w_tops_id, 'Shirts', 'Women Formal and Casual Shirts'),
(@w_tops_id, 'Jackets', 'Women Outerwear Jackets'),
(@w_tops_id, 'Sweaters', 'Women Knitwear and Sweaters'),
(@w_tops_id, 'Blouses', 'Women Fashion Blouses');

-- Dresses & Skirts (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@w_dresses_id, 'Office Dresses', 'Women Dresses suitable for Work'),
(@w_dresses_id, 'Casual Dresses', 'Women Everyday Casual Dresses'),
(@w_dresses_id, 'Skirts', 'Women Fashion Skirts');

-- Women Pants & Bottoms (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@w_bottoms_id, 'Jeans', 'Women Denim Jeans Collection'),
(@w_bottoms_id, 'Shorts', 'Women Casual Shorts'),
(@w_bottoms_id, 'Wide-Leg Pants', 'Women Trendy Wide-Leg Pants'),
(@w_bottoms_id, 'Leggings', 'Women Leggings and Jeggings');

-- Women Footwear (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@w_footwear_id, 'High Heels', 'Women High-Heeled Shoes'),
(@w_footwear_id, 'Sneakers', 'Women Casual and Athletic Sneakers'),
(@w_footwear_id, 'Sandals', 'Women Casual and Dress Sandals'),
(@w_footwear_id, 'Boots', 'Women Ankle and Knee-High Boots');

-- Women Accessories (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@w_accessories_id, 'Hats', 'Women Hats and Headwear'),
(@w_accessories_id, 'Sunglasses', 'Women Fashion Sunglasses'),
(@w_accessories_id, 'Jewelry', 'Women Fashion Jewelry Collection'),
(@w_accessories_id, 'Socks', 'Women Casual and Novelty Socks');


-- Add parent category: Unisex
INSERT INTO Category (name, description) VALUES ('Unisex', 'Unisex Fashion');
SET @unisex_id = LAST_INSERT_ID();

-- Add subcategories for Unisex (Added descriptions)
INSERT INTO Category (parent_id, name, description) VALUES
(@unisex_id, 'Unisex T-Shirts', 'T-Shirts designed for all genders'),
(@unisex_id, 'Hoodies', 'Hoodies suitable for all genders'),
(@unisex_id, 'Sweaters', 'Sweaters suitable for all genders'),
(@unisex_id, 'Joggers', 'Joggers suitable for all genders'),
(@unisex_id, 'Shorts', 'Shorts suitable for all genders'),
(@unisex_id, 'Sneakers', 'Sneakers suitable for all genders'),
(@unisex_id, 'Unisex Accessories', 'Accessories suitable for all genders (e.g., beanies, scarves)');

-- =============================================
-- Add parent category: Kids
-- =============================================
INSERT INTO Category (name, description) VALUES ('Kids', 'Kids Fashion and Apparel');
SET @kids_id = LAST_INSERT_ID(); -- Get the ID of the 'Kids' category just created

-- =============================================
-- Add first-level subcategories for Kids
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES 
(@kids_id, 'Boys', 'Boys Clothing and Accessories (Ages 4+)'),         -- Boys clothing and accessories (ages 4+)
(@kids_id, 'Girls', 'Girls Clothing and Accessories (Ages 4+)'),       -- Girls clothing and accessories (ages 4+)
(@kids_id, 'Baby & Toddler', 'Apparel for Babies and Toddlers (0-4 Years)'), -- Apparel for babies and toddlers (0-4 years)
(@kids_id, 'Kids Footwear', 'Shoes and Footwear for all Kids'),        -- General kids footwear
(@kids_id, 'Kids Accessories', 'Accessories for all Kids');           -- General kids accessories

-- =============================================
-- Get first-level subcategory IDs 
-- Note: This method of retrieving IDs (@kids_id + N) assumes IDs are generated sequentially.
-- This method may not be reliable in environments with high concurrent write activity.
-- =============================================
SET @boys_id = @kids_id + 1;
SET @girls_id = @kids_id + 2;
SET @baby_toddler_id = @kids_id + 3;
SET @kids_footwear_id = @kids_id + 4;
SET @kids_accessories_id = @kids_id + 5;

-- =============================================
-- Add subcategories for Boys (Ages 4+)
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES
(@boys_id, 'Tops & T-Shirts', 'T-Shirts, Polos, and Tops for Boys'),
(@boys_id, 'Shirts', 'Casual and Formal Shirts for Boys'),
(@boys_id, 'Hoodies & Sweatshirts', 'Boys Hoodies and Sweatshirts'),
(@boys_id, 'Pants & Jeans', 'Trousers, Jeans, and Pants for Boys'),
(@boys_id, 'Shorts', 'Casual and Athletic Shorts for Boys'),
(@boys_id, 'Outerwear', 'Jackets and Coats for Boys'),
(@boys_id, 'Swimwear', 'Boys Swim Trunks and Rashguards');

-- =============================================
-- Add subcategories for Girls (Ages 4+)
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES
(@girls_id, 'Tops & T-Shirts', 'T-Shirts, Blouses, and Tops for Girls'),
(@girls_id, 'Dresses', 'Casual and Party Dresses for Girls'),
(@girls_id, 'Skirts', 'Fashion Skirts for Girls'),
(@girls_id, 'Hoodies & Sweatshirts', 'Girls Hoodies and Sweatshirts'),
(@girls_id, 'Pants & Leggings', 'Trousers, Leggings, and Pants for Girls'),
(@girls_id, 'Shorts', 'Casual Shorts and Skorts for Girls'),
(@girls_id, 'Outerwear', 'Jackets and Coats for Girls'),
(@girls_id, 'Swimwear', 'Girls Swimsuits and Cover-ups');

-- =============================================
-- Add subcategories for Baby & Toddler (0-4 Years)
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES
(@baby_toddler_id, 'Bodysuits & Onesies', 'Essential Bodysuits for Babies (0-24m)'),
(@baby_toddler_id, 'Sets', 'Coordinated Clothing Sets for Babies and Toddlers'),
(@baby_toddler_id, 'Tops', 'Baby and Toddler Tops'),
(@baby_toddler_id, 'Bottoms', 'Baby and Toddler Pants, Leggings, Shorts'),
(@baby_toddler_id, 'Dresses & Rompers', 'Baby Dresses and All-in-One Rompers'),
(@baby_toddler_id, 'Sleepwear', 'Pajamas and Sleep Sacks for Babies/Toddlers'),
(@baby_toddler_id, 'Outerwear', 'Baby Jackets, Pramsuits, Snowsuits');

-- =============================================
-- Add subcategories for Kids Footwear
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES
(@kids_footwear_id, 'Sneakers', 'Casual and Athletic Sneakers for Kids'),
(@kids_footwear_id, 'Sandals', 'Summer Sandals and Flip-flops for Kids'),
(@kids_footwear_id, 'Boots', 'Winter and Rain Boots for Kids'),
(@kids_footwear_id, 'School Shoes', 'Shoes suitable for School Uniforms'),
(@kids_footwear_id, 'Baby Shoes', 'Soft-soled and First Walker Shoes (0-24m)');

-- =============================================
-- Add subcategories for Kids Accessories
-- =============================================
INSERT INTO Category (parent_id, name, description) VALUES
(@kids_accessories_id, 'Hats & Caps', 'Sun Hats, Beanies, Caps for Kids'),
(@kids_accessories_id, 'Socks & Tights', 'Socks and Tights for Boys and Girls'),
(@kids_accessories_id, 'Belts', 'Belts for Kids Trousers and Jeans'),
(@kids_accessories_id, 'Hair Accessories', 'Hairbands, Clips, Bows for Girls'),
(@kids_accessories_id, 'Bags', 'Backpacks and Small Bags for Kids'),
(@kids_accessories_id, 'Bibs & Muslins', 'Essential Bibs for Babies');