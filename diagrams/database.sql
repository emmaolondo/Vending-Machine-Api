CREATE TABLE `products` (
  `id` int UNIQUE PRIMARY KEY DEFAULT 123 COMMENT 'Number',
  `product_name` varchar(255),
  `product_category` varchar(255),
  `cost` numeric(8,2),
  `product_Quantity` int,
  `product_Unit_of_Measure` varchar(255),
  `seller_id` int,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime,
  `deleted_at` datetime
);

CREATE TABLE `productCategory` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL
);

CREATE TABLE `deposits` (
  `buyerId` int,
  `product_id` int,
  `Amount` numeric(8,2) NOT NULL,
  `product_quantity` int NOT NULL,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `username` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp,
  `Email_address` varchar(255),
  `Role` varchar(255)
);

CREATE TABLE `countries` (
  `code` int PRIMARY KEY,
  `name` varchar(255),
  `continent_name` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

ALTER TABLE `products` ADD FOREIGN KEY (`id`) REFERENCES `productCategory` (`category_id`);

ALTER TABLE `deposits` ADD FOREIGN KEY (`buyerId`) REFERENCES `users` (`id`);

ALTER TABLE `deposits` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
