CREATE PROCEDURE UpdateSupplier(
    IN supplier_id INT,
    IN new_company_name VARCHAR(255) DEFAULT NULL,
    IN new_contact_person VARCHAR(255) DEFAULT NULL,
    IN new_email VARCHAR(255) DEFAULT NULL,
    IN new_phone_number VARCHAR(20) DEFAULT NULL,
    IN new_address TEXT DEFAULT NULL,
    IN new_tax_id VARCHAR(20) DEFAULT NULL,
    IN new_website VARCHAR(255) DEFAULT NULL,
    IN new_status ENUM('ACTIVE', 'INACTIVE') DEFAULT NULL
)
BEGIN
    UPDATE fashion_store.Supplier
    SET 
        company_name = COALESCE(new_company_name, company_name),
        contact_person = COALESCE(new_contact_person, contact_person),
        email = COALESCE(new_email, email),
        phone_number = COALESCE(new_phone_number, phone_number),
        address = COALESCE(new_address, address),
        tax_id = COALESCE(new_tax_id, tax_id),
        website = COALESCE(new_website, website),
        status = COALESCE(new_status, status),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = supplier_id;
END;
