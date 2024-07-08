CREATE TABLE Roles (
    RoleId BIGSERIAL PRIMARY KEY,
    RoleName VARCHAR(10) UNIQUE NOT NULL
);

-- Insert roles
INSERT INTO Roles (RoleName) VALUES ('admin'), ('buyer'), ('seller');

CREATE TABLE Users (
    UserId BIGSERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    RoleId BIGINT NOT NULL,
   -- UserAddress VARCHAR(255) NOT NULL,
   -- UserCity VARCHAR(100) NOT NULL,
   -- UserState VARCHAR(100) NOT NULL,
   -- UserPincode VARCHAR(20) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);

ALTER TABLE Users
    DROP COLUMN UserAddress,
    DROP COLUMN UserCity,
    DROP COLUMN UserState,
    DROP COLUMN UserPincode;

CREATE TABLE ProductTypes (
    ProductTypeId BIGSERIAL PRIMARY KEY,
    ProductTypeName VARCHAR(20) UNIQUE NOT NULL
);

-- Insert product types
INSERT INTO ProductTypes (ProductTypeName) VALUES ('fruits'), ('vegetables'), ('dairy');


CREATE TABLE Products (
    ProductId BIGSERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription TEXT,
	BuyingPrice DECIMAL(10, 2) NOT NULL,
    SellingPrice DECIMAL(10, 2) NOT NULL,
    -- ProductPrice DECIMAL(10, 2) NOT NULL,
    ProductTypeId BIGINT NOT NULL,
    ProductMeasureType VARCHAR(10) NOT NULL,
    ProductImage VARCHAR(255),
    MaxQuantity INT NOT NULL,
    AvailableQuantity INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	IsAvailable BOOLEAN DEFAULT TRUE,
	IsNeeded BOOLEAN DEFAULT TRUE,
    IsDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ProductTypeId) REFERENCES ProductTypes(ProductTypeId)
);

INSERT INTO Products (ProductName, ProductDescription, BuyingPrice, SellingPrice, ProductTypeId, ProductMeasureType, ProductImage, MaxQuantity, AvailableQuantity, IsAvailable)
VALUES
('Organic Apples', 'Fresh and juicy organic apples from local farms.', 108, 120, 1, 'kg', 'https://www.shimlafarms.com/cdn/shop/products/Redapple3.png?v=1675785288&width=1445', 0, 500, TRUE),
('Fresh Carrots', 'Crisp and sweet carrots grown with love.', 81, 90, 2, 'kg', 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/usa-new-york-city-carrots-for-sale-tetra-images.jpg', 0, 500, TRUE),
('Dairy Milk', 'Pure and fresh milk from grass-fed cows.', 45, 50, 3, 'L', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLbH-mTn8P736RPcSHkV16rhLF1vZvStQMg&s', 0, 500, TRUE),
('Fresh Strawberries', 'Sweet and juicy strawberries freshly picked.', 135, 150, 1, 'kg', 'https://d3fwccq2bzlel7.cloudfront.net/Pictures/480xany/5/8/8/35588_2_1203853_e.jpg', 0, 500, TRUE),
('Organic Broccoli', 'Healthy and fresh organic broccoli.', 72, 80, 2, 'kg', 'https://s.alicdn.com/@sc04/kf/A4f577b2659534d3292fd568d359d9cc5j.jpg_300x300.jpg', 0, 500, TRUE),
('Fresh Oranges', 'Fresh and juicy oranges.', 180, 200, 1, 'kg', 'https://tacomaboys.com/wp-content/uploads/2020/04/TB-27-8701-1024x588.jpg', 0, 500, TRUE),
('Organic Tomatoes', 'Ripe and juicy organic tomatoes.', 63, 70, 2, 'kg', 'https://i.cdn.newsbytesapp.com/images/l29720230821154142.jpeg', 0, 500, TRUE),
('Fresh Spinach', 'Leafy green spinach, rich in nutrients.', 54, 60, 2, 'kg', 'https://www.bigbasket.com/media/uploads/p/xxl/40200226_1-farmogo-spinach-hydroponically-grown.jpg', 0, 500, TRUE),
('Grapes', 'Sweet and juicy organic grapes.', 126, 140, 1, 'kg', 'https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg', 0, 500, TRUE);

DROP TABLE products
DROP TABLE Marketplaces

update Marketplaces set MarketImageUrl='https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/d3/c2/93/popular-market.jpg?w=1200&h=-1&s=1' where MarketId=1;
update Marketplaces set MarketImageUrl='https://images.unsplash.com/photo-1572402123736-c79526db405a?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1hcmtldHxlbnwwfHwwfHx8MA%3D%3D' where MarketId=2;
update Marketplaces set MarketImageUrl='https://www.schwab.com/sites/g/files/eyrktu1071/files/Getty_635946862_2x1.jpg' where MarketId=3;
update Marketplaces set MarketImageUrl='https://cdn.pixabay.com/photo/2024/02/19/07/54/farmers-local-market-8582783_640.jpg' where MarketId=4;
update Marketplaces set MarketImageUrl='https://www.treehugger.com/thmb/Ih1TNwrrqqzayy8NZ4XWK4aTK4s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/assorted-fruits-and-vegetables-at-the-farmer-s-market-in-vienna--austria-695527058-67c93b8f4ce345d097380b046b4e05a2.jpg' where MarketId=5;
update Marketplaces set MarketImageUrl='https://seoulsearching.net/wp-content/uploads/2021/01/img_7592b.jpg' where MarketId=6;

UPDATE Marketplaces SET MarketName = 'Kalupur Market', MarketLatitude = 23.0247, MarketLongitude = 72.6027, MarketAddress = 'Kalupur, Ahmedabad' WHERE MarketName = 'Shree Organic Farms';
UPDATE Marketplaces SET MarketName = 'Jamalpur Market', MarketLatitude = 23.0095, MarketLongitude = 72.5825, MarketAddress = 'Jamalpur, Ahmedabad' WHERE MarketName = 'Swastik Farm';
UPDATE Marketplaces SET MarketName = 'Shyamal Market', MarketLatitude = 23.0204, MarketLongitude = 72.5300, MarketAddress = 'Shyamal, Ahmedabad' WHERE MarketName = 'Ranip Market';
UPDATE Marketplaces SET MarketName = 'Geeta Mandir Market', MarketLatitude = 23.0170, MarketLongitude = 72.5736, MarketAddress = 'Astodia, Ahmedabad' WHERE MarketName = 'Organic Mandala';
UPDATE Marketplaces SET MarketName = 'Vasna Market Yard', MarketLatitude = 22.9996, MarketLongitude = 72.5600, MarketAddress = 'Vasna, Ahmedabad' WHERE MarketName = 'Farm Fresh India';
UPDATE Marketplaces SET MarketName = 'Naroda Vegetable Market', MarketLatitude = 23.0827, MarketLongitude = 72.6486, MarketAddress = 'Naroda, Ahmedabad' WHERE MarketName = 'Hariyali Farms';
--UPDATE Marketplaces SET MarketName = 'Raipur Market', MarketLatitude = 23.0225, MarketLongitude = 72.5705, MarketAddress = 'Raipur, Ahmedabad' WHERE MarketName = 'Swasthya Harvest';

CREATE TABLE Marketplaces (
    MarketId BIGSERIAL PRIMARY KEY,
    MarketName VARCHAR(100) NOT NULL,
    MarketDescription TEXT,
    MarketLatitude DECIMAL(10, 8) NOT NULL,
    MarketLongitude DECIMAL(11, 8) NOT NULL,
    MarketAddress VARCHAR(255) NOT NULL,
	MarketOpeningTime TIME,  
    MarketClosingTime TIME,
    MarketImageUrl VARCHAR(255),  -- New field for image URL
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN DEFAULT FALSE
);

INSERT INTO Marketplaces (MarketName, MarketDescription, MarketLatitude, MarketLongitude, MarketAddress, MarketOpeningTime, MarketClosingTime,MarketImageUrl)
VALUES 
    ('Kalupur Market', 'Organic fruits and vegetables directly from the farm.', 23.0247, 72.6027, 'Kalupur, Ahmedabad', '08:00', '18:00','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/d3/c2/93/popular-market.jpg?w=1200&h=-1&s=1'),
    ('Jamalpur Market', 'Fresh dairy products from grass-fed cows.', 23.0095, 72.5825, 'Jamalpur, Ahmedabad', '07:30', '17:30','https://images.unsplash.com/photo-1572402123736-c79526db405a?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1hcmtldHxlbnwwfHwwfHx8MA%3D%3D'),
    ('Shyamal Market', 'Locally grown organic produce.', 23.0204, 72.5300, 'Shyamal, Ahmedabad', '09:00', '19:00','https://www.schwab.com/sites/g/files/eyrktu1071/files/Getty_635946862_2x1.jpg'),
    ('Geeta Mandir Market', 'Family-owned farm offering organic produce.', 23.0170, 72.5736, 'Astodia, Ahmedabad', '08:30', '18:30','https://www.treehugger.com/thmb/Ih1TNwrrqqzayy8NZ4XWK4aTK4s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/assorted-fruits-and-vegetables-at-the-farmer-s-market-in-vienna--austria-695527058-67c93b8f4ce345d097380b046b4e05a2.jpg'),
    ('Vasna Market Yard', 'Delivering fresh farm produce to your doorstep.', 22.9996, 72.5600, 'Vasna, Ahmedabad', '10:00', '20:00','https://cdn.pixabay.com/photo/2024/02/19/07/54/farmers-local-market-8582783_640.jpg'),
    ('Naroda Vegetable Market', 'Sustainable farming with organic practices.', 23.0827, 72.6486, 'Naroda, Ahmedabad', '08:00', '18:00','https://seoulsearching.net/wp-content/uploads/2021/01/img_7592b.jpg');


CREATE TABLE ProductListings (
    ListingId BIGSERIAL PRIMARY KEY,
    SellerId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    ProductMeasureType VARCHAR(10) NOT NULL,
    --MarketId BIGINT NOT NULL,
    --ListingPrice DECIMAL(10, 2) NOT NULL,
    ListingQuantity DECIMAL(10,2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (SellerId) REFERENCES Users(UserId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
    --FOREIGN KEY (MarketId) REFERENCES Marketplaces(MarketId)
);
DROP TABLE ProductListings
CREATE TABLE Cart (
    CartId BIGSERIAL PRIMARY KEY,
    UserId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    --Quantity INT NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
drop table cart
---------------------------------------------------------------------------------------------------------
CREATE TABLE Orders (
    OrderId BIGSERIAL PRIMARY KEY,
    UserId BIGINT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    OrderStatus VARCHAR(50) DEFAULT 'Pending',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
CREATE TABLE OrderItems (
    OrderItemId BIGSERIAL PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    Quantity DECIMAL(10, 2) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
drop table Orders
drop table OrderItems
INSERT INTO Orders (OrderId, UserId, OrderDate, TotalAmount)
VALUES
    (1, 8, '2024-07-03', 240.00), -- Updated total amount
    (2, 8, '2024-07-04', 440.00), -- Updated total amount
    (3, 8, '2024-07-05', 230.00), -- Updated total amount
    (4, 8, '2024-07-06', 260.00); -- Updated total amount

INSERT INTO OrderItems (OrderItemId, OrderId, ProductId, Quantity, Price)
VALUES
    (1, 1, 1, 2, 120.00), -- Organic Apples
    (2, 1, 2, 1, 90.00), -- Fresh Carrots
    (3, 2, 3, 4, 50.00), -- Dairy Milk
    (4, 2, 4, 2, 150.00), -- Fresh Strawberries
    (5, 3, 5, 1, 80.00), -- Organic Broccoli
    (6, 3, 6, 3, 200.00), -- Fresh Oranges
    (7, 4, 7, 2, 70.00), -- Organic Tomatoes
    (8, 4, 8, 2, 60.00); -- Fresh Spinach

---------------------------------------------------------------------------------------------------------
CREATE TABLE Orders (
    OrderId BIGSERIAL PRIMARY KEY,
    UserId BIGINT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatusId BIGINT DEFAULT 1,
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (OrderStatusId) REFERENCES OrderStatuses(OrderStatusId)
);

CREATE TABLE OrderStatuses (
    OrderStatusId BIGSERIAL PRIMARY KEY,
    StatusName VARCHAR(20) UNIQUE NOT NULL
);

-- Insert order statuses
INSERT INTO OrderStatuses (StatusName) VALUES ('pending'), ('completed'), ('cancelled');

CREATE TABLE OrderItems (
    OrderItemId BIGSERIAL PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    Quantity INT NOT NULL,
    ItemPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE OrderHistory (
    OrderHistoryId BIGSERIAL PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    StatusChangedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PreviousStatusId BIGINT NOT NULL,
    NewStatusId BIGINT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (PreviousStatusId) REFERENCES OrderStatuses(OrderStatusId),
    FOREIGN KEY (NewStatusId) REFERENCES OrderStatuses(OrderStatusId)
);

CREATE TABLE OrderStatusHistory (
    StatusHistoryId BIGSERIAL PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    StatusId BIGINT NOT NULL,
    ChangedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (StatusId) REFERENCES OrderStatuses(OrderStatusId)
);
