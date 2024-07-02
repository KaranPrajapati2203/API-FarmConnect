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
    ProductPrice DECIMAL(10, 2) NOT NULL,
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

INSERT INTO Products (ProductName, ProductDescription, ProductPrice, ProductTypeId, ProductMeasureType, ProductImage, MaxQuantity, AvailableQuantity, IsAvailable)
VALUES
('Organic Apples', 'Fresh and juicy organic apples from local farms.', 120, 1, 'kg', 'https://www.shimlafarms.com/cdn/shop/products/Redapple3.png?v=1675785288&width=1445', 0, 500, TRUE),
('Fresh Carrots', 'Crisp and sweet carrots grown with love.', 90, 2, 'kg', 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/usa-new-york-city-carrots-for-sale-tetra-images.jpg', 0, 500, TRUE),
('Dairy Milk', 'Pure and fresh milk from grass-fed cows.', 50, 3, 'L', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLbH-mTn8P736RPcSHkV16rhLF1vZvStQMg&s', 0, 500, TRUE),
('Fresh Strawberries', 'Sweet and juicy strawberries freshly picked.', 150, 1, 'kg', 'https://d3fwccq2bzlel7.cloudfront.net/Pictures/480xany/5/8/8/35588_2_1203853_e.jpg', 0, 500, TRUE),
('Organic Broccoli', 'Healthy and fresh organic broccoli.', 80, 2, 'kg', 'https://s.alicdn.com/@sc04/kf/A4f577b2659534d3292fd568d359d9cc5j.jpg_300x300.jpg', 0, 500, TRUE),
('Fresh Oranges', 'Fresh and juicy oranges.', 200, 1, 'kg', 'https://tacomaboys.com/wp-content/uploads/2020/04/TB-27-8701-1024x588.jpg', 0, 500, TRUE),
('Organic Tomatoes', 'Ripe and juicy organic tomatoes.', 70, 2, 'kg', 'https://i.cdn.newsbytesapp.com/images/l29720230821154142.jpeg', 0, 500, TRUE),
('Fresh Spinach', 'Leafy green spinach, rich in nutrients.', 60, 2, 'kg', 'https://www.bigbasket.com/media/uploads/p/xxl/40200226_1-farmogo-spinach-hydroponically-grown.jpg', 0, 500, TRUE),
('Grapes', 'Sweet and juicy organic grapes.', 140, 1, 'kg', 'https://upload.wikimedia.org/wikipedia/commons/3/36/Kyoho-grape.jpg', 0, 500, TRUE);

DROP TABLE products
DROP TABLE Marketplaces
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
    ('Shree Organic Farms', 'Organic fruits and vegetables directly from the farm.', 22.9873, 72.5095, 'Ahmedabad, Gujarat', '08:00', '18:00','https://cff2.earth.com/uploads/2023/05/16064103/Farms-scaled.jpg'),
    ('Swastik Farm', 'Fresh dairy products from grass-fed cows.', 23.0225, 72.5714, 'Ahmedabad, Gujarat', '07:30', '17:30','https://ec.europa.eu/eurostat/documents/4187653/16403426/Martin%20Bergsma_Shutterstock_287378714_RV.jpg'),
    ('Swasthya Harvest', 'Locally grown organic produce.', 22.3177, 73.1764, 'Vadodara, Gujarat', '09:00', '19:00','https://live.staticflickr.com/65535/50881797506_176f3d534f_z.jpg'),
    ('Organic Mandala', 'Family-owned farm offering organic produce.', 21.7051, 72.9959, 'Surat, Gujarat', '08:30', '18:30','https://www.shutterstock.com/image-photo/thoroughbred-horses-grazing-sunset-field-600nw-1412323913.jpg'),
    ('Farm Fresh India', 'Delivering fresh farm produce to your doorstep.', 22.2587, 71.1924, 'Rajkot, Gujarat', '10:00', '20:00','https://static8.depositphotos.com/1086305/849/i/450/depositphotos_8495323-stock-photo-american-country.jpg'),
    ('Hariyali Farms', 'Sustainable farming with organic practices.', 22.3072, 73.1812, 'Anand, Gujarat', '08:00', '18:00','https://media.licdn.com/dms/image/D561BAQGIQhJMe9algQ/company-background_10000/0/1660545021462/frams_by_a_cover?e=2147483647&v=beta&t=v2jdEkSstoRiWxv5eVJzrcIr1DMlGUR5Q_RUpiW-U1E');


CREATE TABLE ProductListings (
    ListingId BIGSERIAL PRIMARY KEY,
    SellerId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    --MarketId BIGINT NOT NULL,
    --ListingPrice DECIMAL(10, 2) NOT NULL,
    ListingQuantity INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (SellerId) REFERENCES Users(UserId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
    --FOREIGN KEY (MarketId) REFERENCES Marketplaces(MarketId)
);

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
