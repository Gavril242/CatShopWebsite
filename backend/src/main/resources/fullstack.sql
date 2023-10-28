-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2023 at 09:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fullstack`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `total_price` decimal(38,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `total_price`, `user_id`) VALUES
(1, NULL, 1),
(2, 0.00, 2),
(3, NULL, 3),
(1195, 30.00, 52),
(1196, 0.00, 102);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sub_total` decimal(38,2) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `price`, `product_id`, `product_name`, `quantity`, `sub_total`, `cart_id`) VALUES
(30, 30.00, 3, 'Bloop The Snoop', 1, 30.00, 1195);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(28);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `total` decimal(38,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date_created`, `total`, `user_id`) VALUES
(7, '2023-10-21 23:00:01.000000', 20.00, 2),
(8, '2023-10-21 23:01:28.000000', 340.00, 2),
(9, '2023-10-21 23:03:36.000000', 500.00, 2),
(10, '2023-10-21 23:34:37.000000', 10.00, 52),
(11, '2023-10-24 13:22:17.000000', 99.99, 52),
(12, '2023-10-24 14:58:50.000000', 234.99, 52),
(14, '2023-10-24 19:16:58.000000', 234.99, 102);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
(5, NULL, 1, NULL, 2),
(6, NULL, 5, NULL, 2),
(7, NULL, 5, NULL, 2),
(8, NULL, 1, NULL, 1),
(9, NULL, 1, NULL, 4),
(10, NULL, 1, NULL, 402),
(11, NULL, 4, NULL, 2),
(12, NULL, 1, NULL, 402),
(13, NULL, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `description`, `img_url`, `name`, `price`) VALUES
(1, 'Popular Meme', 'https://worldcatcomedy.com/wp-content/uploads/2020/02/maxresdefault-23.jpg', 'You Can Get Away With IT!', 9.99),
(2, 'Miguel', 'https://i.ytimg.com/vi/W8mxWpLWGMs/hqdefault.jpg', 'Miguel', 20.00),
(4, 'The most down to earth reaction', 'https://i.ibb.co/6gJVXxN/Whats-App-Image-2023-10-13-at-10-20-42-b0633217.jpg', 'My Honest Reaction', 99.99),
(402, 'He comin\'', 'https://media.makeameme.org/created/oh-lawd-he-5c58f6.jpg', 'Ah, Lawd!', 234.99),
(506, 'Monday left me broken\nTuesday, I was through with hoping\nWednesday, my empty arms were open\nThursday, waiting for love, waiting for love', 'https://i.ytimg.com/vi/TBTj4vdtqbg/hq2.jpg?sqp=-oaymwEoCOADEOgC8quKqQMcGADwAQH4AeICgALgA4oCDAgAEAEYZSBgKEgwDw==&rs=AOn4CLC5Dg6tkGRe-Mv5whnuXwU_0FfBQA', 'Monday Left Me Broken', 999999999.00),
(507, 'ye', 'https://preview.redd.it/thats-not-nice-v0-vbzw5yfiifwb1.jpg?auto=webp&s=5804f2b00e20e1b58e5a55f39cc2ea44e9b20374', 'Cat in da hood', 23.00),
(508, 'he is', 'https://preview.redd.it/kg5c36f1nfwb1.jpg?auto=webp&s=95fe8b15932229cac7cc52ad6cf5b02224dca433', 'Im batman', 43.00),
(509, 'yes', 'https://preview.redd.it/i-made-this-with-my-cat-v0-1n3ccx9k49wb1.jpg?width=1080&crop=smart&auto=webp&s=387a93055b1a9722f245ae9a471a6c661db5efa0', 'Serious catto', 23.00),
(510, 'indeed', 'https://preview.redd.it/definitely-v0-p262zuq34bwa1.jpg?width=1080&crop=smart&auto=webp&s=18b151a4078ca8ecca8eb5e3f99e3645b080358c', 'Evil cat', 324.00),
(511, 'very smol', 'https://preview.redd.it/cd1bakcm2rva1.jpg?auto=webp&s=63203b657951bd86828b0e2bd0ff0b9253e74d90', 'Smol evil cat', 3421.00),
(512, 'hu?', 'https://preview.redd.it/mozgvwdt2rva1.jpg?auto=webp&s=dedd5def2b744982dc7666ea663bc90a2029e77b', 'Huh?', 32.00),
(513, 'very silly', 'https://preview.redd.it/0fkaw25q2rva1.jpg?auto=webp&s=b44115f09624b004867d65a2fd7b5c8bfbe0e5e8', 'Most silly of them all', 234232.00);

-- --------------------------------------------------------

--
-- Table structure for table `products_seq`
--

CREATE TABLE `products_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_seq`
--

INSERT INTO `products_seq` (`next_val`) VALUES
(601);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`) VALUES
(1, 'lmao@gmail.com', 'lmao'),
(2, 'products@gmail.com', '$2a$10$nH5YDPP5quRQPtPBFSkzZOAC8MpWysSA0A8s1upqmWohtYuUOaqIS'),
(31, 'user2@example.com', 'password'),
(52, 'miaw@gmail.com', '$2a$10$qW40fCduvGLpdId7niGre.iF3RvcKvPj4xxfZaNW6ZKclA0xcXHDC'),
(102, 'm@gmail.com', '$2a$10$PC9g7ICkuaN/fzHXjy0Ivea4l6B0bdcgX1Cx9ClkKQQNnikm4T1tK'),
(152, 'h@gmail.com', '$2a$10$E.HpzqWYkGaH94dnTljm2uwshcVK3WaFJSjjZZfjNKiWSdkhKjfd2'),
(153, 'l@gmail.com', '$2a$10$QjHdjNbifr2vyqyNhGBKK.wFzlszf7ONcn63helkCJK8ImN2ULJt.'),
(202, '3@m.com', '$2a$10$544XX35PEWuvbACDWgw8AuahaUsoI2o4ECCZFcL6VHxp8QV1jWt6K');

-- --------------------------------------------------------

--
-- Table structure for table `users_seq`
--

CREATE TABLE `users_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_seq`
--

INSERT INTO `users_seq` (`next_val`) VALUES
(301);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` bigint(20) NOT NULL,
  `authority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `authority`) VALUES
(0, 'USER'),
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles_seq`
--

CREATE TABLE `user_roles_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles_seq`
--

INSERT INTO `user_roles_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_junction`
--

CREATE TABLE `user_role_junction` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role_junction`
--

INSERT INTO `user_role_junction` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(52, 1),
(102, 0),
(152, 0),
(153, 0),
(202, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_role_junction`
--
ALTER TABLE `user_role_junction`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKlueexpmlb0nyjv72qp9vmr1cx` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1197;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_role_junction`
--
ALTER TABLE `user_role_junction`
  ADD CONSTRAINT `FK5aqfsa7i8mxrr51gtbpcvp0v1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKlueexpmlb0nyjv72qp9vmr1cx` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
