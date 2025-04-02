INSERT INTO fashion_store.ShippingInfo (
    user_id,             -- ID of the user
    recipient_name,      -- Name of the recipient
    province_city,       -- Province or city
    district,            -- District
    ward_commune,        -- Ward or commune
    specific_address,    -- Detailed address
    phone_number,        -- Phone number of the recipient
    is_default           -- Whether this is the default shipping address (true/false)
) VALUES (
    ?,                   -- Value for user_id
    ?,                   -- Value for recipient_name
    ?,                   -- Value for province_city
    ?,                   -- Value for district
    ?,                   -- Value for ward_commune
    ?,                   -- Value for specific_address
    ?,                   -- Value for phone_number
    ?                    -- Value for is_default
);
