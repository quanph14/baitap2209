use demo;
ALTER TABLE products ADD INDEX idx_productCode(productCode);
EXPLAIN SELECT * FROM products WHERE productCode = 'A1';

alter table products add index idx_productPriceName(productName, productAmount);
EXPLAIN SELECT * FROM products WHERE productName = 'táo';

CREATE VIEW Product_View AS SELECT productCode, productName, productAmount, productStatus FROM Products;

DELIMITER //
Create procedure findAllProducts()
BEGIN
select * from products;
END //
DELIMITER ;

DELIMITER //
create procedure addProducts(in productCode varchar(45),in productName varchar(45),in productAmount varchar(45),in productStatus varchar(45))
begin
insert into products set productCode = productCode, productName = productName, productAmount = productAmount, productStatus = productStatus where Id = Id;
end //
DELIMITER ;

DELIMITER //
create procedure changeProducts(in Id int, in productName varchar(45))
begin
UPDATE products set productName = productName where Id = Id;
end //
DELIMITER ;

DELIMITER //
create procedure deleteProducts(in Id int)
begin
delete from products where Id = Id;
end //
DELIMITER ;
