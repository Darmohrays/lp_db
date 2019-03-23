
ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`);


CREATE DATABASE library CHARACTER SET utf8;
USE library;

CREATE TABLE `Customer` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`surname` VARCHAR(255) NOT NULL,
	`age` INT,
	`phone` VARCHAR(255) NOT NULL,
	`sex` BINARY,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Borrow` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`customer_id` INT NOT NULL,
	`time` DATE NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `Borrow_customer` FOREIGN KEY (`customer_id`) 
	REFERENCES `Customer`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `Book` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`description` TEXT NOT NULL,
	`year` INT,
	`pages` INT,
	`language` VARCHAR(255) NOT NULL,
	`publisher` VARCHAR(255),
	PRIMARY KEY (`id`)
);

CREATE TABLE `Genre` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Author` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`surname` VARCHAR(255) NOT NULL,
	`country` VARCHAR(255),
	`occupation` VARCHAR(255),
	`sex` BINARY,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Book_to_genre` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`book_id` INT NOT NULL,
	`genre_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `Book_to_genre_book_id` FOREIGN KEY (`book_id`) 
	REFERENCES `Book`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `Book_to_genre_genre_id` FOREIGN KEY (`genre_id`) 
	REFERENCES `Genre`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `Book_to_author` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`author_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `Book_to_author_author_id` FOREIGN KEY (`author_id`) 
	REFERENCES `Author`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `Book_to_author_fk1` FOREIGN KEY (`book_id`)
	REFERENCES `Book`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `Book_to_borrow` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`borrow_id` INT NOT NULL,
	`book_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `Book_to_borrow_order_id` FOREIGN KEY (`borrow_id`)
	REFERENCES `Borrow`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `Book_to_borrow_book_id` FOREIGN KEY (`book_id`)
	REFERENCES `Book`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
);