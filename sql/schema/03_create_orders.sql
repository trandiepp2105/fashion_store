CREATE TABLE CartItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES ProductVariant(id) ON DELETE CASCADE
);

CREATE TABLE Order (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount INT,
    final_amount INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Paid', 'Cancelled', 'Completed', 'Returned'),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE SET NULL
);

CREATE TABLE OrderItem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    variant_id INT,
    quantity INT,
    price INT,
    FOREIGN KEY (order_id) REFERENCES Order(id) ON DELETE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES ProductVariant(id) ON DELETE SET NULL
);

CREATE TABLE Payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    amount INT,
    method ENUM('CreditCard', 'Paypal', 'COD', 'BankTransfer'),
    status ENUM('Pending', 'Paid', 'Failed', 'Refunded'),
    paid_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Order(id) ON DELETE CASCADE
);
