CREATE PROCEDURE UpdateShippingInfo(
    IN shipping_id INT,
    IN new_recipient_name VARCHAR(50) DEFAULT NULL,
    IN new_province_city VARCHAR(255) DEFAULT NULL,
    IN new_district VARCHAR(255) DEFAULT NULL,
    IN new_ward_commune VARCHAR(255) DEFAULT NULL,
    IN new_specific_address TEXT DEFAULT NULL,
    IN new_phone_number VARCHAR(20) DEFAULT NULL,
    IN new_is_default BOOLEAN DEFAULT NULL
)
BEGIN
    UPDATE fashion_store.ShippingInfo
    SET 
        recipient_name = COALESCE(new_recipient_name, recipient_name),
        province_city = COALESCE(new_province_city, province_city),
        district = COALESCE(new_district, district),
        ward_commune = COALESCE(new_ward_commune, ward_commune),
        specific_address = COALESCE(new_specific_address, specific_address),
        phone_number = COALESCE(new_phone_number, phone_number),
        is_default = COALESCE(new_is_default, is_default),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = shipping_id;
END;
