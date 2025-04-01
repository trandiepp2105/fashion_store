USE fashion_store;

CREATE TABLE Coupon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) UNIQUE,
    description TEXT,
    type ENUM('PERCENTAGE', 'FIXED'),
    value INT,
    min_order_value INT,
    discount_limit INT,
    start_date DATETIME,
    end_date DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE OrderCoupon (
    order_id INT NOT NULL,
    coupon_id INT NOT NULL,
    PRIMARY KEY (order_id, coupon_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(id) ON DELETE CASCADE
);
