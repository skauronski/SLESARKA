CREATE TABLE `Товары`(
    `product_id` CHAR(255) NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `unit_of_measure` VARCHAR(255) NOT NULL,
    `admin_id` INT NOT NULL,
    PRIMARY KEY(`product_id`)
);
ALTER TABLE
    `Товары` ADD INDEX `Товары_admin_id_index`(`admin_id`);
CREATE TABLE `Продажи`(
    `sales_id` INT NOT NULL,
    `client_id` INT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY(`sales_id`)
);
ALTER TABLE
    `Продажи` ADD INDEX `Продажи_client_id_index`(`client_id`);
CREATE TABLE `Клиенты`(
    `client_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `gender` CHAR(255) NOT NULL,
    `birthday` DATE NOT NULL,
    `phone_number` CHAR(12) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `total_purchases` DECIMAL(8, 2) NOT NULL,
    `rule_id` INT NOT NULL,
    PRIMARY KEY(`client_id`)
);
ALTER TABLE
    `Клиенты` ADD INDEX `Клиенты_rule_id_index`(`rule_id`);
CREATE TABLE `Администраторы`(
    `admin_id` INT NOT NULL,
    `admin_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`admin_id`)
);
CREATE TABLE `ПродажаТовара`(
    `sales_items_id` INT NOT NULL,
    `sales_id` INT UNSIGNED NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `price_of_sale` DECIMAL(8, 2) NOT NULL,
    `discount_id` BIGINT NOT NULL,
    PRIMARY KEY(`sales_items_id`)
);
ALTER TABLE
    `ПродажаТовара` ADD INDEX `ПродажаТовара_sales_id_index`(`sales_id`);
ALTER TABLE
    `ПродажаТовара` ADD INDEX `ПродажаТовара_product_id_index`(`product_id`);
ALTER TABLE
    `ПродажаТовара` ADD INDEX `ПродажаТовара_discount_id_index`(`discount_id`);
CREATE TABLE `Правила`(
    `rule_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rule_name` VARCHAR(255) NOT NULL,
    `condition_type` VARCHAR(255) NOT NULL,
    `conditon_value` DECIMAL(8, 2) NOT NULL,
    `status_to_assign` VARCHAR(255) NOT NULL
);
CREATE TABLE `Скидки`(
    `discount_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `discount_name` VARCHAR(255) NOT NULL,
    `discount_value` DECIMAL(8, 2) NOT NULL,
    `status_required` VARCHAR(255) NOT NULL
);
CREATE TABLE `Статусы заказа`(
    `payment status_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `status_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Виды доставки`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Пункты самовывоза`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Адреса доставки`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Корзины товаров`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Товары в Корзине`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `shopping_cart_id` BIGINT NOT NULL,
    `product_id` INT NOT NULL
);
ALTER TABLE
    `Товары в Корзине` ADD INDEX `Товары в Корзине_shopping_cart_id_index`(`shopping_cart_id`);
ALTER TABLE
    `Товары в Корзине` ADD INDEX `Товары в Корзине_product_id_index`(`product_id`);
CREATE TABLE `Склад`(
    `product_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `quantity_in _stock` INT NOT NULL
);
CREATE TABLE `Платежи`(
    `payment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `payment_date` DATETIME NOT NULL
);
ALTER TABLE
    `Товары в Корзине` ADD CONSTRAINT `Товары в Корзине_shopping_cart_id_foreign` FOREIGN KEY(`shopping_cart_id`) REFERENCES `Корзины товаров`(`id`);
ALTER TABLE
    `Товары в Корзине` ADD CONSTRAINT `Товары в Корзине_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Товары`(`product_id`);
ALTER TABLE
    `ПродажаТовара` ADD CONSTRAINT `ПродажаТовара_sales_id_foreign` FOREIGN KEY(`sales_id`) REFERENCES `Продажи`(`sales_id`);
ALTER TABLE
    `ПродажаТовара` ADD CONSTRAINT `ПродажаТовара_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Товары`(`product_id`);
ALTER TABLE
    `Продажи` ADD CONSTRAINT `Продажи_client_id_foreign` FOREIGN KEY(`client_id`) REFERENCES `Клиенты`(`client_id`);
ALTER TABLE
    `Клиенты` ADD CONSTRAINT `Клиенты_rule_id_foreign` FOREIGN KEY(`rule_id`) REFERENCES `Правила`(`rule_id`);
ALTER TABLE
    `Товары` ADD CONSTRAINT `Товары_admin_id_foreign` FOREIGN KEY(`admin_id`) REFERENCES `Администраторы`(`admin_id`);
ALTER TABLE
    `ПродажаТовара` ADD CONSTRAINT `ПродажаТовара_discount_id_foreign` FOREIGN KEY(`discount_id`) REFERENCES `Скидки`(`discount_id`);