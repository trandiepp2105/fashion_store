USE fashion_store;

CREATE TABLE Coupon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) UNIQUE,
    description TEXT,
    type ENUM('percent', 'fixed'),
    value INT,
    min_order_value INT,
    discount_limit INT,
    usage_limit INT,
    start_date DATETIME,
    end_date DATETIME
);

CREATE TABLE OrderCoupon (
    order_id INT NOT NULL,
    coupon_id INT NOT NULL,
    PRIMARY KEY (order_id, coupon_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(id) ON DELETE CASCADE
);
