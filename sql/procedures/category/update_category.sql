
CREATE PROCEDURE UpdateCategory(
    IN cat_id INT,
    IN new_parent_id INT,
    IN new_name VARCHAR(255),
    IN new_description TEXT,
    IN new_icon_url VARCHAR(255)
)
BEGIN
    UPDATE Category
    SET
        parent_id = COALESCE(new_parent_id, parent_id),
        name = COALESCE(new_name, name),
        description = COALESCE(new_description, description),
        icon_url = COALESCE(new_icon_url, icon_url),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = cat_id;
END;
