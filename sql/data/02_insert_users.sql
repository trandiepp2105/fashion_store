-- Insert Admin User
INSERT INTO User (name, email, password, phone_number, active) VALUES 
('Admin User', 'admin@gmail.com', 'hashed_password_admin', '0123456789', TRUE);

-- Insert Customer User
INSERT INTO User (name, email, password, phone_number, active) VALUES 
('Customer User', 'customer@gmail.com', 'hashed_password_customer', '0987654321', TRUE);
