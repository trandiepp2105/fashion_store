USE fashion_store;

CREATE TABLE OrderReturn (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    total_refund INT,
    total_items INT,
    status ENUM('Pending', 'Completed', 'Refunded', 'Rejected'),
    general_reason TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    processed_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE
);

CREATE TABLE OrderItemReturn (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_return_id INT NOT NULL ,
    order_item_id INT,
    quantity_returned INT,
    refund_amount INT,
    return_reason TEXT,
    FOREIGN KEY (order_return_id) REFERENCES OrderReturn(id) ON DELETE CASCADE,
    FOREIGN KEY (order_item_id) REFERENCES OrderItem(id) ON DELETE CASCADE
);
