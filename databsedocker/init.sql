create database `schedulework` default character set utf8 collate utf8_general_ci;

use schedulework;

CREATE TABLE `login_user` (
  `nickname` varchar(16) NOT NULL,
  `head_image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `regist_time` date NOT NULL,
  `last_login_time` date NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
