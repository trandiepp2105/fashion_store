USE fashion_store;

CREATE TABLE Supplier (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL UNIQUE,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address TEXT,
    tax_id VARCHAR(20),
    website VARCHAR(255),
    status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
    started_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    parent_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    icon_url VARCHAR(255) DEFAULT 'https://resource-server/category-icon/default.png',
    FOREIGN KEY (parent_id) REFERENCES Category(id) ON DELETE SET NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    original_price INT,
    selling_price INT,
    total_rating INT DEFAULT 0,
    rating_sum INT DEFAULT 0,
    image_url VARCHAR(255) DEFAULT 'https://resource-server/product-image/default.jpg',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id) ON DELETE SET NULL
);

CREATE TABLE PoductRating (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
);

CREATE TABLE Variant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(20),
    size VARCHAR(20),
    UNIQUE (color, size)
);

CREATE TABLE ProductVariant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    variant_id INT,
    stock_quantity INT DEFAULT 0,
    image_url VARCHAR(255) DEFAULT 'https://resource-server/product-image/default_variant.jpg',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES Variant(id) ON DELETE CASCADE
);

CREATE TABLE ProductCategory (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Category(id) ON DELETE CASCADE
);
