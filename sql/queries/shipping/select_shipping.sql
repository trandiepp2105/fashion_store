SELECT 
    id,
    user_id,
    recipient_name,
    province_city,
    district,
    ward_commune,
    specific_address,
    phone_number,
    is_default,
    created_at,
    updated_at
FROM fashion_store.ShippingInfo
WHERE user_id = ? AND is_default = COALESCE(?, is_default);
