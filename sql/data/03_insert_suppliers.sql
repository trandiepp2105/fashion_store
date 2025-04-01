USE fashion_store;

INSERT INTO Supplier (company_name, contact_person, email, phone_number, address, tax_id, website, status, started_at) 
VALUES 
('Fashion Supplier A', 'Tran Van A', 'supplierA@gmail.com', '0123456789', '123 Fashion St, City A', 'TAX123456', 'www.supplierA.com', 'active', NOW()),
('Fashion Supplier B', 'Nguyen Van B', 'supplierB@gmail.com', '0123456789', '456 Style Ave, City B', 'TAX654321', 'www.supplierB.com', 'active', NOW());
