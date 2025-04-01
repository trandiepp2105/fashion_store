USE fashion_store;

CREATE TABLE CartItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES fashion_store.User(id) ON DELETE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES fashion_store.ProductVariant(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES fashion_store.Product(id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    shipping_info_id INT,
    total_amount INT,
    final_amount INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING', 'PACKED', 'DELIVERING', 'DELIVERED', 'CANCELLED', 'RETURNED'),
    FOREIGN KEY (user_id) REFERENCES fashion_store.User(id) ON DELETE SET NULL,
    FOREIGN KEY (shipping_info_id) REFERENCES fashion_store.ShippingInfo(id) ON DELETE SET NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE OrderItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    variant_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES fashion_store.Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES fashion_store.ProductVariant(id) ON DELETE SET NULL,
    FOREIGN KEY (product_id) REFERENCES fashion_store.Product(id) ON DELETE CASCADE
);

CREATE TABLE Payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    amount INT,
    method ENUM('CREDIT CARD', 'CASH ON DELIVERY', 'BANK TRANSFER'),
    status ENUM('PENDING', 'PAID', 'FAILED', 'CANCELLED'),
    paid_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES fashion_store.Orders(id) ON DELETE CASCADE
);
